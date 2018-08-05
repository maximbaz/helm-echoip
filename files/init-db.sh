#!/bin/sh

echo "Waiting for 4 GeoDB files to be available in /db-shared"
while [  $(find /db-shared -maxdepth 1 -type f | wc -l) != 4 ]; do
    sleep 1
done

echo "Copying GeoDB files from /db-shared to /db"
cp /db-shared/Geo* /db

echo "Initialization complete"
