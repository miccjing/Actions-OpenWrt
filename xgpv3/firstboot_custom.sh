#!/bin/sh
#
# package/base-files/files/etc/uci-defaults/999-firstboot_custom.sh
# 修改无线配置
uci set wireless.@wifi-iface[0].ssid='OpenWrt'
uci set wireless.@wifi-iface[0].encryption='psk2+ccmp'
uci set wireless.@wifi-iface[0].key='j1472580369'
uci set wireless.default_radio0.skip_inactivity_poll='1'
uci set wireless.radio0.cell_density='0'
uci set wireless.radio0.country='CN'
uci commit wireless
#
# 修改默认主题
uci set luci.main.mediaurlbase='/luci-static/alpha'
uci commit luci
#
# 添加 LED 配置，禁用 blue:sys LED
uci add system led
uci set system.@led[-1].name='disable'
uci set system.@led[-1].sysfs='blue:sys'
uci set system.@led[-1].trigger='none'
uci set system.@led[-1].default='0'
uci commit system
#
# 重新加载无线配置
wifi reload
#
#qmodem启用PCIe模组扫描
uci set qmodem.main.enable_pcie_scan='1'
#qmodem启用USB模组扫描
uci set qmodem.main.enable_usb_scan='1'
#开机时延时启动(扫描)
uci set qmodem.main.start_delay='10'
uci commit qmodem
# 删除自身，防止重复执行
rm -f /etc/uci-defaults/999-firstboot_custom.sh
#
exit 0
