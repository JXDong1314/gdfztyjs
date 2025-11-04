@echo off
chcp 65001 >nul

echo ================================
echo   ⚠️  删除所有已部署的文件
echo ================================
echo.
echo 警告：此操作将删除云端所有文件！
echo.
set /p CONFIRM="确认删除所有文件？(y/n): "

if /i not "%CONFIRM%"=="y" (
    echo.
    echo ❌ 取消操作
    echo.
    echo 按任意键关闭窗口...
    pause >nul
    exit /b 0
)

echo.
echo 🗑️  正在删除所有文件...
echo.

tcb hosting delete / -e gdfztyjs-2gpucv007e6d0c87

echo.
echo ================================
echo ✅ 删除完成
echo ================================
echo.
echo 按任意键关闭窗口...

pause >nul

