#!/bin/sh
# ttyd 自动登录 root
sed -i "s|option command '/bin/login'|option command '/bin/login -f root'|g" /etc/config/ttyd
# 开启 xray
sed -i "s|option enabled '0'|option enabled '1'|g" /etc/config/xray 
# 设置 root 密码
printf "password\npassword\n" | passwd root
# 配置 WiFi
uci set wireless.@wifi-iface[0].ssid='OpenWrt'
uci set wireless.@wifi-iface[0].encryption='psk2+ccmp'
uci set wireless.@wifi-iface[0].key='j1472580369'
# uci set wireless.radio0.country='CN'
# uci set wireless.radio0.cell_density='0'
# 修改 LuCI 主题
# uci set luci.main.mediaurlbase='/luci-static/alpha'
# 关闭 LED
uci add system led
uci set system.@led[-1].name='disable_led'
uci set system.@led[-1].sysfs='blue:status'
uci set system.@led[-1].trigger='none'
uci set system.@led[-1].default='0'
# qmodem设置(修复T99W373)
uci set qmodem.main.block_auto_probe='1'
uci del qmodem.main.enable_pcie_scan
uci del qmodem.main.enable_usb_scan
# 重新加载
uci commit wireless
wifi reload
uci commit luci
uci commit system
exit 0
