#!/bin/sh

dir="/db-shared"
cd "$dir" || exit 2

if [ "$1" = "init" ] && [ -f GeoLite2-City.mmdb ] && [ -f GeoLite2-Country.mmdb ]; then
    exit 0
fi

procdir="$(mktemp -d -p "$dir")"
cd "$procdir" || exit 3

download() {
    url="http://geolite.maxmind.com/download/geoip/database"
    target="$1"
    archive="$1.tar.gz"

    tmpdir="$(mktemp -d -p "$procdir")"
    cd "$tmpdir" || exit 4

    wget "$url/$archive"
    tar -xvzf "$archive"
    mv "$target"*/*.mmdb "$procdir"

    cd "$procdir" || exit 5
    rm -rf "$tmpdir"
    md5sum "$target.mmdb" > "$target.mmdb.md5"
}

download "GeoLite2-City"
download "GeoLite2-Country"
mv ./* "$dir"

cd "$dir" || exit 6
rm -rf "$procdir"
