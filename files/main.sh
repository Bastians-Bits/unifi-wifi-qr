#!/bin/bash

# Check if all necessary env vars are set
if [ -z "${CONTROLLER_URL}" ]; then echo "Controller Url not set"; exit 1; fi
if [ -z "${API_KEY}" ]; then echo "Api Key not set"; exit 1; fi
if [ -z "${WIFI_SID}" ]; then echo "Wifi Sid not set"; exit 1; fi
