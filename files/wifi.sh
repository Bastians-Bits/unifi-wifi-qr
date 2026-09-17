#!/bin/bash
function query_wifi_id() {
    local resp=$(curl -k -X GET "https://${CONTROLLER_URL}/proxy/network/integration/v1/sites/${site_id}/wifi/broadcasts" \
    -H "X-API-KEY: ${API_KEY}" \
    -H 'Accept: application/json' \
    -w '\n%{http_code}')

    local resp_code=${resp: -3}

    if [ "${resp_code}" -ne "200" ]; then
        echo "Could not query the Api. Please verify the inputs and that the controller is available."
        exit 1
    fi
    resp=${resp:0:$((${#resp}-4))}

    wifi_id=$(echo "${resp}" | jq -r --arg sid "${WIFI_SID}" '.data[] | select(.name==$sid) | .id' )

    if [ -z "${wifi_id}" ]; then
        echo "There is no wifi with the name ${WIFI_SID}"
        exit 1
    fi
}

function query_wifi() {
    local resp=$(curl -k -X GET "https://${CONTROLLER_URL}/proxy/network/integration/v1/sites/${site_id}/wifi/broadcasts/${wifi_id}" \
    -H "X-API-KEY: ${API_KEY}" \
    -H 'Accept: application/json' \
    -w '\n%{http_code}')

    local resp_code=${resp: -3}

    if [ "${resp_code}" -ne "200" ]; then
        echo "Could not query the Api. Please verify the inputs and that the controller is available."
        exit 1
    fi
    wifi=${resp:0:$((${#resp}-4))}
}

function wifi_password() {
    wifi_password=$(echo "${wifi}" | jq -r '.securityConfiguration.passphrase')
}