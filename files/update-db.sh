#!/bin/sh

download() {
    url="http://geolite.maxmind.com/download/geoip/database"
    target="$1"
    archive="$1.tar.gz"

    mkdir tmp
    cd tmp

    wget "$url/$archive"
    tar -xvzf "$archive"
    mv $target*/*.mmdb ../

    cd ..
    rm -r tmp
    md5sum "$target.mmdb" > "$target.mmdb.md5"
}

cd /db

if [ "$1" = "init" -a -f GeoLite2-City.mmdb -a -f GeoLite2-Country.mmdb ]; then
    exit 0
fi

download "GeoLite2-City"
download "GeoLite2-Country"
