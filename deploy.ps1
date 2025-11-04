# 通用技术刷题系统 - 腾讯云部署脚本 (Windows PowerShell)

Write-Host "================================" -ForegroundColor Cyan
Write-Host "  通用技术刷题系统部署工具" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""

# 检查是否安装了 Node.js
try {
    $nodeVersion = node --version
    Write-Host "✅ Node.js 版本: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ 未检测到 Node.js，请先安装 Node.js" -ForegroundColor Red
    Write-Host "   下载地址: https://nodejs.org/" -ForegroundColor Yellow
    exit 1
}

# 检查是否安装了 CloudBase CLI
try {
    $cbVersion = cloudbase --version
    Write-Host "✅ CloudBase CLI 已安装" -ForegroundColor Green
} catch {
    Write-Host "⚠️  未检测到 CloudBase CLI，正在安装..." -ForegroundColor Yellow
    npm install -g @cloudbase/cli
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ CloudBase CLI 安装失败，请手动安装：" -ForegroundColor Red
        Write-Host "   npm install -g @cloudbase/cli" -ForegroundColor Yellow
        exit 1
    }
    Write-Host "✅ CloudBase CLI 安装成功" -ForegroundColor Green
}

# 检查是否已登录
Write-Host ""
Write-Host "📝 正在检查登录状态..." -ForegroundColor Cyan
cloudbase user:list 2>$null | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host "⚠️  未登录，请先登录腾讯云账号" -ForegroundColor Yellow
    cloudbase login
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ 登录失败" -ForegroundColor Red
        exit 1
    }
}

Write-Host "✅ 已登录" -ForegroundColor Green

# 获取环境 ID
Write-Host ""
if (-not $env:ENV_ID) {
    Write-Host "请输入你的 CloudBase 环境 ID：" -ForegroundColor Cyan
    Write-Host "（可以在 https://console.cloud.tencent.com/tcb 查看）" -ForegroundColor Gray
    $ENV_ID = Read-Host "ENV_ID"
} else {
    $ENV_ID = $env:ENV_ID
}

if (-not $ENV_ID) {
    Write-Host "❌ 环境 ID 不能为空" -ForegroundColor Red
    exit 1
}

# 确认部署
Write-Host ""
Write-Host "📦 准备部署到环境: $ENV_ID" -ForegroundColor Cyan
Write-Host ""
Write-Host "将要部署的文件：" -ForegroundColor Yellow
Write-Host "  - index.html (主页面)"
Write-Host "  - 2021-2024年试题文件夹及图片"
Write-Host ""
$confirm = Read-Host "确认部署？(y/n)"

if ($confirm -ne "y" -and $confirm -ne "Y") {
    Write-Host "❌ 取消部署" -ForegroundColor Red
    exit 0
}

# 开始部署
Write-Host ""
Write-Host "🚀 开始部署..." -ForegroundColor Cyan
cloudbase hosting deploy ./ -e $ENV_ID

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ 部署成功！" -ForegroundColor Green
    Write-Host ""
    Write-Host "🌐 访问地址：" -ForegroundColor Cyan
    Write-Host "   https://$ENV_ID.tcloudbaseapp.com" -ForegroundColor White
    Write-Host ""
    Write-Host "💡 提示：" -ForegroundColor Yellow
    Write-Host "   - 如需绑定自定义域名，请访问 CloudBase 控制台"
    Write-Host "   - 首次访问可能需要等待CDN缓存刷新（约5-10分钟）"
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "❌ 部署失败，请检查错误信息" -ForegroundColor Red
    exit 1
}

