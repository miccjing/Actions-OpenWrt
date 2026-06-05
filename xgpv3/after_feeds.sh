#!/bin/bash
# 脚本用途：在 OpenWrt feeds 更新和安装后执行的后续处理脚本
# 取消 luci-app-attendedsysupgrade
# sed -i '/luci-app-attendedsysupgrade/d' feeds/luci/collections/luci/Makefile
# 替换geodata
rm -rf feeds/packages/net/v2ray-geodata/*
curl -L https://raw.githubusercontent.com/Openwrt-Passwall/openwrt-passwall-packages/refs/heads/main/v2ray-geodata/Makefile -o feeds/packages/net/v2ray-geodata/Makefile
# 修改设备名
sed -i "s|model = "NLnet XiGuaPi V3";|model = "WatermelonPi V3";|g" target/linux/rockchip/files/arch/arm64/boot/dts/rockchip/rk3568-xiguapi-v3.dts
