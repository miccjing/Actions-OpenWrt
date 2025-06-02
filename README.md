 西瓜皮V3 [immortalwrt](https://github.com/miccjing/immortalwrt)
  1. 安装编译依赖
       ```
       sudo apt update -y
       sudo apt full-upgrade -y
       sudo apt install -y ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential \
          bzip2 ccache clang cmake cpio curl device-tree-compiler ecj fastjar flex gawk gettext gcc-multilib \
          g++-multilib git gnutls-dev gperf haveged help2man intltool lib32gcc-s1 libc6-dev-i386 libelf-dev \
          libglib2.0-dev libgmp3-dev libltdl-dev libmpc-dev libmpfr-dev libncurses-dev libpython3-dev \
          libreadline-dev libssl-dev libtool libyaml-dev libz-dev lld llvm lrzsz mkisofs msmtp nano \
          ninja-build p7zip p7zip-full patch pkgconf python3 python3-pip python3-ply python3-docutils \
          python3-pyelftools qemu-utils re2c rsync scons squashfs-tools subversion swig texinfo uglifyjs \
          upx-ucl unzip vim wget xmlto xxd zlib1g-dev zstd
      ```
  2. 下载源代码
      ```
      git clone https://github.com/miccjing/immortalwrt
      cd immortalwrt
      ```
      添加[Qmodem](https://github.com/FUjr/QModem) feeds(可选)
      ```
      echo 'src-git qmodem https://github.com/FUjr/QModem.git;main' >> feeds.conf.default
      ```
      添加[luci-app-turboacc](https://github.com/chenmozhijin/turboacc)(可选)
      ```
      curl -sSL https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh --no-sfe
      ```
      修改lan口ip(可选)
      ```
      sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate
      ```
      修改默认密码为password(可选)
      ```
      sed -i 's/root:::0:99999:7:::/root:$5$.I1gWK7dcUcq0vLu$6hBUt6cPnCk3.GVLcUvJOVdcrHm7RbbiXBNCfvdufBD:20231:0:99999:7:::/g' package/base-files/files/etc/shadow
      ```
      修改主机名(可选)
      ```
      sed -i "s/hostname='ImmortalWrt'/hostname='OpenWrt'/g" package/base-files/files/bin/config_generate
      ```
     修改默认主题(可选)
      ```
      sed -i "/add_list system.ntp.server='pool.ntp.org'/a\\\t\tset luci.main.mediaurlbase='/luci-static/alpha'\n\t\tcommit luci" package/base-files/files/bin/config_generate
      ```
  3. 更新 feeds 
     ```
      ./scripts/feeds update -a
      ./scripts/feeds install -a
      ```
     添加[passwall](https://github.com/xiaorouji/openwrt-passwall)(可选)
      ```
      rm -rf feeds/luci/applications/luci-app-passwall
      git clone https://github.com/xiaorouji/openwrt-passwall package/openwrt-passwall
      ```
      ttyd默认登陆root(可选)
      ```
      sed -i "s|option command '/bin/login'|option command '/bin/login -f root'|g" feeds/packages/utils/ttyd/files/ttyd.config
      ```
  4. 选择配置
      ```
      make menuconfig
      ```
  5. 下载 dl 库
      ```
      make download -j$(nproc)
      ```
  6. 编译固件
      ```
      make -j$(nproc)
      ```
