#!/bin/sh
# ttyd 自动登录 root
sed -i "s|option command '/bin/login'|option command '/bin/login -f root'|g" /etc/config/ttyd
# 开启 xray
# sed -i "s|option enabled '0'|option enabled '1'|g" /etc/config/xray 
# 设置 root 密码
printf "password\npassword\n" | passwd root
# 配置 WiFi
#5G
uci set wireless.radio0.channel='auto'
uci set wireless.radio0.cell_density='0'
uci set wireless.default_radio0.ssid='OpenWrt'
uci set wireless.default_radio0.key='j1472580369'
uci set wireless.default_radio0.ieee80211r='1'
uci set wireless.default_radio0.ft_over_ds='0'
uci set wireless.default_radio0.ft_psk_generate_local='1'
uci set wireless.default_radio0.ieee80211k='1'
uci set wireless.default_radio0.wnm_sleep_mode='1'
uci set wireless.default_radio0.wnm_sleep_mode_no_keys='1'
uci set wireless.default_radio0.bss_transition='1'
uci set wireless.default_radio0.proxy_arp='1'
uci set wireless.default_radio0.mobility_domain='abcd'
#2.4g
uci set wireless.radio1.channel='auto'
uci set wireless.radio1.cell_density='0'
uci set wireless.default_radio1.ssid='OpenWrt_2.4g'
uci set wireless.default_radio1.key='j1472580369'
uci set wireless.default_radio1.ieee80211r='1'
uci set wireless.default_radio1.ft_over_ds='0'
uci set wireless.default_radio1.ft_psk_generate_local='1'
uci set wireless.default_radio1.ieee80211k='1'
uci set wireless.default_radio1.wnm_sleep_mode='1'
uci set wireless.default_radio1.wnm_sleep_mode_no_keys='1'
uci set wireless.default_radio1.bss_transition='1'
uci set wireless.default_radio1.proxy_arp='1'
uci set wireless.default_radio1.mobility_domain='abcd'
# 修改 LuCI 主题
uci set luci.main.lang='zh_cn'
uci set luci.main.mediaurlbase='/luci-static/material3'
# 重新加载
uci commit wireless
wifi reload
uci commit luci
uci commit system
exit 0
