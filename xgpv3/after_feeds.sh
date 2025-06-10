#!/bin/bash
# 脚本用途：在 OpenWrt feeds 更新和安装后执行的后续处理脚本
#
#添加passwall
rm -rf feeds/luci/applications/luci-app-passwall
git clone https://github.com/xiaorouji/openwrt-passwall package/openwrt-passwall
git clone https://github.com/xiaorouji/openwrt-passwall2 package/openwrt-passwall2
#ttyd默认登陆root
sed -i "s|option command '/bin/login'|option command '/bin/login -f root'|g" feeds/packages/utils/ttyd/files/ttyd.config
#修改turboacc配置
sed -i "s/option hw_flow '1'/option hw_flow '0'/" package/turboacc/luci-app-turboacc/root/etc/config/turboacc
sed -i "s/option sfe_flow '1'/option sfe_flow '0'/" package/turboacc/luci-app-turboacc/root/etc/config/turboacc
