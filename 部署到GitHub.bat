@echo off
chcp 65001 >nul

echo ================================
echo   部署到 GitHub Pages
echo ================================
echo.

REM 检查是否安装了 Git
where git >nul 2>&1
if errorlevel 1 (
    echo ❌ 未检测到 Git
    echo.
    echo 请先安装 Git：
    echo    下载地址: https://git-scm.com/download/win
    echo.
    echo 或者使用 GitHub Desktop:
    echo    下载地址: https://desktop.github.com/
    echo.
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('git --version') do set GIT_VERSION=%%i
echo ✅ %GIT_VERSION%
echo.

REM 检查是否已初始化
if exist ".git" (
    echo 📝 Git 仓库已存在，将进行更新...
    goto UPDATE
)

echo 📝 首次部署，正在初始化 Git 仓库...
echo.

REM 初始化 Git 仓库
git init
if errorlevel 1 (
    echo ❌ Git 初始化失败
    pause
    exit /b 1
)

echo ✅ Git 仓库初始化成功
echo.

REM 配置 Git（如果需要）
git config user.name >nul 2>&1
if errorlevel 1 (
    echo 请配置 Git 用户信息：
    echo.
    set /p GIT_NAME="你的名字: "
    set /p GIT_EMAIL="你的邮箱: "
    git config --global user.name "!GIT_NAME!"
    git config --global user.email "!GIT_EMAIL!"
    echo.
    echo ✅ Git 配置完成
    echo.
)

REM 获取仓库地址
echo 请输入你的 GitHub 仓库地址：
echo 格式: https://github.com/用户名/仓库名.git
echo.
echo 💡 提示：
echo    1. 先在 GitHub 网站创建一个公开仓库
echo    2. 复制仓库地址（HTTPS格式）
echo    3. 粘贴到这里
echo.
set /p REPO_URL="仓库地址: "

if "%REPO_URL%"=="" (
    echo ❌ 仓库地址不能为空
    pause
    exit /b 1
)

echo.
echo 🚀 开始部署...
echo.

REM 添加所有文件
echo 📦 正在添加文件...
git add .
if errorlevel 1 (
    echo ❌ 添加文件失败
    pause
    exit /b 1
)

REM 提交
echo 💾 正在提交...
git commit -m "初始提交：通用技术刷题系统"
if errorlevel 1 (
    echo ⚠️  提交可能失败（可能没有新文件）
)

REM 设置分支名
git branch -M main

REM 关联远程仓库
echo 🔗 正在关联远程仓库...
git remote add origin %REPO_URL%
if errorlevel 1 (
    echo ⚠️  远程仓库可能已存在，尝试更新...
    git remote set-url origin %REPO_URL%
)

REM 推送到 GitHub
echo 📤 正在推送到 GitHub...
echo    这可能需要几分钟，请耐心等待...
echo.
git push -u origin main
if errorlevel 1 (
    echo.
    echo ❌ 推送失败！
    echo.
    echo 💡 可能的原因：
    echo    1. 网络问题 - 检查网络连接
    echo    2. 权限问题 - 确认你有仓库的写入权限
    echo    3. 需要登录 - 首次使用可能需要登录 GitHub
    echo.
    echo 💡 解决方法：
    echo    1. 使用 GitHub Desktop（更简单）
    echo    2. 或配置 Git 凭证
    echo.
    pause
    exit /b 1
)

echo.
echo ================================
echo ✅ 部署成功！
echo ================================
echo.
echo 📝 下一步：
echo    1. 访问 GitHub 仓库页面
echo    2. 点击 Settings ^> Pages
echo    3. 在 Source 中选择 main 分支
echo    4. 点击 Save
echo    5. 等待 5-10 分钟后访问网站
echo.
echo 🌐 你的网站地址将是：
echo    https://你的用户名.github.io/仓库名/
echo.
pause
exit /b 0

:UPDATE
echo 🔄 更新现有仓库...
echo.

git add .
git commit -m "更新内容 - %date% %time%"
git push

if errorlevel 1 (
    echo.
    echo ❌ 更新失败
    echo.
    pause
    exit /b 1
)

echo.
echo ================================
echo ✅ 更新成功！
echo ================================
echo.
echo 💡 等待 1-2 分钟后，网站内容会自动更新
echo.
pause

