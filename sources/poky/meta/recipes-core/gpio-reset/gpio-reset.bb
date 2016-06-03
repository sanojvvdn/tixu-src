#
#     Filename      : gpio-reset.bb
#
#     Description   : Bitbake recipe for gpio reset
#     Created       : Wednesday, 1 June 2016, 10:34:02 IST
#

DESCRIPTION = "Tixu PMIC gpio-reset"
LICENSE = "CLOSED"
PR = "r0"

SRC_URI = "file://gpio_reset.c \
	   "

S = "${WORKDIR}"

do_compile() {
		${CC} gpio_reset.c -o gpio_reset
}

do_install() {
		install -d ${D}${bindir}
		install -m 755 gpio_reset ${D}${bindir}
}

