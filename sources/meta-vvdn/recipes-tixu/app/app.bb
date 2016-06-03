#
#	Filename:- app.bb
#
#	Description:- bitbake recipe for wlan to zigbee interface
#
LICENSE = "CLOSED"

inherit autotools 

SRC_URI="file://app-1.0.tar.gz"
S="${WORKDIR}/"
INSANE_SKIP_${PN} = "already-stripped ldflags libdir"
INSANE_SKIP_${PN}-dev = "ldflags"
INSANE_SKIP_${PN}-dbg += "libdir"
do_compile(){
	cd ${BSPDIR}/sources/meta-vvdn/recipes-tixu/app/
	sh zigbee.sh
	cd ${WORKDIR}/app-1.0/build
	make setup
	make app
}

do_install(){
	cp ${D}/../app-1.0/build/staging/install/* ${D} -rf
}

FILES_${PN} += "/home/*"
FILES_${PN} += "/etc/*"
FILES_${PN} += "/opt/*"
FILES_${PN} += "/lib/*"
FILES_${PN} += "/sbin/*"
FILES_${PN} += "/usr/*"
FILES_${PN} += "/var/*"
FILES_${PN} += "/usr/lib"
FILES_${PN} += "/usr/lib/lib*.so.*"
FILES_${PN}-dbg += "/var/www/html/cgi-bin/.debug"
FILES_${PN}-dbg += "/usr/local/lib/.debug"
FILES_${PN}-dbg += "/usr/local/sbin/.debug"
#FILES_${PN}-dbg += "/home/root/ble/.debug"
FILES_${PN}-dbg += "/opt/zbha/bin/.debug"
FILES_${PN}-dbg += "/opt/tixu/bin/.debug"
FILES_${PN}-dbg += "/home/root/zigbee/app/.debug"
FILES_${PN}-dbg += "/home/root/zigbee/servers/.debug"
FILES_${PN}-dbg += "/home/root/zigbee/protobuf/.debug"
FILES_${PN}-dbg += "/home/root/zigbee-wlan/servers/.debug"
