#!/bin/bash
# N1 旁路由极致精简脚本
# 通过 package-openwrt-image.yml 中的 SCRIPT_DIY_PATH 环境变量调用

echo "=== [DIY 脚本] 开始精简 N1 固件内容 ==="

# 1. 移除 WiFi 相关（N1 旁路不需要无线）
echo "正在移除 WiFi 驱动与固件..."
rm -rf ./lib/modules/*/kernel/drivers/net/wireless/broadcom/brcm80211/brcmfmac/ 2>/dev/null
rm -rf ./lib/firmware/brcm/ 2>/dev/null
rm -f ./lib/firmware/brcmfmac* 2>/dev/null

# 2. 移除 Docker 相关（彻底解决高负载问题）
echo "正在移除 Docker 及其残留文件..."
rm -rf ./etc/docker/ ./usr/lib/docker/ 2>/dev/null
rm -f ./usr/bin/docker* ./etc/init.d/docker 2>/dev/null
rm -f ./usr/lib/lua/luci/controller/docker.lua 2>/dev/null
rm -f ./usr/lib/lua/luci/model/cbi/docker.lua 2>/dev/null
rm -rf ./usr/share/luci-app-docker 2>/dev/null

# 3. 移除 iStore 相关
echo "正在移除 iStore 服务..."
rm -rf ./usr/lib/lua/luci/controller/istore.lua 2>/dev/null
rm -rf ./usr/lib/lua/luci/view/istore/ 2>/dev/null
rm -rf ./www/istore/ 2>/dev/null
rm -rf ./usr/share/luci-app-store 2>/dev/null

echo "=== [DIY 脚本] 精简完成 ==="
# rm -rf ./usr/lib/lua/luci/view/passwall/ 2>/dev/null

echo "=== DIY 精简脚本执行完毕 ==="
