@echo off
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)
rem echo say the name of the colors, don't read




rem 颜色表
rem call :ColorText 0a "blue"
rem call :ColorText 0C "green"
rem call :ColorText 0b "red"
rem echo.
rem call :ColorText 19 "yellow"
rem call :ColorText 2F "black"
rem call :ColorText 4e "white"

:start

:: ---------------------------------分割线：用户的代码-start-----------------------------------------


call :ColorText 2F "================使用注意事项================"
echo.
echo.
call :ColorText 2F "1、本机已经安装Git，保证每次启动都获取最新的篡改程序"
echo.
echo.
call :ColorText 2F "2、本机已经安装Fillder，且已经初始化相关配置，保证能捕捉请求且实施JS文件篡改"
echo.
echo.
call :ColorText 2F "3、请先关闭VPN、系统代理、已经打开了的Fildder"


:: 检测:Git安装情况
echo.
echo.
where git >nul 2>&1
if %errorlevel% equ 0 (
    call :ColorText 0a "检测成功...Git 已安装"
	echo.
    git --version
	
	:: 检查Git检出目录是否存在
	set "git_target_dir=D:\DC2_XiuXiu"
	if not exist "!git_target_dir!" (
		echo Git检出目录 "!git_target_dir!" 不存在，需要执行clone...
		echo 开始从远程拉取项目
		D:
		git clone https://github.com/DJ-HeYong/DC2_XiuXiu.git
	) else (
		echo Git检出目录 "!git_target_dir!" 已存在, 无需重新clone
	)
) else (
    call :ColorText 4e "检测失败...Git 未安装，这会导致无法获取最新的纂改代码"
	pause
	exit
)




:: 检测:代理情况
echo.
echo.
for /f "tokens=2,*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable') do set a=%%j
if "%a%" == "0x0" (
	call :ColorText 0a "检测成功...代理已关闭"
) else (
	call :ColorText 4e "检测失败...代理已打开，这会导致Fildder无法正常使用"
	pause
	exit
)



:: 启动游戏
echo.
echo.
set /p choice=若都完成，请输入1后开始游戏：
if %choice%==1 (
	D:
	cd "DC2_XiuXiu"
	git push
	call :ColorText 0a  "篡改脚本更新完成，请打开Flidder"
	echo.
	echo.


	echo "即将自动打开Fildder......"
	start "" "F:\Fiddler\Fiddler.exe"
	echo "延迟7秒打开浏览器，方便Flidder初始化完成"
	call :ColorText 0a   "打开Fildder成功"
	echo.
	echo.
	
	timeout /t 7 /nobreak >nul


	echo "即将打开浏览器"
	cd "C:\Program Files (x86)\Microsoft\Edge\Application"
	start msedge.exe https://www.4399.com/flash/198637.htm
	call :ColorText 0a   "打开浏览器成功"
	echo.
	echo.
	call :ColorText 0a   "接下来，请在浏览器上尽情享受《皇帝养成计划2》吧！"
) else (
    call :ColorText 4e  "放弃启动游戏"
)

echo.
echo.
pause


:: ---------------------------------分割线：用户的代码-over-----------------------------------------


goto :eof

:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof






