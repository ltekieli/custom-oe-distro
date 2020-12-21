export OPKG_CONF_DIR="/etc/opkg"
export OFFLINE_ROOT="$SDKTARGETSYSROOT"

if ! grep -q "^option cache_dir" "$SDKTARGETSYSROOT/etc/opkg/opkg.conf"; then
    echo "option cache_dir /var/cache/opkg" >> "$SDKTARGETSYSROOT/etc/opkg/opkg.conf"
fi

if ! grep -q "^option info_dir" "$SDKTARGETSYSROOT/etc/opkg/opkg.conf"; then
    echo "option info_dir /var/lib/opkg/info" >> "$SDKTARGETSYSROOT/etc/opkg/opkg.conf"
fi

if ! grep -q "^option status_file" "$SDKTARGETSYSROOT/etc/opkg/opkg.conf"; then
    echo "option status_file /var/lib/opkg/status" >> "$SDKTARGETSYSROOT/etc/opkg/opkg.conf"
fi

if ! grep -q "^option ignore_uid" "$SDKTARGETSYSROOT/etc/opkg/opkg.conf"; then
    echo "option ignore_uid true" >> "$SDKTARGETSYSROOT/etc/opkg/opkg.conf"
fi
