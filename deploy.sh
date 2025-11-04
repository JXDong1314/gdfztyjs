#!/bin/bash

# 通用技术刷题系统 - 腾讯云部署脚本 (Linux/Mac)

echo "================================"
echo "  通用技术刷题系统部署工具"
echo "================================"
echo ""

# 检查是否安装了 CloudBase CLI
if ! command -v cloudbase &> /dev/null
then
    echo "⚠️  未检测到 CloudBase CLI，正在安装..."
    npm install -g @cloudbase/cli
    if [ $? -ne 0 ]; then
        echo "❌ CloudBase CLI 安装失败，请手动安装："
        echo "   npm install -g @cloudbase/cli"
        exit 1
    fi
    echo "✅ CloudBase CLI 安装成功"
fi

# 检查是否已登录
echo ""
echo "📝 正在检查登录状态..."
cloudbase user:list &> /dev/null
if [ $? -ne 0 ]; then
    echo "⚠️  未登录，请先登录腾讯云账号"
    cloudbase login
    if [ $? -ne 0 ]; then
        echo "❌ 登录失败"
        exit 1
    fi
fi

echo "✅ 已登录"

# 获取环境 ID
echo ""
if [ -z "$ENV_ID" ]; then
    echo "请输入你的 CloudBase 环境 ID："
    echo "（可以在 https://console.cloud.tencent.com/tcb 查看）"
    read -p "ENV_ID: " ENV_ID
fi

if [ -z "$ENV_ID" ]; then
    echo "❌ 环境 ID 不能为空"
    exit 1
fi

# 确认部署
echo ""
echo "📦 准备部署到环境: $ENV_ID"
echo ""
echo "将要部署的文件："
echo "  - index.html (主页面)"
echo "  - 2021-2024年试题文件夹及图片"
echo ""
read -p "确认部署？(y/n): " confirm

if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
    echo "❌ 取消部署"
    exit 0
fi

# 开始部署
echo ""
echo "🚀 开始部署..."
cloudbase hosting deploy ./ -e $ENV_ID

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 部署成功！"
    echo ""
    echo "🌐 访问地址："
    echo "   https://$ENV_ID.tcloudbaseapp.com"
    echo ""
    echo "💡 提示："
    echo "   - 如需绑定自定义域名，请访问 CloudBase 控制台"
    echo "   - 首次访问可能需要等待CDN缓存刷新（约5-10分钟）"
    echo ""
else
    echo ""
    echo "❌ 部署失败，请检查错误信息"
    exit 1
fi

