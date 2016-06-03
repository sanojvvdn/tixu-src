
SUMMARY = "DHRYSTONE" 

DESCRIPTION = "DHRYSTONE BENCHMARKING PROGRAM" 

HOMEPAGE = "http://en.wikipedia.org/wiki/Dhrystone" 

LICENSE = "CLOSED" 

PR = "pr0" 

S = "${WORKDIR}" 

SRC_URI = "file://dhrystone.tar.bz2 \ 
" 
do_compile() { 
cd ${WORKDIR}/dhrystone
make 
        
} 

do_install() { 
       install -d ${D}${base_bindir} 
       cp -rf ${S}/dhrystone/gcc_dry2 ${D}${base_bindir} 
       cp -rf ${S}/dhrystone/gcc_dry2reg ${D}${base_bindir}
} 



ALLOW_EMPTY_${PN} = "1"
