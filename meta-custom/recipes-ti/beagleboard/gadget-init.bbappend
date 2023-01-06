SRC_URI:remove = " file://udhcpd.rules"

RDEPENDS:${PN}-network += " \
    bc \
    devmem2 \
"

FILES:${PN}-network:remove = " ${sysconfdir}/udev/rules.d/udhcpd.rules"
