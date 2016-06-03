
SUMMARY = "LED CONFIGURATION" 

DESCRIPTION = "LED SCHEME"

LICENSE = "CLOSED"

PR = "r0"

SRC_URI = "file://led.c \
	   file://led_config.sh  \
		"

S = "${WORKDIR}"

do_compile() {
		${CC} led.c -o led_scheme
}

do_install() {
		install -d ${D}${bindir}
		install -m 755 led_scheme ${D}${bindir}
		install -d ${D}${sysconfdir}/init.d
		install -m 755 led_config.sh ${D}${sysconfdir}/init.d
                install -d ${D}${sysconfdir}/rcS.d
                ln -sf  ../init.d/led_config.sh ${D}${sysconfdir}/rcS.d/S89led.sh

}
FILES_${PN}-dbg += "/etc/init.d/.debug"
