#!/bin/sh

echo "Init DB started"
while [  $(find /db-shared -maxdepth 1 -type f | wc -l) != 4 ]; do
    echo "Waiting for 4 GeoDB files to be available in /db-shared"
    sleep 5
done

echo "Copying GeoDB files from /db-shared to /db"
cp /db-shared/* /db

echo "Init DB completed"
