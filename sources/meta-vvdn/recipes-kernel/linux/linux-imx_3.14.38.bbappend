FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}:"

SCMVERSION = "n"

SRC_URI = "git://git.freescale.com/imx/linux-2.6-imx.git;branch=${SRCBRANCH} \
	   file://defconfig \
           file://0001-mmc-sdhci-esdhc-imx-Fixup-runtime-PM-conditions-duri.patch \
           file://0002-ARM-LLVMLinux-Change-extern-inline-to-static-inline.patch \
           file://0003-ARM-8158-LLVMLinux-use-static-inline-in-ARM-ftrace.patch \
	   file://0004-tixu_pmic_dts.patch \
	   file://0005-tixu_pmic_wi-fi.patch \
           file://0006-tixu_pmic_bt.patch \
	   file://0007-tixu_pmic_dvfs.patch \
	   file://0008-tixu_pmic_dvfs.patch \
	   file://0009-tixu_pmic_rtc_wakeup.patch \
			"
