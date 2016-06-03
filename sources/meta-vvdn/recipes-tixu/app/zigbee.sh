a="${PWD}"
cd $a/../../../../build
cp tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/app/1.0-r0/app-1.0/tixu/system_manager/sys_app/interface/inc/* tmp/sysroots/imx6sltixu/usr/include/ -a
cp tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/app/1.0-r0/app-1.0/tixu/system_manager/sys_app/wdm/inc/* tmp/sysroots/imx6sltixu/usr/include/ -a
cp tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/app/1.0-r0/app-1.0/tixu/system_manager/sys_app/sys_server/inc/* tmp/sysroots/imx6sltixu/usr/include/ -a
cp tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/app/1.0-r0/app-1.0/lib/* tmp/sysroots/imx6sltixu/usr/lib/ -a
cp tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/app/1.0-r0/app-1.0/bin/* tmp/sysroots/imx6sltixu/usr/bin/ -a 
cp tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/app/1.0-r0/app-1.0/include/* tmp/sysroots/imx6sltixu/usr/include/ -a
chmod 755 tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/app/1.0-r0/app-1.0/tixu/lighttpd-1.4.32/target/usr/local/sbin/* 
chmod 755 tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/app/1.0-r0/app-1.0/lib/libconfig.so* tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/app/1.0-r0/app-1.0/lib/libconfig++.so* tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/app/1.0-r0/app-1.0/lib/libconfig.la tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/app/1.0-r0/app-1.0/lib/libconfig++.la
chmod 755 tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/app/1.0-r0/app-1.0/tixu/lighttpd-1.4.32/target/usr/local/lib/* tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/app/1.0-r0/app-1.0/tixu/lighttpd-1.4.32/target/usr/local/bin/* 
chmod 755 tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/app/1.0-r0/app-1.0/tixu/pcre-8.21/target/usr/local/lib/* 
chmod 755 tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/app/1.0-r0/app-1.0/tixu/upnp/scanipUPnP/lib/libixml.so* tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/app/1.0-r0/app-1.0/tixu/upnp/scanipUPnP/lib/libthreadutil.so*  tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/app/1.0-r0/app-1.0/tixu/upnp/scanipUPnP/lib/libupnp.so* tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/app/1.0-r0/app-1.0/tixu/upnp/scanipUPnP/lib/libixml.la tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/app/1.0-r0/app-1.0/tixu/upnp/scanipUPnP/lib/libthreadutil.la tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/app/1.0-r0/app-1.0/tixu/upnp/scanipUPnP/lib/libupnp.la
chmod 775 tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/app/1.0-r0/app-1.0/tixu/system_manager/sys_app/root_filesys/home/root/zigbee/servers/*
