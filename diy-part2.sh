#!/bin/bash
# diy-part2.sh — 在 feeds install 之后、编译之前执行
# 用来改默认配置、清理冲突包

# --- 设默认 LAN IP 为你原来的 192.168.11.1 ---
sed -i 's/192.168.1.1/192.168.11.1/g' package/base-files/files/bin/config_generate

# --- 默认主题设为 argon ---
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile 2>/dev/null || true

# --- 解决 kenzok8 小包与官方源的冲突 (删掉重叠的基础包，用官方的) ---
rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat*,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd*,miniupnpd*,wireless-regdb,openssl} 2>/dev/null || true

# --- 时区/主机名 ---
sed -i "s/OpenWrt/R2S/g" package/base-files/files/bin/config_generate 2>/dev/null || true

echo "diy-part2 done: LAN=192.168.11.1, theme=argon, conflicts cleaned"
