@echo off
chcp 65001 >nul

echo ================================
echo   安装 CloudBase 部署环境
echo ================================
echo.

REM 检查 Node.js
where node >nul 2>&1
if errorlevel 1 (
    echo ❌ 未检测到 Node.js
    echo.
    echo 请先安装 Node.js：
    echo    1. 访问 https://nodejs.org/
    echo    2. 下载 LTS 版本
    echo    3. 安装后重启命令行
    echo.
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
echo ✅ Node.js 已安装: %NODE_VERSION%

REM 检查 npm
where npm >nul 2>&1
if errorlevel 1 (
    echo ❌ npm 未找到
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('npm --version') do set NPM_VERSION=%%i
echo ✅ npm 版本: %NPM_VERSION%

echo.
echo 📦 正在安装 CloudBase CLI...
echo    这可能需要几分钟，请耐心等待...
echo.

npm install -g @cloudbase/cli

if errorlevel 1 (
    echo.
    echo ❌ 安装失败
    echo.
    echo 💡 可能的解决方法：
    echo    1. 使用管理员权限运行命令行
    echo    2. 检查网络连接
    echo    3. 尝试使用国内镜像：
    echo       npm config set registry https://registry.npmmirror.com
    echo       npm install -g @cloudbase/cli
    echo.
    pause
    exit /b 1
)

echo.
echo ✅ CloudBase CLI 安装成功！
echo.
echo 📝 下一步：
echo    1. 运行 "cloudbase login" 登录腾讯云
echo    2. 在 https://console.cloud.tencent.com/tcb 创建环境
echo    3. 运行 "deploy.bat" 或 "deploy-simple.bat" 部署
echo.
echo 💡 快速登录命令：
echo    cloudbase login
echo.

pause

