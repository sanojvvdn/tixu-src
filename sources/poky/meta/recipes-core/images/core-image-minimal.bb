SUMMARY = "A small image just capable of allowing a device to boot."

IMAGE_INSTALL = "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${CORE_IMAGE_EXTRA_INSTALL} bluez4 openssh obexftp openobex hostap-daemon-wl18xx ti-compat-wireless-wlconf wl18xx-firmware wireless-tools uim bt-firmware bridge-utils wlconf iw wpa-supplicant app led dhry gpio-reset"

IMAGE_LINGUAS = " "

LICENSE = "MIT"

IMAGE_INSTALL_append += " kernel-modules"

inherit core-image

IMAGE_ROOTFS_SIZE ?= "8192"
IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "" ,d)}"
