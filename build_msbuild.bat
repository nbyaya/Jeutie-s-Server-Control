@echo off
chcp 65001 >nul
echo 使用MSBuild编译 Jeutie's Server Control 项目
echo ================================================

REM 设置MSBuild路径
set MSBUILD="C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\MSBuild.exe"

REM 设置项目文件路径
set PROJECT_FILE="Source\Jeuties Server Control.csproj"

REM 设置输出目录
set OUTPUT_DIR="D:\WowWork\Jeutie-s-Server-Control\Binary"

echo 使用MSBuild: %MSBUILD%
echo 项目文件: %PROJECT_FILE%
echo 输出目录: %OUTPUT_DIR%
echo.

echo 检查项目文件是否存在...
if not exist %PROJECT_FILE% (
    echo [错误] 项目文件不存在: %PROJECT_FILE%
    echo 请确保项目文件存在
    pause
    exit /b 1
)

echo 开始编译...
%MSBUILD% %PROJECT_FILE% /p:Configuration=Release /p:Platform="Any CPU" /p:OutputPath=%OUTPUT_DIR% /p:TargetFrameworkVersion=v4.8

echo.
echo 编译完成，退出代码: %ERRORLEVEL%
if %ERRORLEVEL% EQU 0 (
    echo.
    echo [成功] MSBuild编译成功！
    if exist %OUTPUT_DIR%\JeutiesServerControl.exe (
        echo 输出文件: %OUTPUT_DIR%\JeutiesServerControl.exe
        dir %OUTPUT_DIR%\JeutiesServerControl.exe
    ) else (
        echo 警告: 未找到输出文件
    )
) else (
    echo.
    echo [失败] MSBuild编译失败！
    echo 请检查错误信息
)

echo.
pause
