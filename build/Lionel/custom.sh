
#!/bin/bash

# Install additional dependencies
# sudo -E apt-get -y install rename

# Update feeds file
# sed -i 's@#src-git helloworld@src-git helloworld@g' feeds.conf.default #启用helloworld
cat feeds.conf.default

# Add third-party packages
#git clone https://github.com/db-one/dbone-packages.git -b 18.06 package/dbone-packages

# 移除 SNAPSHOT 标签
sed -i 's,-SNAPSHOT,,g' include/version.mk
sed -i 's,-SNAPSHOT,,g' package/base-files/image-config.in

# Add luci-app-amlogic
svn co https://github.com/ophub/luci-app-amlogic/trunk package/luci-app-amlogic

# Add p7zip
svn co https://github.com/hubutui/p7zip-lede/trunk package/lean/p7zip

# Autocore Stb
git clone https://github.com/MatJehey/autocore-arm-x86.git package/new/luci-app-autocore


# AutoCore
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/emortal/autocore package/lean/autocore
rm -rf ./feeds/packages/utils/coremark
svn co https://github.com/immortalwrt/packages/trunk/utils/coremark feeds/packages/utils/coremark

# kengzo
git clone https://github.com/kenzok8/openwrt-packages package/new/kengzo
git clone https://github.com/kenzok8/small package/new/small

# Bypass
git clone https://github.com/kiddin9/openwrt-bypass.git package/new/luci-app-bypass

# modem
git clone https://github.com/4IceG/luci-app-3ginfo-lite.git package/new/luci-app-3ginfo-lite

# libernet
git clone https://github.com/helmiau/helmiwrt-packages.git package/new/libernet

# Update and install sources
./scripts/feeds clean
./scripts/feeds update -a && ./scripts/feeds install -a -f

# change ssid
sed -i "s/OpenWrt/CupangOs/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh

# change hostname
sed -i "s/OpenWrt/kiaOs/g" package/base-files/files/bin/config_generate

# change timezone
sed -i -e "s/CST-8/WIB-7/g" -e "s/Shanghai/Jakarta/g" package/emortal/default-settings/files/99-default-settings-chinese
# =======================================================


#Create a custom configuration file

cd $WORKPATH
touch ./.config

#
# ========================Firmware customization section========================
# 

# 
# If no edits are made to this block, the default configuration firmware is generated.
# 

# The following are custom firmware options and descriptions:
#

#
# Some plugins/options are enabled by default. If you want to disable them, please refer to the following example to write:
# 
#          =========================================
#         |  # Uncompile the VMware image:                    |
#         |  cat >> .config <<EOF                   |
#         |  # CONFIG_VMDK_IMAGES is not set        |
#         |  EOF                                    |
#          =========================================
#

# 
# Here are some plugin options prepared in advance.
# Directly uncomment the corresponding code block to apply. Do not uncomment the Chinese character description on the code block.
# If you don't need a configuration in the code block, just delete the corresponding line.
#
# If you need other plugins, please add them according to the example.
# Note, only add the package at the top of the dependency chain. If you need plugin A, and A depends on B, just add A.
#
# No matter how you want to customize the firmware, you need and only need to modify the contents of the EOF loopback.
#

# Compile firmware:
cat >> .config <<EOF
CONFIG_TARGET_armvirt=y
CONFIG_TARGET_armvirt_64=y
CONFIG_TARGET_armvirt_64_Default=y
CONFIG_BRCMFMAC_PCIE=y
CONFIG_BRCMFMAC_SDIO=y
CONFIG_BRCMFMAC_USB=y
CONFIG_BTRFS_PROGS_ZSTD=y
CONFIG_DRIVER_11AC_SUPPORT=y
CONFIG_DRIVER_11N_SUPPORT=y
CONFIG_HTOP_LMSENSORS=y
CONFIG_LIBSODIUM_MINIMAL=y
CONFIG_OPENVPN_openssl_ENABLE_DEF_AUTH=y
CONFIG_OPENVPN_openssl_ENABLE_FRAGMENT=y
CONFIG_OPENVPN_openssl_ENABLE_LZ4=y
CONFIG_OPENVPN_openssl_ENABLE_LZO=y
CONFIG_OPENVPN_openssl_ENABLE_MULTIHOME=y
CONFIG_OPENVPN_openssl_ENABLE_PF=y
CONFIG_OPENVPN_openssl_ENABLE_PORT_SHARE=y
CONFIG_OPENVPN_openssl_ENABLE_SMALL=y
CONFIG_PACKAGE_MAC80211_DEBUGFS=y
CONFIG_PACKAGE_MAC80211_MESH=y
CONFIG_PACKAGE_TAR_BZIP2=y
CONFIG_PACKAGE_TAR_GZIP=y
CONFIG_PACKAGE_TAR_XZ=y
CONFIG_PACKAGE_TAR_ZSTD=y
CONFIG_PACKAGE_attr=y
CONFIG_PACKAGE_autocore-arm=y
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_blkid=y
CONFIG_PACKAGE_block-mount=y
CONFIG_PACKAGE_boost=y
CONFIG_PACKAGE_boost-date_time=y
CONFIG_PACKAGE_boost-program_options=y
CONFIG_PACKAGE_boost-system=y
CONFIG_PACKAGE_brcmfmac-firmware-usb=y
CONFIG_PACKAGE_btrfs-progs=y
CONFIG_PACKAGE_bzip2=y
CONFIG_PACKAGE_chattr=y
CONFIG_PACKAGE_chinadns-ng=y
CONFIG_PACKAGE_coreutils=y
CONFIG_PACKAGE_coreutils-base64=y
CONFIG_PACKAGE_coreutils-nohup=y
# CONFIG_PACKAGE_ddns-scripts is not set
# CONFIG_PACKAGE_ddns-scripts-services is not set
CONFIG_PACKAGE_dns2socks=y
CONFIG_PACKAGE_dosfstools=y
# CONFIG_PACKAGE_etherwake is not set
CONFIG_PACKAGE_f2fs-tools=y
CONFIG_PACKAGE_f2fsck=y
CONFIG_PACKAGE_fdisk=y
CONFIG_PACKAGE_gawk=y
CONFIG_PACKAGE_getopt=y
CONFIG_PACKAGE_haproxy=y
CONFIG_PACKAGE_hostapd-common=y
CONFIG_PACKAGE_ip-full=y
CONFIG_PACKAGE_ipset=y
CONFIG_PACKAGE_ipt2socks=y
CONFIG_PACKAGE_iptables-mod-conntrack-extra=y
CONFIG_PACKAGE_iptables-mod-extra=y
# CONFIG_PACKAGE_iptables-mod-filter is not set
CONFIG_PACKAGE_iptables-mod-ipopt=y
CONFIG_PACKAGE_iptables-mod-iprange=y
CONFIG_PACKAGE_iptables-mod-tproxy=y
CONFIG_PACKAGE_iw=y
CONFIG_PACKAGE_iwinfo=y
CONFIG_PACKAGE_kcptun-client=y
CONFIG_PACKAGE_kmod-brcmfmac=y
CONFIG_PACKAGE_kmod-brcmutil=y
CONFIG_PACKAGE_kmod-cfg80211=y
CONFIG_PACKAGE_kmod-crypto-acompress=y
CONFIG_PACKAGE_kmod-crypto-ccm=y
CONFIG_PACKAGE_kmod-crypto-cmac=y
CONFIG_PACKAGE_kmod-crypto-crc32c=y
CONFIG_PACKAGE_kmod-crypto-ctr=y
CONFIG_PACKAGE_kmod-crypto-gcm=y
CONFIG_PACKAGE_kmod-crypto-gf128=y
CONFIG_PACKAGE_kmod-crypto-ghash=y
CONFIG_PACKAGE_kmod-crypto-hmac=y
CONFIG_PACKAGE_kmod-crypto-kpp=y
CONFIG_PACKAGE_kmod-crypto-lib-blake2s=y
CONFIG_PACKAGE_kmod-crypto-lib-chacha20=y
CONFIG_PACKAGE_kmod-crypto-lib-chacha20poly1305=y
CONFIG_PACKAGE_kmod-crypto-lib-curve25519=y
CONFIG_PACKAGE_kmod-crypto-lib-poly1305=y
CONFIG_PACKAGE_kmod-crypto-rng=y
CONFIG_PACKAGE_kmod-crypto-seqiv=y
CONFIG_PACKAGE_kmod-crypto-sha256=y
CONFIG_PACKAGE_kmod-fast-classifier=y
CONFIG_PACKAGE_kmod-fs-btrfs=y
CONFIG_PACKAGE_kmod-ipt-conntrack-extra=y
CONFIG_PACKAGE_kmod-ipt-extra=y
# CONFIG_PACKAGE_kmod-ipt-filter is not set
CONFIG_PACKAGE_kmod-ipt-ipopt=y
CONFIG_PACKAGE_kmod-ipt-iprange=y
CONFIG_PACKAGE_kmod-ipt-offload=y
CONFIG_PACKAGE_kmod-ipt-raw=y
CONFIG_PACKAGE_kmod-ipt-tproxy=y
CONFIG_PACKAGE_kmod-lib-crc16=y
CONFIG_PACKAGE_kmod-lib-crc32c=y
CONFIG_PACKAGE_kmod-lib-lzo=y
CONFIG_PACKAGE_kmod-lib-raid6=y
# CONFIG_PACKAGE_kmod-lib-textsearch is not set
CONFIG_PACKAGE_kmod-lib-xor=y
CONFIG_PACKAGE_kmod-lib-zlib-deflate=y
CONFIG_PACKAGE_kmod-lib-zlib-inflate=y
CONFIG_PACKAGE_kmod-lib-zstd=y
CONFIG_PACKAGE_kmod-libphy=y
CONFIG_PACKAGE_kmod-mac80211=y
CONFIG_PACKAGE_kmod-mii=y
CONFIG_PACKAGE_kmod-mmc=y
CONFIG_PACKAGE_kmod-nf-flow=y
CONFIG_PACKAGE_kmod-nls-base=y
CONFIG_PACKAGE_kmod-shortcut-fe=y
CONFIG_PACKAGE_kmod-tcp-bbr=y
CONFIG_PACKAGE_kmod-tun=y
CONFIG_PACKAGE_kmod-udptunnel4=y
CONFIG_PACKAGE_kmod-udptunnel6=y
CONFIG_PACKAGE_kmod-usb-core=y
CONFIG_PACKAGE_kmod-usb-net=y
CONFIG_PACKAGE_kmod-usb-net-aqc111=y
CONFIG_PACKAGE_kmod-usb-net-asix=y
CONFIG_PACKAGE_kmod-usb-net-asix-ax88179=y
CONFIG_PACKAGE_kmod-usb-net-cdc-eem=y
CONFIG_PACKAGE_kmod-usb-net-cdc-ether=y
CONFIG_PACKAGE_kmod-usb-net-cdc-mbim=y
CONFIG_PACKAGE_kmod-usb-net-cdc-ncm=y
CONFIG_PACKAGE_kmod-usb-net-cdc-subset=y
CONFIG_PACKAGE_kmod-usb-net-dm9601-ether=y
CONFIG_PACKAGE_kmod-usb-net-hso=y
CONFIG_PACKAGE_kmod-usb-net-huawei-cdc-ncm=y
CONFIG_PACKAGE_kmod-usb-net-ipheth=y
CONFIG_PACKAGE_kmod-usb-net-kalmia=y
CONFIG_PACKAGE_kmod-usb-net-kaweth=y
CONFIG_PACKAGE_kmod-usb-net-mcs7830=y
CONFIG_PACKAGE_kmod-usb-net-pegasus=y
CONFIG_PACKAGE_kmod-usb-net-pl=y
CONFIG_PACKAGE_kmod-usb-net-qmi-wwan=y
CONFIG_PACKAGE_kmod-usb-net-rndis=y
CONFIG_PACKAGE_kmod-usb-net-rtl8150=y
CONFIG_PACKAGE_kmod-usb-net-rtl8152=y
CONFIG_PACKAGE_kmod-usb-net-sierrawireless=y
CONFIG_PACKAGE_kmod-usb-net-smsc95xx=y
CONFIG_PACKAGE_kmod-usb-net-sr9700=y
CONFIG_PACKAGE_kmod-usb-wdm=y
#CONFIG_PACKAGE_kmod-wireguard is not set
CONFIG_PACKAGE_libatomic=y
CONFIG_PACKAGE_libattr=y
CONFIG_PACKAGE_libbpf=y
CONFIG_PACKAGE_libbz2=y
CONFIG_PACKAGE_libcap=y
CONFIG_PACKAGE_libcap-bin=y
CONFIG_PACKAGE_libcap-bin-capsh-shell="/bin/sh"
# CONFIG_PACKAGE_libcap-ng is not set
CONFIG_PACKAGE_libcares=y
CONFIG_PACKAGE_libdb47=y
CONFIG_PACKAGE_libelf=y
CONFIG_PACKAGE_libev=y
CONFIG_PACKAGE_libevent2=y
CONFIG_PACKAGE_libfdisk=y
CONFIG_PACKAGE_libipset=y
CONFIG_PACKAGE_libltdl=y
CONFIG_PACKAGE_liblua5.3=y
CONFIG_PACKAGE_liblzma=y
CONFIG_PACKAGE_liblzo=y
CONFIG_PACKAGE_libmaxminddb=y
CONFIG_PACKAGE_libmbedtls=y
CONFIG_PACKAGE_libminiupnpc=y
CONFIG_PACKAGE_libmount=y
CONFIG_PACKAGE_libnatpmp=y
CONFIG_PACKAGE_libopenssl-conf=y
CONFIG_PACKAGE_libparted=y
CONFIG_PACKAGE_libreadline=y
CONFIG_PACKAGE_libruby=y
CONFIG_PACKAGE_libsmartcols=y
CONFIG_PACKAGE_libsodium=y
CONFIG_PACKAGE_libstdcpp=y
CONFIG_PACKAGE_libudns=y
CONFIG_PACKAGE_libuv=y
CONFIG_PACKAGE_libwebsockets-full=y
CONFIG_PACKAGE_libyaml=y
CONFIG_PACKAGE_libzstd=y
CONFIG_PACKAGE_losetup=y
CONFIG_PACKAGE_lsattr=y
CONFIG_PACKAGE_lsblk=y
CONFIG_PACKAGE_lua-maxminddb=y
CONFIG_PACKAGE_luasocket=y
CONFIG_PACKAGE_luci-app-amlogic=y
CONFIG_PACKAGE_luci-app-bypass=y
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Socks5_Proxy is not set
# CONFIG_PACKAGE_luci-app-control-timewol is not set
# CONFIG_PACKAGE_luci-app-control-webrestriction is not set
# CONFIG_PACKAGE_luci-app-control-weburl is not set
# CONFIG_PACKAGE_luci-app-ddns is not set
CONFIG_PACKAGE_luci-app-mwan3=y
CONFIG_PACKAGE_luci-app-openclash=y
#CONFIG_PACKAGE_luci-app-openvpn is not set
CONFIG_PACKAGE_luci-app-passwall=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan_GO=y
CONFIG_PACKAGE_luci-app-ramfree=y
CONFIG_PACKAGE_luci-app-ssr-plus=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_IPT2Socks=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Trojan=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_V2ray_Plugin=y
# CONFIG_PACKAGE_luci-app-timecontrol is not set
CONFIG_PACKAGE_luci-app-ttyd=y
# CONFIG_PACKAGE_luci-app-upnp is not set
CONFIG_PACKAGE_luci-app-vssr=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Kcptun=y
# CONFIG_PACKAGE_luci-app-wireguard is not set
# CONFIG_PACKAGE_luci-app-wol is not set
#CONFIG_PACKAGE_luci-i18n-amlogic-zh-cn is not set
#CONFIG_PACKAGE_luci-i18n-bypass-zh-cn is not set
#CONFIG_PACKAGE_luci-i18n-mwan3-zh-cn is not set
#CONFIG_PACKAGE_luci-i18n-openvpn-zh-cn is not set
#CONFIG_PACKAGE_luci-i18n-passwall-zh-cn is not set
#CONFIG_PACKAGE_luci-i18n-ssr-plus-zh-cn is not set
#CONFIG_PACKAGE_luci-i18n-ttyd-zh-cn is not set
#CONFIG_PACKAGE_luci-i18n-vssr-zh-cn is not set
# CONFIG_PACKAGE_luci-i18n-wireguard-zh-cn is not set
CONFIG_PACKAGE_luci-lib-fs=y
# CONFIG_PACKAGE_luci-lib-ipkg is not set
#CONFIG_PACKAGE_luci-proto-wireguard is not set
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-theme-bootstrap-mod=y
# CONFIG_PACKAGE_luci-theme-edge=y
CONFIG_PACKAGE_microsocks=y
# CONFIG_PACKAGE_miniupnpd is not set
CONFIG_PACKAGE_mwan3=y
#CONFIG_PACKAGE_netdata=y
CONFIG_PACKAGE_openssl-util=y
#CONFIG_PACKAGE_openvpn-easy-rsa is not set
#CONFIG_PACKAGE_openvpn-openssl is not set
CONFIG_PACKAGE_parted=y
CONFIG_PACKAGE_pdnsd-alt=y
CONFIG_PACKAGE_perl=y
CONFIG_PACKAGE_perlbase-base=y
CONFIG_PACKAGE_perlbase-bytes=y
CONFIG_PACKAGE_perlbase-charnames=y
CONFIG_PACKAGE_perlbase-class=y
CONFIG_PACKAGE_perlbase-config=y
CONFIG_PACKAGE_perlbase-cwd=y
CONFIG_PACKAGE_perlbase-dynaloader=y
CONFIG_PACKAGE_perlbase-errno=y
CONFIG_PACKAGE_perlbase-essential=y
CONFIG_PACKAGE_perlbase-fcntl=y
CONFIG_PACKAGE_perlbase-file=y
CONFIG_PACKAGE_perlbase-filehandle=y
CONFIG_PACKAGE_perlbase-i18n=y
CONFIG_PACKAGE_perlbase-integer=y
CONFIG_PACKAGE_perlbase-io=y
CONFIG_PACKAGE_perlbase-list=y
CONFIG_PACKAGE_perlbase-locale=y
CONFIG_PACKAGE_perlbase-params=y
CONFIG_PACKAGE_perlbase-posix=y
CONFIG_PACKAGE_perlbase-re=y
CONFIG_PACKAGE_perlbase-scalar=y
CONFIG_PACKAGE_perlbase-selectsaver=y
CONFIG_PACKAGE_perlbase-socket=y
CONFIG_PACKAGE_perlbase-symbol=y
CONFIG_PACKAGE_perlbase-tie=y
CONFIG_PACKAGE_perlbase-time=y
CONFIG_PACKAGE_perlbase-unicode=y
CONFIG_PACKAGE_perlbase-unicore=y
CONFIG_PACKAGE_perlbase-utf8=y
CONFIG_PACKAGE_perlbase-xsloader=y
CONFIG_PACKAGE_pv=y
CONFIG_PACKAGE_resize2fs=y
CONFIG_PACKAGE_resolveip=y
CONFIG_PACKAGE_ruby=y
CONFIG_PACKAGE_ruby-bigdecimal=y
CONFIG_PACKAGE_ruby-date=y
CONFIG_PACKAGE_ruby-dbm=y
CONFIG_PACKAGE_ruby-digest=y
CONFIG_PACKAGE_ruby-enc=y
CONFIG_PACKAGE_ruby-forwardable=y
CONFIG_PACKAGE_ruby-pstore=y
CONFIG_PACKAGE_ruby-psych=y
CONFIG_PACKAGE_ruby-stringio=y
CONFIG_PACKAGE_ruby-strscan=y
CONFIG_PACKAGE_ruby-yaml=y
CONFIG_PACKAGE_shadowsocks-libev-ss-local=y
CONFIG_PACKAGE_shadowsocks-libev-ss-redir=y
CONFIG_PACKAGE_shadowsocks-libev-ss-server=y
CONFIG_PACKAGE_shadowsocks-rust-sslocal=y
CONFIG_PACKAGE_shadowsocks-rust-ssserver=y
CONFIG_PACKAGE_shadowsocksr-libev-ssr-check=y
CONFIG_PACKAGE_shadowsocksr-libev-ssr-local=y
CONFIG_PACKAGE_shadowsocksr-libev-ssr-redir=y
CONFIG_PACKAGE_shadowsocksr-libev-ssr-server=y
CONFIG_PACKAGE_simple-obfs=y
CONFIG_PACKAGE_smartdns=y
CONFIG_PACKAGE_tar=y
CONFIG_PACKAGE_tcping=y
CONFIG_PACKAGE_trojan=y
CONFIG_PACKAGE_trojan-go=y
CONFIG_PACKAGE_trojan-plus=y
CONFIG_PACKAGE_ttyd=y
CONFIG_PACKAGE_unzip=y
CONFIG_PACKAGE_uuidgen=y
CONFIG_PACKAGE_v2ray-core=y
CONFIG_PACKAGE_v2ray-plugin=y
#CONFIG_PACKAGE_wireguard-tools is not set
CONFIG_PACKAGE_wireless-regdb=y
CONFIG_PACKAGE_wpa-cli=y
CONFIG_PACKAGE_wpad-basic=y
CONFIG_PACKAGE_xfs-fsck=y
CONFIG_PACKAGE_xfs-mkfs=y
CONFIG_PACKAGE_xray-core=y
CONFIG_PACKAGE_xray-plugin=y
CONFIG_PACKAGE_xz=y
CONFIG_PACKAGE_xz-utils=y
CONFIG_PACKAGE_zerotier=y
CONFIG_PARTED_READLINE=y
CONFIG_PERL_NOCOMMENT=y
# CONFIG_TARGET_IMAGES_GZIP is not set
# CONFIG_TARGET_ROOTFS_CPIOGZ is not set
# CONFIG_TARGET_ROOTFS_INITRAMFS is not set
# CONFIG_TARGET_ROOTFS_SQUASHFS is not set
CONFIG_TARGET_ROOTFS_TARGZ=y
CONFIG_V2RAY_CORE_COMPRESS_UPX=y
CONFIG_WPA_MSG_MIN_PRIORITY=3
CONFIG_ZSTD_OPTIMIZE_O3=y
CONFIG_boost-compile-visibility-hidden=y
CONFIG_boost-runtime-shared=y
CONFIG_boost-static-and-shared-libs=y
CONFIG_boost-variant-release=y

#CONFIG_PACKAGE_luci-app-zerotier is not set
#CONFIG_PACKAGE_luci-i18n-zerotier-zh-cn is not set
#CONFIG_PACKAGE_zerotier is not set

#CONFIG_PACKAGE_luci-app-netdata is not set
#CONFIG_PACKAGE_luci-i18n-netdata-zh-cn is not set
#CONFIG_PACKAGE_netdata is not set

CONFIG_PACKAGE_htop=y
CONFIG_HTOP_LMSENSORS=y

CONFIG_PACKAGE_stunnel=y

#CONFIG_PACKAGE_luci-app-adblock=y

# adguard home
#
#CONFIG_PACKAGE_luci-app-adguardhome is not set
#CONFIG_PACKAGE_luci-app-adguardhome_INCLUDE_binary is not set
#CONFIG_PACKAGE_luci-i18n-adguardhome-zh-cn is not set
# CONFIG_PACKAGE_luci-i18n-adguardhome-zh_Hans is not set
#CONFIG_PACKAGE_adguardhome is not set

# usb thethering
#
CONFIG_PACKAGE_kmod-usb-net-ipheth=y
CONFIG_PACKAGE_kmod-nls-base=y
CONFIG_PACKAGE_kmod-usb-net-rndis=y
CONFIG_PACKAGE_kmod-usb-core=y
CONFIG_PACKAGE_kmod-usb-net=y
CONFIG_PACKAGE_kmod-usb-net-cdc-ether=y
CONFIG_PACKAGE_kmod-usb2=y
CONFIG_PACKAGE_kmod-usb3=y
CONFIG_PACKAGE_usbutils=y
CONFIG_PACKAGE_libimobiledevice=y
CONFIG_PACKAGE_usbmuxd=y
#
# tplink ralink-5370
#
CONFIG_PACKAGE_kmod-rt2800-lib=y
CONFIG_PACKAGE_kmod-rt2800-usb=y
CONFIG_PACKAGE_kmod-rt2x00-lib=y
CONFIG_PACKAGE_kmod-rt2x00-usb=y
CONFIG_PACKAGE_rt2800-usb-firmware=y
CONFIG_PACKAGE_RT2X00_DEBUG=y
CONFIG_PACKAGE_RT2X00_LIB_DEBUGFS=y
#
# RTL8188 usb wireless driver
#
CONFIG_PACKAGE_kmod-rtl8180=y
CONFIG_PACKAGE_kmod-rtl8187=y
CONFIG_PACKAGE_kmod-rtl8188eu=y
CONFIG_PACKAGE_kmod-rtl8189es=y
CONFIG_PACKAGE_kmod-rtl8192c-common=y
CONFIG_PACKAGE_kmod-rtl8192ce=y
CONFIG_PACKAGE_kmod-rtl8192cu=y
CONFIG_PACKAGE_kmod-rtl8192de=y
CONFIG_PACKAGE_kmod-rtl8192eu=y
CONFIG_PACKAGE_kmod-rtl8192se=y
CONFIG_PACKAGE_kmod-rtl8812au-ac=y
# CONFIG_PACKAGE_kmod-rtl8812au-ct=y
CONFIG_PACKAGE_kmod-rtl8821ae=y
CONFIG_PACKAGE_kmod-rtl8821cu=y
CONFIG_PACKAGE_kmod-rtl88x2bu=y
CONFIG_PACKAGE_kmod-rtl8xxxu=y
CONFIG_PACKAGE_kmod-rtlwifi=y
CONFIG_PACKAGE_RTLWIFI_DEBUG=y
CONFIG_PACKAGE_kmod-rtlwifi-btcoexist=y
CONFIG_PACKAGE_kmod-rtlwifi-pci=y
CONFIG_PACKAGE_kmod-rtlwifi-usb=y
# CONFIG_PACKAGE_rtl8188eu-firmware is not set
CONFIG_PACKAGE_rtl8192ce-firmware=y
CONFIG_PACKAGE_rtl8192cu-firmware=y
CONFIG_PACKAGE_rtl8192de-firmware=y
# CONFIG_PACKAGE_rtl8192eu-firmware is not set
CONFIG_PACKAGE_rtl8192se-firmware=y
# CONFIG_PACKAGE_rtl8192su-firmware is not set
# CONFIG_PACKAGE_rtl8723au-firmware is not set
# CONFIG_PACKAGE_rtl8723bu-firmware is not set
CONFIG_PACKAGE_rtl8821ae-firmware=y
# CONFIG_PACKAGE_rtl8822be-firmware is not set
# CONFIG_PACKAGE_rtl8822ce-firmware is not set



# usb modem info

CONFIG_PACKAGE_luci-app-3ginfo-lite=y
CONFIG_PACKAGE_wget-nossl=y
CONFIG_PACKAGE_kmod-usb-serial-ch341=y
CONFIG_PACKAGE_kmod-usb-serial-cp210x=y
CONFIG_PACKAGE_kmod-usb-serial-option=y
CONFIG_PACKAGE_kmod-usb-serial-pl2303=y
CONFIG_PACKAGE_kmod-usb-serial-wwan=y



# usb modem 4g/3g driver


CONFIG_PACKAGE_luci-app-3ginfo-lite=y
CONFIG_PACKAGE_wget-nossl=y
CONFIG_PACKAGE_kmod-usb-serial-ch341=y
CONFIG_PACKAGE_kmod-usb-serial-cp210x=y
CONFIG_PACKAGE_kmod-usb-serial-option=y
CONFIG_PACKAGE_kmod-usb-serial-pl2303=y
CONFIG_PACKAGE_kmod-usb-serial-wwan=y
CONFIG_PACKAGE_comgt-ncm=y
CONFIG_PACKAGE_kmod-usb-net-huawei-cdc-ncm=y
CONFIG_PACKAGE_kmod-usb-serial=y
CONFIG_PACKAGE_usb-modeswitch=y
CONFIG_PACKAGE_kmod-mii=y
CONFIG_PACKAGE_kmod-usb-net=y
CONFIG_PACKAGE_kmod-usb-wdm=y
CONFIG_PACKAGE_kmod-usb-net-qmi-wwan=y
CONFIG_PACKAGE_uqmi=y
CONFIG_PACKAGE_umbim=y
CONFIG_PACKAGE_kmod-usb-net-cdc-mbim=y
CONFIG_PACKAGE_kmod-usb2=y
CONFIG_PACKAGE_kmod-usb3=y
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb-uhci=y
CONFIG_PACKAGE_kmod-usb-acm=y
CONFIG_PACKAGE_kmod-usb-core=y
CONFIG_PACKAGE_chat=y
CONFIG_PACKAGE_ppp=y
CONFIG_PACKAGE_libusb=y
CONFIG_PACKAGE_luci-proto-modemmanager=y
CONFIG_PACKAGE_luci-proto-3g=y
CONFIG_PACKAGE_luci-proto-ncm=y
CONFIG_PACKAGE_luci-proto-qmi=y
CONFIG_PACKAGE_modemmanager=y
CONFIG_PACKAGE_kmod-usb-net-rndis=y
CONFIG_PACKAGE_kmod-usb-net-cdc-ether=y

EOF

# 
# ========================Firmware customization section ends========================
# 

sed -i 's/^[ \t]*//g' ./.config

# Back to Contents
cd $HOME

# The configuration file is created
