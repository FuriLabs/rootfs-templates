#!/bin/sh

configure_prevent_flashing() {
	mkdir -p /etc/flash-bootimage
	cat > /etc/flash-bootimage/01prevent-flashing <<EOF
FLASH_BOOTIMAGE=no
EOF
}

deconfigure_prevent_flashing() {
	rm -f /etc/flash-bootimage/01prevent-flashing
}

case "${1}" in
	"configure")
		configure_prevent_flashing
		;;
	"deconfigure")
		deconfigure_prevent_flashing
		;;
	*)
		echo "USAGE: ${0} configure|deconfigure"
		exit 1
		;;
esac
