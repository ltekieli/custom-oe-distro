#!/bin/bash

build() {
    BOARD="$1"
    kas shell "kas-${BOARD}-project.yml" -c "bitbake core-image-minimal -c clean"
    kas shell "kas-${BOARD}-project.yml" -c "bitbake core-image-minimal"
    kas shell "kas-${BOARD}-project.yml" -c "bitbake core-image-minimal -c populate_sdk"
    kas shell "kas-${BOARD}-project.yml" -c "bitbake -k world"
    kas shell "kas-${BOARD}-project.yml" -c "bitbake package-index"
}

build bbb
build rpi0w
build x86-64
