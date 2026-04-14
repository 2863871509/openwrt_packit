#!/bin/bash
#
# DIY 精简脚本：仅移除不需要的文件，保留 opkg 数据库完整性
# 适用于 flippy 打包流程中的 openwrt_packit
#

echo "=== 开始执行 DIY 精简脚本 ==="

# 1. 移除 WiFi 相关驱动及固件（只删文件）
echo "移除 WiFi 驱动与固件..."
rm -rf ./lib/modules/*/kernel/drivers/net/wireless/broadcom/brcm80211/brcmfmac/ 2>/dev/null
rm -rf ./lib/firmware/brcm/ 2>/dev/null
rm -f ./lib/firmware/brcmfmac* 2>/dev/null

# 2. 移除 Docker 相关文件（如果存在）
echo "移除 Docker 相关文件..."
rm -rf ./etc/docker/ 2>/dev/null
rm -rf ./usr/lib/docker/ 2>/dev/null
rm -f ./usr/bin/docker* 2>/dev/null
rm -f ./usr/lib/lua/luci/controller/docker.lua 2>/dev/null
rm -f ./usr/lib/lua/luci/model/cbi/docker.lua 2>/dev/null

# 3. 移除 iStore 相关文件（如果存在）
echo "移除 iStore 相关文件..."
rm -rf ./usr/lib/lua/luci/controller/istore.lua 2>/dev/null
rm -rf ./usr/lib/lua/luci/view/istore/ 2>/dev/null
rm -rf ./www/istore/ 2>/dev/null

# 4. （可选）移除一些用不到的插件界面，但保留后端依赖，便于后续自行安装
# echo "移除 passwall 界面（需要时可随时 opkg 装回）..."
# rm -f ./usr/lib/lua/luci/controller/passwall.lua 2>/dev/null
# rm -rf ./usr/lib/lua/luci/view/passwall/ 2>/dev/null

echo "=== DIY 精简脚本执行完毕 ==="
