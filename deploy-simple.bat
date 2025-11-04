@echo off
chcp 65001 >nul

echo ================================
echo   通用技术刷题系统 - 简化部署
echo ================================
echo.

REM 获取环境 ID
if "%ENV_ID%"=="" (
    echo 请输入你的 CloudBase 环境 ID：
    echo （在 https://console.cloud.tencent.com/tcb 查看）
    echo.
    set /p ENV_ID="ENV_ID: "
)

if "%ENV_ID%"=="" (
    echo ❌ 环境 ID 不能为空
    pause
    exit /b 1
)

echo.
echo 📦 准备部署到环境: %ENV_ID%
echo.
echo ⚠️  确保你已经：
echo    1. 安装了 Node.js
echo    2. 安装了 CloudBase CLI (npm install -g @cloudbase/cli)
echo    3. 已登录腾讯云 (cloudbase login)
echo.
pause

echo.
echo 🚀 开始部署...
echo.

cloudbase hosting deploy ./ -e %ENV_ID%

if errorlevel 1 (
    echo.
    echo ❌ 部署失败！
    echo.
    echo 💡 可能的原因：
    echo    1. 未安装 CloudBase CLI
    echo       解决：npm install -g @cloudbase/cli
    echo.
    echo    2. 未登录腾讯云
    echo       解决：cloudbase login
    echo.
    echo    3. 环境 ID 错误
    echo       解决：检查控制台中的环境 ID
    echo.
) else (
    echo.
    echo ✅ 部署成功！
    echo.
    echo 🌐 访问地址：
    echo    https://%ENV_ID%.tcloudbaseapp.com
    echo.
    echo 💡 提示：
    echo    - 首次访问可能需要等待 CDN 缓存刷新（5-10分钟）
    echo    - 如需绑定自定义域名，请访问 CloudBase 控制台
    echo.
)

pause

