#!/bin/sh
# 出错立即退出（防止半执行状态）
set -e
echo "[INFO] First boot custom script start..."
# 1. ttyd 自动登录 root
if [ -f /etc/config/ttyd ]; then
    sed -i "s|option command '/bin/login'|option command '/bin/login -f root'|g" /etc/config/ttyd
fi
# 2. 设置 root 密码
printf "password\npassword\n" | passwd root
# 3. 配置 WiFi
uci set wireless.@wifi-iface[0].ssid='OpenWrt'
uci set wireless.@wifi-iface[0].encryption='psk2+ccmp'
uci set wireless.@wifi-iface[0].key='j1472580369'
# 可选（按需开启）
# uci set wireless.radio0.country='CN'
# uci set wireless.radio0.cell_density='0'
uci commit wireless
# 重载 WiFi（兼容不同版本）
wifi reload || wifi up
# 4. 修改 LuCI 主题（存在才改）
if uci -q get luci.main.mediaurlbase >/dev/null; then
    uci set luci.main.mediaurlbase='/luci-static/alpha'
    uci commit luci
fi
# 5. 关闭 LED（避免重复添加）
if ! uci show system | grep -q "disable_led"; then
    uci add system led
    uci set system.@led[-1].name='disable_led'
    uci set system.@led[-1].sysfs='blue:status'
    uci set system.@led[-1].trigger='none'
    uci set system.@led[-1].default='0'
    uci commit system
fi
# 6. 删除自身（防止重复执行）
rm -rf /etc/uci-defaults/999-firstboot_custom.sh"
exit 0
