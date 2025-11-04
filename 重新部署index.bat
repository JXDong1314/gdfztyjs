@echo off
chcp 65001 >nul

echo ================================
echo   重新部署 index.html
echo ================================
echo.
echo 💡 单独上传 index.html 到根目录
echo.

tcb hosting deploy index.html /index.html -e gdfztyjs-2gpucv007e6d0c87

echo.
echo ================================
echo ✅ index.html 上传完成
echo ================================
echo.
echo 现在尝试访问：
echo https://gdfztyjs-2gpucv007e6d0c87.tcloudbaseapp.com
echo.
echo 或者查看控制台中的静态网站访问域名
echo.
echo 按任意键关闭窗口...

pause >nul

