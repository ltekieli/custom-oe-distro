SRC_URI_remove = " file://udhcpd.rules"

RDEPENDS_${PN}-network += " \
    bc \
    devmem2 \
"

FILES_${PN}-network_remove = " ${sysconfdir}/udev/rules.d/udhcpd.rules"
