#!/bin/sh

echo "Update DB started"
dir="/db-shared"
cd "$dir" || exit 2

procdir="$(mktemp -d -p "$dir")"
cd "$procdir" || exit 3

download() {
    url="http://geolite.maxmind.com/download/geoip/database"
    target="$1"
    archive="$1.tar.gz"
    echo "Preparing to download: $target"

    tmpdir="$(mktemp -d -p "$procdir")"
    cd "$tmpdir" || exit 4

    echo "Downloading: $url/$archive"
    wget "$url/$archive"
    tar -xvzf "$archive"
    mv "$target"*/*.mmdb "$procdir"

    echo "Finalizing download: $target"
    cd "$procdir" || exit 5
    rm -rf "$tmpdir"
    md5sum "$target.mmdb" > "$target.mmdb.md5"
}

download "GeoLite2-City"
download "GeoLite2-Country"
mv ./* "$dir" || exit 6

cd "$dir" || exit 7
rm -rf "$procdir"
echo "Update DB completed"
