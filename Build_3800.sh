#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================

# 自定义定制选项
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate #定制默认IP
sed -i 's/max-width:200px/max-width:1000px/g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm #修改首页样式
sed -i 's/max-width:200px/max-width:1000px/g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index_x86.htm #修改X86首页样式
sed -i 's/o.default = "admin"/o.default = ""/g' lienol/luci-app-passwall/luasrc/model/cbi/passwall/balancing.lua #去除haproxy默认密码(最新版已无密码)

# 添加第三方软件包
git clone https://github.com/vernesong/OpenClash package/OpenClash
git clone https://github.com/kang-mk/luci-app-serverchan package/luci-app-serverchan
git clone https://github.com/kang-mk/luci-app-smartinfo package/luci-app-smartinfo

# 创建自定义配置文件 - OpenWrt-x86-64

rm -f ./.config*
touch ./.config

#
# ========================固件定制部分========================
# 

# 
# 如果不对本区块做出任何编辑, 则生成默认配置固件. 
# 

# 以下为定制化固件选项和说明:
#

#
# 有些插件/选项是默认开启的, 如果想要关闭, 请参照以下示例进行编写:
# 
#          =========================================
#         |  # 取消编译VMware镜像:                   |
#         |  cat >> .config <<EOF                   |
#         |  # CONFIG_VMDK_IMAGES is not set        |
#         |  EOF                                    |
#          =========================================
#

# 
# 以下是一些提前准备好的一些插件选项.
# 直接取消注释相应代码块即可应用. 不要取消注释代码块上的汉字说明.
# 如果不需要代码块里的某一项配置, 只需要删除相应行.
#
# 如果需要其他插件, 请按照示例自行添加.
# 注意, 只需添加依赖链顶端的包. 如果你需要插件 A, 同时 A 依赖 B, 即只需要添加 A.
# 
# 无论你想要对固件进行怎样的定制, 都需要且只需要修改 EOF 回环内的内容.
# 

# 编译x64固件:
cat >> .config <<EOF
CONFIG_TARGET_ar71xx=y
CONFIG_TARGET_ar71xx_generic=y
CONFIG_TARGET_ar71xx_generic_DEVICE_wndr3800=y
CONFIG_PACKAGE_adb=y
CONFIG_PACKAGE_adb-enablemodem=y
CONFIG_PACKAGE_chat=y
CONFIG_PACKAGE_chinadns-ng=y
CONFIG_PACKAGE_comgt=y
CONFIG_PACKAGE_comgt-directip=y
CONFIG_PACKAGE_comgt-ncm=y
CONFIG_PACKAGE_edgeport-firmware=y
CONFIG_PACKAGE_kmod-atm=y
CONFIG_PACKAGE_kmod-gre=y
CONFIG_PACKAGE_kmod-iptunnel=y
CONFIG_PACKAGE_kmod-l2tp=y
CONFIG_PACKAGE_kmod-libphy=y
CONFIG_PACKAGE_kmod-mii=y
CONFIG_PACKAGE_kmod-pppoa=y
CONFIG_PACKAGE_kmod-pppol2tp=y
CONFIG_PACKAGE_kmod-pptp=y
CONFIG_PACKAGE_kmod-sched-connmark=y
CONFIG_PACKAGE_kmod-swconfig=y
CONFIG_PACKAGE_kmod-switch-rtl8306=y
CONFIG_PACKAGE_kmod-switch-rtl8366-smi=y
CONFIG_PACKAGE_kmod-switch-rtl8366rb=y
CONFIG_PACKAGE_kmod-switch-rtl8366s=y
CONFIG_PACKAGE_kmod-udptunnel4=y
CONFIG_PACKAGE_kmod-udptunnel6=y
CONFIG_PACKAGE_kmod-usb-acm=y
CONFIG_PACKAGE_kmod-usb-ehci=y
CONFIG_PACKAGE_kmod-usb-net=y
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
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb-ohci-pci=y
CONFIG_PACKAGE_kmod-usb-serial=y
CONFIG_PACKAGE_kmod-usb-serial-ark3116=y
CONFIG_PACKAGE_kmod-usb-serial-belkin=y
CONFIG_PACKAGE_kmod-usb-serial-ch341=y
CONFIG_PACKAGE_kmod-usb-serial-cp210x=y
CONFIG_PACKAGE_kmod-usb-serial-cypress-m8=y
CONFIG_PACKAGE_kmod-usb-serial-dmx_usb_module=y
CONFIG_PACKAGE_kmod-usb-serial-edgeport=y
CONFIG_PACKAGE_kmod-usb-serial-ftdi=y
CONFIG_PACKAGE_kmod-usb-serial-garmin=y
CONFIG_PACKAGE_kmod-usb-serial-ipw=y
CONFIG_PACKAGE_kmod-usb-serial-keyspan=y
CONFIG_PACKAGE_kmod-usb-serial-mct=y
CONFIG_PACKAGE_kmod-usb-serial-mos7720=y
CONFIG_PACKAGE_kmod-usb-serial-mos7840=y
CONFIG_PACKAGE_kmod-usb-serial-option=y
CONFIG_PACKAGE_kmod-usb-serial-oti6858=y
CONFIG_PACKAGE_kmod-usb-serial-pl2303=y
CONFIG_PACKAGE_kmod-usb-serial-qualcomm=y
CONFIG_PACKAGE_kmod-usb-serial-sierrawireless=y
CONFIG_PACKAGE_kmod-usb-serial-simple=y
CONFIG_PACKAGE_kmod-usb-serial-ti-usb=y
CONFIG_PACKAGE_kmod-usb-serial-visor=y
CONFIG_PACKAGE_kmod-usb-serial-wwan=y
CONFIG_PACKAGE_kmod-usb-serial-xr_usb_serial_common=y
CONFIG_PACKAGE_kmod-usb-uhci=y
CONFIG_PACKAGE_kmod-usb-wdm=y
CONFIG_PACKAGE_kmod-usb2=y
CONFIG_PACKAGE_kmod-usb2-pci=y
CONFIG_PACKAGE_libncurses=y
CONFIG_PACKAGE_libusb-1.0=y
CONFIG_PACKAGE_linux-atm=y
CONFIG_PACKAGE_luci-app-mwan3=y
CONFIG_PACKAGE_luci-app-qos=y
CONFIG_PACKAGE_luci-i18n-mwan3-zh-cn=y
CONFIG_PACKAGE_luci-i18n-qos-zh-cn=y
CONFIG_PACKAGE_luci-proto-3g=y
CONFIG_PACKAGE_luci-proto-qmi=y
CONFIG_PACKAGE_minicom=y
CONFIG_PACKAGE_mwan3=y
CONFIG_PACKAGE_picocom=y
CONFIG_PACKAGE_ppp-mod-passwordfd=y
CONFIG_PACKAGE_ppp-mod-pppoa=y
CONFIG_PACKAGE_ppp-mod-pppol2tp=y
CONFIG_PACKAGE_ppp-mod-pptp=y
CONFIG_PACKAGE_ppp-mod-radius=y
CONFIG_PACKAGE_qos-scripts=y
CONFIG_PACKAGE_resolveip=y
CONFIG_PACKAGE_screen=y
CONFIG_PACKAGE_terminfo=y
CONFIG_PACKAGE_umbim=y
CONFIG_PACKAGE_uqmi=y
CONFIG_PACKAGE_usb-modeswitch=y
CONFIG_PACKAGE_wwan=y
CONFIG_PACKAGE_adguardhome=y
CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_smartdns=y
CONFIG_PACKAGE_luci-app-smartdns=y
EOF


sed -i 's/^[ \t]*//g' ./.config



