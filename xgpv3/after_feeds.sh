#!/bin/bash
# 脚本用途：在 OpenWrt feeds 更新和安装后执行的后续处理脚本
#
# 移除 openwrt feeds 自带的核心库
rm -rf feeds/packages/net/{xray-core,v2ray-geodata,sing-box,chinadns-ng,dns2socks,hysteria,ipt2socks,microsocks,naiveproxy,shadowsocks-libev,shadowsocks-rust,shadowsocksr-libev,simple-obfs,tcping,trojan-plus,tuic-client,v2ray-plugin,xray-plugin,geoview,shadow-tls}
git clone https://github.com/xiaorouji/openwrt-passwall-packages package/passwall-packages
# 移除 openwrt feeds 过时的luci版本
rm -rf feeds/luci/applications/luci-app-passwall
git clone https://github.com/xiaorouji/openwrt-passwall package/passwall-luci
#ttyd默认登陆root
sed -i "s|option command '/bin/login'|option command '/bin/login -f root'|g" feeds/packages/utils/ttyd/files/ttyd.config
#修改turboacc配置
sed -i "s/option hw_flow '1'/option hw_flow '0'/" package/turboacc/luci-app-turboacc/root/etc/config/turboacc
sed -i "s/option sfe_flow '1'/option sfe_flow '0'/" package/turboacc/luci-app-turboacc/root/etc/config/turboacc
