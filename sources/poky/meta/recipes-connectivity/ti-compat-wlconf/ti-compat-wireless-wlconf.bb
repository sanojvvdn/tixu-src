DESCRIPTION = "compat wlconf binary"
SECTION = "Applications"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

INHIBIT_PACKAGE_STRIP = "1"

SRCREV_default_pn-ti-compat="master"

RDEPENDS_${PN} = "bluez4 obexd openobex"
DEPENDS = "libffi glib-2.0 dbus-glib"

SRC_URI = "	file://WL8_System_parameters.ini \
		file://calibrator \
		file://wl18xx-fw-4.bin \
		file://libnl.so.2 \
		file://libnl-genl.so.2 \
		file://hostapd \
		file://hostapd.conf \
		file://udhcpd.conf \
		file://libiconv.so.2 \
		file://board_cal.sh \
		file://board_wlan.sh \
		file://wlan_run \
		file://tixu_AP_en.sh \
		file://bt-device \
		file://bt_start.sh \
		file://bt_stop.sh \
		file://wifi_stop.sh \
		file://obexd \
		file://wlan_eth_bridge_create.sh \
		file://zigbee_stop.sh \
		file://hostapd_open.conf \ 
		file://zigbee_wlan_bridge.sh \
		file://blinking.sh \
           "
S = "${WORKDIR}"
do_compile() {
}
do_install() {
	install -d ${D}${libdir}
        install -d ${D}${bindir}
        install -d ${D}${sysconfdir}
	install -d ${D}${sysconfdir}/init.d
	install -d ${D}${sysconfdir}/rcS.d
        install -d ${D}${sbindir}/wlconf
        install -d ${D}${sbindir}/wlconf/official_inis
        install -d ${D}${sbindir}/wlconf/firmware
        install -d ${D}${sbindir}/wlconf/scripts
	install -d ${D}${base_bindir}

	install -m 0755 ${WORKDIR}/wlan_run ${D}${sysconfdir}/init.d
	ln -sf  ../init.d/wlan_run ${D}${sysconfdir}/rcS.d/S57wlan_run
	
        cp ${WORKDIR}/libnl.so.2 ${D}${libdir}
        cp ${WORKDIR}/libnl-genl.so.2 ${D}${libdir}
        cp ${WORKDIR}/libiconv.so.2 ${D}${libdir}
       
        cp ${WORKDIR}/hostapd.conf ${D}${sysconfdir}
	cp ${WORKDIR}/hostapd_open.conf ${D}${sysconfdir}
        cp ${WORKDIR}/udhcpd.conf ${D}${sysconfdir}

	cp ${WORKDIR}/calibrator ${D}${bindir}
	cp ${WORKDIR}/tixu_AP_en.sh ${D}${bindir}
	cp ${WORKDIR}/bt_start.sh ${D}${bindir}
	cp ${WORKDIR}/bt_stop.sh ${D}${bindir}
	cp ${WORKDIR}/wifi_stop.sh ${D}${bindir}
	cp ${WORKDIR}/hostapd ${D}${bindir}
	cp ${WORKDIR}/board_cal.sh ${D}${bindir}
	cp ${WORKDIR}/board_wlan.sh ${D}${bindir}
	
        cp ${WORKDIR}/wl18xx-fw-4.bin ${D}${sbindir}/wlconf/firmware
        cp ${WORKDIR}/WL8_System_parameters.ini ${D}${sbindir}/wlconf/official_inis
	cp ${WORKDIR}/bt-device ${D}${base_bindir}
	install -m 0755 ${WORKDIR}/wl18xx-fw-4.bin ${D}${sbindir}/wlconf/firmware
	install -m 0755 ${WORKDIR}/WL8_System_parameters.ini ${D}${sbindir}/wlconf/official_inis
	install -m 0755 ${WORKDIR}/tixu_AP_en.sh ${D}${bindir}
	install -m 0755 ${WORKDIR}/bt_start.sh ${D}${bindir}
	install -m 0755 ${WORKDIR}/bt_stop.sh ${D}${bindir}
	install -m 0755 ${WORKDIR}/wifi_stop.sh ${D}${bindir}
	install -m 0755 ${WORKDIR}/bt-device ${D}${base_bindir}
	install -m 0755 ${WORKDIR}/obexd ${D}${bindir}
        install -m 0755 ${WORKDIR}/zigbee_stop.sh ${D}${bindir}
	install -m 0755 ${WORKDIR}/wlan_eth_bridge_create.sh ${D}${bindir}
	install -m 0755 ${WORKDIR}/zigbee_wlan_bridge.sh ${D}${bindir}
	install -m 0755 ${WORKDIR}/blinking.sh ${D}${bindir}
}
FILES_${PN} += "/home/root/*"
