FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://g_ether.conf \
    file://usb0.network \
"

FILES_${PN} += " \
    ${sysconfdir}/modules-load.d/g_ether.conf \
    ${sysconfdir}/systemd/network/usb0.network \
"

do_install_append() {
    install -d ${D}${sysconfdir}/modules-load.d
    install -d ${D}${sysconfdir}/systemd/network
    install -m 0644 ${WORKDIR}/usb0.network ${D}${sysconfdir}/systemd/network
    install -m 0644 ${WORKDIR}/g_ether.conf ${D}${sysconfdir}/modules-load.d
}
