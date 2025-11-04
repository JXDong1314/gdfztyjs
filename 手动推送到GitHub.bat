@echo off
chcp 65001 >nul

echo ================================
echo   手动推送到 GitHub
echo ================================
echo.
echo 正在推送...
echo.

git push -u origin main

if errorlevel 1 (
    echo.
    echo ================================
    echo 推送失败 - 网络问题
    echo ================================
    echo.
    echo GitHub 在国内访问可能不稳定
    echo.
    echo 建议使用网页上传方式：
    echo    1. 访问 GitHub 仓库页面
    echo    2. 点击 Add file -^> Upload files
    echo    3. 拖拽文件上传
    echo.
    echo 或者多试几次，有时候能成功
    echo.
) else (
    echo.
    echo ================================
    echo ✅ 推送成功！
    echo ================================
    echo.
    echo 网站将在 1-2 分钟后更新
    echo.
    echo 访问: https://github.com/JXDong1314/-online
    echo 查看你的仓库
    echo.
)

pause

