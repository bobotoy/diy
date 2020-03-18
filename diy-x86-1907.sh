#/bin/bash
#=================================================
#   Description: DIY script
#   Lisence: MIT
#   Author: P3TERX
#   Blog: https://p3terx.com
#=================================================
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

#echo '修改feeds'
#sed -i '1,2s/coolsnowwolf/hong0980/g' ./feeds.conf.default

echo '修改网关地址'
sed -i 's/192.168.1.1/192.168.43.100/g' package/base-files/files/bin/config_generate

echo '修改时区'
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

echo '修改机器名称'
sed -i 's/OpenWrt/OpenWrt-x64/g' package/base-files/files/bin/config_generate

echo '修改banner'
cp -f diy/hong0980/banner package/base-files/files/etc/

echo '添加软件包'
git clone https://github.com/hong0980/build diy/ipk
sed -i '$a\chdbits.co\n\www.cnscg.club\n\pt.btschool.club\n\et8.org\n\www.nicept.net\n\pthome.net\n\ourbits.club\n\pt.m-team.cc\n\hdsky.me' feeds/lienol/lienol/luci-app-passwall/root/usr/share/passwall/rules/whitelist_host
sed -i '$a\docker.com\n\docker.io' feeds/lienol/lienol/luci-app-passwall/root/usr/share/passwall/rules/blacklist_host
sed -i '8,32d' diy/ipk/luci-app-advanced-settings/luasrc/model/cbi/advanced.lua 
git clone https://github.com/frainzy1477/luci-app-clash diy/luci-app-clash
git clone https://github.com/rufengsuixing/luci-app-adguardhome diy/luci-app-adguardhome
git clone https://github.com/destan19/OpenAppFilter diy/OpenAppFilter
git clone https://github.com/ElonH/Rclone-OpenWrt diy/Rclone-OpenWrt
git clone https://github.com/tty228/luci-app-serverchan diy/luci-app-serverchan
git clone https://github.com/project-openwrt/luci-app-koolproxyR diy/luci-app-koolproxyR
rm -rf diy/luci-app-serverchan/root/etc/config/serverchan
cp -f diy/hong0980/serverchan diy/luci-app-serverchan/root/etc/config/
sed -i 's/OpenWrt By tty228 路由状态/OpenWrt路由状态/g' diy/luci-app-serverchan/luasrc/model/cbi/serverchan.lua
ln -s ../diy package/diy-packages
sed -i 's/default n/default y/g' feeds/packages/utils/docker-ce/Config.in
sed -i '111,112d' feeds/packages/utils/docker-ce/Makefile
cp -f diy/hong0980/mount.lua feeds/luci/modules/luci-mod-admin-full/luasrc/model/cbi/admin_system/fstab/
cp -f diy/hong0980/zzz-default-settings package/default-settings/files/
cp -f diy/hong0980/image1907.mk include/image.mk

echo 'qBittorrent4.2.1'
rm -rf diy/ipk/qbittorrent #4.1.9
#rm -rf diy/hong0980/qbittorrent #4.2.1
sed -i '33,36d' $(pwd)/diy/ipk/luci-app-qbittorrent/luasrc/model/cbi/qbittorrent.lua

echo '删除重复包'
rm -rf diy/hong0980/autocore
rm -rf diy/hong0980/docker-ce
#rm -rf feeds/packages/utils/docker-ce
rm -rf package/lean/qt5
rm -rf package/lean/qBittorrent
rm -rf package/lean/luci-app-dockerman
rm -rf package/lean/luci-lib-docker
rm -rf package/lean/luci-app-qbittorrent
rm -rf feeds/packages/utils/ttyd

echo '当前路径'
pwd

