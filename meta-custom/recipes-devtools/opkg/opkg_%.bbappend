FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:class-nativesdk = " \
    file://environment.d-opkg.sh \
"

FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/opkg.sh"

do_install:append:class-nativesdk() {
    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
    install -m 644 ${WORKDIR}/environment.d-opkg.sh ${D}${SDKPATHNATIVE}/environment-setup.d/opkg.sh
}
