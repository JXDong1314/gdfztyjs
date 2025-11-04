@echo off
chcp 65001 >nul

echo ================================
echo   完整重新部署所有文件
echo ================================
echo.
echo 步骤1: 删除云端所有文件
echo.
set /p CONFIRM1="确认删除云端所有文件？(y/n): "

if /i not "%CONFIRM1%"=="y" (
    echo.
    echo ❌ 取消操作
    echo.
    pause
    exit /b 0
)

echo.
echo 🗑️  正在删除云端所有文件...
tcb hosting delete / -e gdfztyjs-2gpucv007e6d0c87

echo.
echo ================================
echo 步骤2: 重新上传所有文件
echo ================================
echo.
echo 按任意键继续上传...
pause

echo.
echo 🚀 正在上传所有文件到云端...
echo    这可能需要几分钟，请耐心等待...
echo.

tcb hosting deploy ./ / -e gdfztyjs-2gpucv007e6d0c87

echo.
echo ================================
echo ✅ 部署完成！
echo ================================
echo.
echo 🌐 等待 5 分钟后访问：
echo    https://gdfztyjs-2gpucv007e6d0c87.tcloudbaseapp.com
echo.
echo 💡 提示：
echo    - 如果还是404，检查控制台中的静态网站设置
echo    - 确认索引文档设置为 index.html
echo.
echo 按任意键关闭窗口...

pause >nul

