#!/bin/bash

SCRIPT_DIR=$(realpath $(dirname "$0"))

docker_build() {
    docker build -t oe-env \
        --build-arg USER="${USER}" \
        --build-arg USERID="$(id -u)" \
        --build-arg GROUPID="$(id -g)" \
        ${SCRIPT_DIR}/docker
}

docker_run() {
    docker run --rm -it -u $(id -u):$(id -g) --network=host \
        -v "$HOME"/.ssh:"${HOME}"/.ssh \
        -v ${SCRIPT_DIR}:/workspace \
        -v /opt/oe:/opt/oe \
        --workdir /workspace \
        oe-env /bin/bash
}

build() {
    BOARD="$1"
    kas shell "kas-${BOARD}-project.yml" -c "bitbake core-image-minimal -c clean"
    kas shell "kas-${BOARD}-project.yml" -c "bitbake core-image-minimal"
    kas shell "kas-${BOARD}-project.yml" -c "bitbake core-image-minimal -c populate_sdk"
    kas shell "kas-${BOARD}-project.yml" -c "bitbake -k world"
    kas shell "kas-${BOARD}-project.yml" -c "bitbake package-index"
}

if [ -z "$1" ]; then
    build bbb
    build rpi0w
    build x86-64
else
    "$@"
fi
