#/bin/bash
#=================================================
#   Description: DIY script
#   Lisence: MIT
#   Author: P3TERX
#   Blog: https://p3terx.com
#=================================================

#echo '修改feeds'
#sed -i '1,2s/coolsnowwolf/hong0980/g' ./feeds.conf.default

echo '修改网关地址'
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

echo '修改时区'
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

echo '修改机器名称'
sed -i 's/OpenWrt/Newifi/g' package/base-files/files/bin/config_generate

echo '修改banner'
cp -f diy/hong0980/banner package/base-files/files/etc/

echo '添加软件包'
rm -rf package/lean/qt5
rm -rf package/lean/luci-app-qbittorrent
rm -rf package/lean/qBittorrent
#git clone https://github.com/hong0980/diy diy/hong0980
git clone https://github.com/hong0980/build diy/ipk
git clone https://github.com/Lienol/openwrt-package diy/Lienol
sed -i '$a\chdbits.co\n\www.cnscg.club\n\pt.btschool.club\n\et8.org\n\www.nicept.net\n\pthome.net\n\ourbits.club\n\pt.m-team.cc\n\hdsky.me\n\ccfbits.org' $(pwd)/diy/Lienol/lienol/luci-app-passwall/root/usr/share/passwall/rules/whitelist_host
sed -i '$a\docker.com\n\docker.io' $(pwd)/diy/Lienol/lienol/luci-app-passwall/root/usr/share/passwall/rules/blacklist_host
git clone https://github.com/destan19/OpenAppFilter diy/OpenAppFilter
git clone https://github.com/tty228/luci-app-serverchan diy/luci-app-serverchan
git clone https://github.com/project-openwrt/luci-app-koolproxyR diy/luci-app-koolproxyR
rm -rf diy/luci-app-serverchan/root/etc/config/serverchan
cp -f diy/hong0980/serverchan diy/luci-app-serverchan/root/etc/config/
sed -i 's/OpenWrt By tty228 路由状态/OpenWrt路由状态/g' $(pwd)/diy/luci-app-serverchan/luasrc/model/cbi/serverchan.lua
#git clone https://github.com/Leo-Jo-My/luci-app-vssr package/luci-app-vssr    
#git clone https://github.com/Leo-Jo-My/my diy/my      
#git clone https://github.com/Leo-Jo-My/luci-theme-Butterfly diy/luci-theme-Butterfly
#git clone https://github.com/Leo-Jo-My/luci-theme-opentomato diy/luci-theme-opentomato
#git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat diy/luci-theme-opentomcat
#rm -rf diy/my/openwrt-v2ray-plugin
#rm -rf diy/my/openwrt-simple-obfs
#rm -rf diy/my/openwrt-dnsforwarder
ln -s ../diy package/openwrt-packages
cp -f diy/hong0980/image.mk include/
cp -f diy/hong0980/mac80211.sh package/kernel/mac80211/files/lib/wifi/
cp -f diy/hong0980/zzz-default-settings package/lean/default-settings/files/

echo '删除重复包'
rm -rf diy/hong0980/qbittorrent
rm -rf diy/Lienol/package/v2ray
rm -rf diy/Lienol/package/trojan
rm -rf diy/Lienol/package/ipt2socks
rm -rf diy/Lienol/package/shadowsocksr-libev
rm -rf diy/Lienol/package/pdnsd-alt
rm -rf diy/Lienol/package/verysync
rm -rf diy/Lienol/package/kcptun
rm -rf diy/Lienol/lienol/luci-app-kodexplorer
rm -rf diy/Lienol/lienol/luci-app-pppoe-relay
rm -rf diy/Lienol/others/luci-app-verysync
rm -rf diy/Lienol/lienol/luci-app-pptp-server
rm -rf diy/Lienol/lienol/luci-app-v2ray-server
rm -rf diy/Lienol/lienol/luci-app-guest-wifi
echo '当前路径'
pwd
