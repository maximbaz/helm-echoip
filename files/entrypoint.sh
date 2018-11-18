#!/bin/sh

while getopts "grpl:t:h:" opt; do
    case $opt in
        g) geoDb='--country-db=/db/GeoLite2-Country.mmdb --city-db=/db/GeoLite2-City.mmdb' ;;
        r) reverseLookup='--reverse-lookup' ;;
        p) portLookup='--port-lookup' ;;
        l) listenAddr="--listen=${OPTARG#"${OPTARG%%[![:space:]]*}"}" ;;
        t) templateFilePath="--template-file=${OPTARG#"${OPTARG%%[![:space:]]*}"}" ;;
        h) trustedHeader="--trusted-header=${OPTARG#"${OPTARG%%[![:space:]]*}"}" ;;
    esac
done

[ -n "$geoDb" ] && /tools/init-db.sh
echo /opt/echoip $geoDb $listenAddr $reverseLookup $portLookup $templateFilePath $trustedHeader
/opt/echoip $geoDb $listenAddr $reverseLookup $portLookup $templateFilePath $trustedHeader
