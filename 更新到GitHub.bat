@echo off
chcp 65001 >nul

echo ================================
echo   更新到 GitHub Pages
echo ================================
echo.

REM 检查是否是 Git 仓库
if not exist ".git" (
    echo ❌ 当前目录不是 Git 仓库
    echo.
    echo 💡 请先运行 "部署到GitHub.bat" 进行首次部署
    echo.
    pause
    exit /b 1
)

echo 📝 检查文件变更...
echo.

REM 显示变更的文件
git status --short

echo.
set /p COMMIT_MSG="请输入提交信息（直接回车使用默认信息）: "

if "%COMMIT_MSG%"=="" (
    set COMMIT_MSG=更新内容 - %date% %time%
)

echo.
echo 🚀 开始更新...
echo.

REM 添加所有变更
echo 📦 添加变更...
git add .

REM 提交
echo 💾 提交更改...
git commit -m "%COMMIT_MSG%"
if errorlevel 1 (
    echo.
    echo ℹ️  没有需要提交的更改
    echo.
    pause
    exit /b 0
)

REM 推送
echo 📤 推送到 GitHub...
git push

if errorlevel 1 (
    echo.
    echo ❌ 推送失败
    echo.
    echo 💡 请检查：
    echo    1. 网络连接是否正常
    echo    2. 是否有仓库的写入权限
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

