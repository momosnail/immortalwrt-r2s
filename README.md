# ImmortalWrt R2S 自编译固件

基于 GitHub Actions 云编译，为 NanoPi R2S 定制的 ImmortalWrt 24.10 固件。

## 配置

- **目标机型**: FriendlyElec NanoPi R2S (rockchip/armv8, RK3328)
- **源码**: [immortalwrt/immortalwrt](https://github.com/immortalwrt/immortalwrt) `openwrt-24.10` 分支
- **插件源**: [kenzok8/small-package](https://github.com/kenzok8/small-package)
- **默认 LAN IP**: 192.168.11.1

## 内置插件

| 类别 | 插件 |
|---|---|
| 翻墙 | luci-app-openclash |
| 下载 | transmission, aria2 + ariang |
| 组网 | zerotier, upnp, ddns |
| 网络 | sqm(QoS), nlbwmon(流量统计), wol(网络唤醒) |
| 系统 | argon主题, ttyd(网页终端), htop |
| 拨号 | pppoe (WAN拨号) |
| 存储 | ext4/exfat/ntfs3 + USB (接移动硬盘做下载) |

## 如何编译

进入 **Actions** 标签 → 左侧选 **Build ImmortalWrt R2S** → 点 **Run workflow** → 等待约 1-2 小时 → 编译产物自动发布到 **Releases**。

## 刷机

下载 Releases 里的 `*-squashfs-sysupgrade.img.gz`，用 balenaEtcher / Rufus 写入 TF 卡。

## 文件说明

- `r2s.config` — 编译配置种子（选定机型和插件）
- `diy-part1.sh` — feeds update 前执行（加插件源）
- `diy-part2.sh` — 编译前执行（改默认IP、清理冲突包）
- `.github/workflows/build.yml` — Actions 编译流程
