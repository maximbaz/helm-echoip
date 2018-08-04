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
}

cd /db
download "GeoLite2-City"
download "GeoLite2-Country"
