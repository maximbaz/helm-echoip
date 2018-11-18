#!/bin/sh

set -e

url="http://localhost:$1/health"
if ! wget -q --spider --tries=1 "$url"; then
    echo "Health endpoint is unavailable, restart is needed"
    exit 2
fi

city_md5="GeoLite2-City.mmdb.md5"
country_md5="GeoLite2-Country.mmdb.md5"

if grep -Fxvf "/db-shared/$city_md5" "/db/$city_md5" || grep -Fxvf "/db-shared/$country_md5" "/db/$country_md5"; then
    echo "GeoDB files were updated, a restart is needed"
    exit 3
fi
