#!/bin/bash
# diy-part1.sh — 在 feeds update 之前执行，用来添加自定义 feeds 源
# ImmortalWrt 24.10 + NanoPi R2S

# 添加 kenzok8 小包源 (openclash/passwall 等第三方插件的活水源)
sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default

echo "diy-part1 done: added smpackage feed"
