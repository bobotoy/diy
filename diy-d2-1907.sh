#/bin/bash
#=================================================
#   Description: DIY script
#   Lisence: MIT
#   Author: P3TERX
#   Blog: https://p3terx.com
#=================================================
echo '修改网关地址'
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

echo '修改时区'
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

echo '修改机器名称'
sed -i 's/OpenWrt/Newifi/g' package/base-files/files/bin/config_generate

echo '修改banner'
cp -f diy/hong0980/banner package/base-files/files/etc/

rm -rf package/lean/qt5
rm -rf package/lean/luci-app-qbittorrent
rm -rf package/lean/qBittorrent
git clone https://github.com/hong0980/build diy/ipk
sed -i '$a\chdbits.co\n\www.cnscg.club\n\pt.btschool.club\n\et8.org\n\www.nicept.net\n\pthome.net\n\ourbits.club\n\pt.m-team.cc\n\hdsky.me\n\ccfbits.org' feeds/lienol/lienol/luci-app-passwall/root/usr/share/passwall/rules/whitelist_host
sed -i '$a\docker.com\n\docker.io' feeds/lienol/lienol/luci-app-passwall/root/usr/share/passwall/rules/blacklist_host
git clone https://github.com/destan19/OpenAppFilter diy/OpenAppFilter
git clone https://github.com/tty228/luci-app-serverchan diy/luci-app-serverchan
git clone https://github.com/awesome-openwrt/luci-app-ssr-plus
git clone https://github.com/project-openwrt/luci-app-koolproxyR diy/luci-app-koolproxyR
rm -rf diy/luci-app-serverchan/root/etc/config/serverchan
cp -f diy/hong0980/serverchan diy/luci-app-serverchan/root/etc/config/
sed -i 's/OpenWrt By tty228 路由状态/OpenWrt路由状态/g' $(pwd)/diy/luci-app-serverchan/luasrc/model/cbi/serverchan.lua
ln -s ../diy package/openwrt-packages
cp -f diy/hong0980/image1907.mk include/image.mk
cp -f diy/hong0980/mac80211.sh package/kernel/mac80211/files/lib/wifi/
cp -f diy/hong0980/zzz-default-settings package/default-settings/files/
rm -rf diy/hong0980/qbittorrent
echo '当前路径'
pwd