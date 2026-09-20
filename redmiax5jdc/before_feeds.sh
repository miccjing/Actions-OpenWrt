#!/bin/bash
# 脚本用途：在 OpenWrt feeds 更新之前执行的准备工作脚本
#
# 添加luci-app-easytier
# git clone https://github.com/EasyTier/luci-app-easytier package/luci-app-easytier
# 添加luci-app-passwall2
echo 'src-git passwall2 https://github.com/Openwrt-Passwall/openwrt-passwall2.git;main' >> feeds.conf.default
# 添加luci-theme-material3
git clone https://github.com/KawaiiHachimi/luci-theme-material3 package/luci-theme-material3
