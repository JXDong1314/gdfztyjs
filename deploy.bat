@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ================================
echo   通用技术刷题系统部署工具
echo ================================
echo.

REM 检查是否安装了 Node.js
where node >nul 2>&1
if errorlevel 1 (
    echo ❌ 未检测到 Node.js，请先安装 Node.js
    echo    下载地址: https://nodejs.org/
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
echo ✅ Node.js 版本: %NODE_VERSION%

REM 检查是否安装了 CloudBase CLI
where cloudbase >nul 2>&1
if errorlevel 1 (
    echo ⚠️  未检测到 CloudBase CLI，正在安装...
    npm install -g @cloudbase/cli
    if errorlevel 1 (
        echo ❌ CloudBase CLI 安装失败，请手动安装：
        echo    npm install -g @cloudbase/cli
        pause
        exit /b 1
    )
    echo ✅ CloudBase CLI 安装成功
) else (
    echo ✅ CloudBase CLI 已安装
)

REM 提示登录（简化版本，不检查登录状态）
echo.
echo 📝 准备登录腾讯云...
echo.
echo 💡 提示：
echo    - 如果已登录，登录命令会自动跳过
echo    - 如果未登录，会打开浏览器进行登录
echo.
pause

cloudbase login
if errorlevel 1 (
    echo.
    echo ⚠️  登录可能失败或被取消
    echo    如果已经登录，可以继续部署
    echo.
    set /p CONTINUE="是否继续尝试部署？(y/n): "
    if /i not "!CONTINUE!"=="y" (
        echo ❌ 取消部署
        pause
        exit /b 1
    )
) else (
    echo ✅ 登录成功
)

REM 获取环境 ID
echo.
if "%ENV_ID%"=="" (
    echo 请输入你的 CloudBase 环境 ID：
    echo （可以在 https://console.cloud.tencent.com/tcb 查看）
    set /p ENV_ID="ENV_ID: "
)

if "%ENV_ID%"=="" (
    echo ❌ 环境 ID 不能为空
    pause
    exit /b 1
)

REM 确认部署
echo.
echo 📦 准备部署到环境: %ENV_ID%
echo.
echo 将要部署的文件：
echo   - index.html (主页面)
echo   - 2021-2024年试题文件夹及图片
echo.
set /p CONFIRM="确认部署？(y/n): "

if /i not "%CONFIRM%"=="y" (
    echo ❌ 取消部署
    pause
    exit /b 0
)

REM 开始部署
echo.
echo 🚀 开始部署...
call cloudbase hosting deploy ./ -e %ENV_ID%

if %errorlevel% equ 0 (
    echo.
    echo ✅ 部署成功！
    echo.
    echo 🌐 访问地址：
    echo    https://%ENV_ID%.tcloudbaseapp.com
    echo.
    echo 💡 提示：
    echo    - 如需绑定自定义域名，请访问 CloudBase 控制台
    echo    - 首次访问可能需要等待CDN缓存刷新（约5-10分钟）
    echo.
) else (
    echo.
    echo ❌ 部署失败，请检查错误信息
    pause
    exit /b 1
)

pause

