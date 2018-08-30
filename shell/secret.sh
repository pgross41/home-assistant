#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Usage: secret secret_key'
    exit 0
fi

cat /usr/share/hassio/homeassistant/secrets.yaml | grep ^$1: | grep -oP '(?<=:).*' | sed 's/ //g'