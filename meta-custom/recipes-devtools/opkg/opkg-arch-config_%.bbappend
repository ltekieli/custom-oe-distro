do_compile:append() {
	mkdir -p ${S}/${sysconfdir}/opkg/

	feedconf=${S}/${sysconfdir}/opkg/sdk-feed.conf

	rm -f $feedconf
    feeds="${PACKAGE_FEED_URIS}"
	ipkgarchs="${PACKAGE_ARCHS}"
    for feed in $feeds; do
    	for arch in $ipkgarchs; do
	    	echo "src/gz $arch $feed/$arch" >> $feedconf
    	done
    done
}
