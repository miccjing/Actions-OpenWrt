#!/bin/bash
# 脚本用途：在 OpenWrt feeds 更新之前执行的准备工作脚本
#
# 添加Qmodem feeds
echo 'src-git qmodem https://github.com/FUjr/QModem.git;main' >> feeds.conf.default
# 添加luci-app-turboacc
# curl -sSL https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh --no-sfe
# 修改lan口ip
# sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate
# 修改默认密码为password
sed -i 's/root:::0:99999:7:::/root:$5$.I1gWK7dcUcq0vLu$6hBUt6cPnCk3.GVLcUvJOVdcrHm7RbbiXBNCfvdufBD:20231:0:99999:7:::/g' package/base-files/files/etc/shadow
# 修改主机名
# sed -i "s/hostname='ImmortalWrt'/hostname='OpenWrt'/g" package/base-files/files/bin/config_generate
# 添加luci-theme-alpha
git clone https://github.com/miccjing/luci-theme-alpha package/luci-theme-alpha
