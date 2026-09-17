#/bin/bash

function query_site_id() {
    # Verify Controller and Api Key are working
    local resp=$(curl -k -X GET "https://${CONTROLLER_URL}/proxy/network/integration/v1/sites" \
        -H "X-API-KEY: ${API_KEY}" \
        -H 'Accept: application/json' \
        -w '\n%{http_code}')

    local resp_code=${resp: -3}
    
    if [ "${resp_code}" -ne "200" ]; then
        echo "Could not query the Api. Please verify the inputs and that the controller is available."
        exit 1
    fi
    resp=${resp:0:$((${#resp}-4))}

    local sites_count=$(echo "${resp}" | jq -r '.data | length')

    if [ ${sites_count} -ne 1 ] && [ -z ${SITE+x} ]; then
        echo "If multiple sites are available, the environment variable SITE has to be set."
        exit 1
    fi

    if [ ${sites_count} -eq 1 ]; then # Only on site
        site_id=$(echo "${resp}" | jq -r '.data[0].id')
    else # Multiple sites, use selector
        site_id=$(echo "${resp}" | jq -r --arg site "${SITE}" '.data[] | select(.name==$site) | .id')
    fi
}

