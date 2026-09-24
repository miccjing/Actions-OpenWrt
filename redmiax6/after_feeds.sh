#!/bin/bash
# 脚本用途：在 OpenWrt feeds 更新和安装后执行的后续处理脚本
# 取消 luci-app-attendedsysupgrade
# sed -i '/luci-app-attendedsysupgrade/d' feeds/luci/collections/luci/Makefile
# 替换geodata
rm -rf feeds/packages/net/v2ray-geodata/*
curl -L https://raw.githubusercontent.com/Openwrt-Passwall/openwrt-passwall-packages/refs/heads/main/v2ray-geodata/Makefile -o feeds/packages/net/v2ray-geodata/Makefile
sed -i "s/option min_cache_ttl[[:space:]]*3600/option min_cache_ttl	0/" package/network/services/dnsmasq/files/dhcp.conf
sed -i "s/option use_stale_cache[[:space:]]*3600/option use_stale_cache	0/" package/network/services/dnsmasq/files/dhcp.conf
