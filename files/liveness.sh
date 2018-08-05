#!/bin/sh

set -e

url="http://localhost:$1/health"
if ! wget -q --spider --tries=1 "$url"; then
    exit 2
fi

city_md5="GeoLite2-City.mmdb.md5"
country_md5="GeoLite2-Country.mmdb.md5"

[ ! -f "$city_md5" ] && cp "/db/$city_md5" .
[ ! -f "$country_md5" ] && cp "/db/$country_md5" .

if grep -Fxvf "$city_md5" "/db/$city_md5" || grep -Fxvf "$country_md5" "/db/$country_md5"; then
    echo "db differs, time to upgrade"
    exit 3
fi
