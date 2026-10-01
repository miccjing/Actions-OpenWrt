#!/bin/sh
# ttyd 自动登录 root
# sed -i "s|option command '/bin/login'|option command '/bin/login -f root'|g" /etc/config/ttyd
# 开启 xray
# sed -i "s|option enabled '0'|option enabled '1'|g" /etc/config/xray 
# 设置 root 密码
printf "password\npassword\n" | passwd root
# 修改 LuCI 主题
uci set luci.main.lang='zh_cn'
uci set luci.main.mediaurlbase='/luci-static/material3'
# 重新加载
uci set system.@system[0].hostname='JDC_Luban'
uci commit luci
uci commit system
/etc/init.d/system restart
exit 0
