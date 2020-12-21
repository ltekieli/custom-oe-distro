FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append_class-nativesdk = " \
    file://environment.d-opkg.sh \
"

FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/opkg.sh"

do_install_append_class-nativesdk() {
    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
    install -m 644 ${WORKDIR}/environment.d-opkg.sh ${D}${SDKPATHNATIVE}/environment-setup.d/opkg.sh
}
