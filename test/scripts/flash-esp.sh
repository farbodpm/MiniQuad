#!/usr/bin/env bash

set -e

sudo chmod 777 /dev/tty*

BUILD_MODE=""
case "$1" in
    ""|"release")
        bash scripts/build.sh
        BUILD_MODE="release"
        ;;
    "debug")
        bash scripts/build.sh debug
        BUILD_MODE="debug"
        ;;
    *)
        echo "Wrong argument. Only \"debug\"/\"release\" arguments are supported"
        exit 1;;
esac

export ESP_ARCH=xtensa-esp32s3-espidf

espflash ../../../target/xtensa-esp32s3-espidf/release/e200 --partition-table partitions.csv 
