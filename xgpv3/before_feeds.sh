#!/bin/bash
# 脚本用途：在 OpenWrt feeds 更新之前执行的准备工作脚本
#
# 添加Qmodem feeds
echo 'src-git qmodem https://github.com/FUjr/QModem.git;main' >> feeds.conf.default
# 修改默认密码为password
sed -i 's/root:::0:99999:7:::/root:$5$.I1gWK7dcUcq0vLu$6hBUt6cPnCk3.GVLcUvJOVdcrHm7RbbiXBNCfvdufBD:20231:0:99999:7:::/g' package/base-files/files/etc/shadow
# 添加luci-theme-alpha
git clone https://github.com/miccjing/luci-theme-alpha package/luci-theme-alpha
# 添加luci-app-easytier
# git clone https://github.com/EasyTier/luci-app-easytier package/luci-app-easytier
# 添加luci-app-passwall2
echo 'src-git passwall2 https://github.com/Openwrt-Passwall/openwrt-passwall2.git;main' >> feeds.conf.default
