@echo off
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)
rem echo say the name of the colors, don't read




rem ��ɫ��
rem call :ColorText 0a "blue"
rem call :ColorText 0C "green"
rem call :ColorText 0b "red"
rem echo.
rem call :ColorText 19 "yellow"
rem call :ColorText 2F "black"
rem call :ColorText 4e "white"

:start

:: ---------------------------------�ָ��ߣ��û��Ĵ���-start-----------------------------------------


call :ColorText 19 "================ʹ��ע������================"
echo.
echo.
call :ColorText 19 "1�������Ѿ���װGit����֤ÿ����������ȡ���µĴ۸ĳ���"
echo.
echo.
call :ColorText 19 "2�������Ѿ���װFillder�����Ѿ���ʼ��������ã���֤�ܲ�׽������ʵʩJS�ļ��۸�"
echo.
echo.
call :ColorText 19 "3�����ȹر�VPN��ϵͳ�����Ѿ����˵�Fildder"
echo.
echo.

:: ���:Git��װ���
where git >nul 2>&1
if %errorlevel% equ 0 (
    call :ColorText 0a "���ɹ�...Git �Ѱ�װ"
	echo.
    git --version
	
	:: ���Git���Ŀ¼�Ƿ����
	set "git_target_dir=D:\DC2XiuXiu"
	if not exist "!git_target_dir!" (
		echo Git���Ŀ¼ "!git_target_dir!" �����ڣ����ڴ���...
		mkdir "!git_target_dir!"
		if exist "!git_target_dir!" (
			echo Git���Ŀ¼ "!git_target_dir!" �����ɹ���
			cd "!git_target_dir!"
			echo ��ʼ��Զ����ȡ��Ŀ
			cd
			git clone https://github.com/DJ-HeYong/DC2_XiuXiu.git
		) else (
			echo Git���Ŀ¼ "!git_target_dir!" ����ʧ�ܣ�
			pause
			exit
		)
	) else (
		echo Git���Ŀ¼ "!git_target_dir!" �Ѵ���, ���贴����
	)

) else (
    call :ColorText 0b "���ʧ��...Git δ��װ����ᵼ���޷���ȡ���µ���Ĵ���"
	pause
	exit
)

:: ���:�������
for /f "tokens=2,*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable') do set a=%%j
if "%a%" == "0x0" (
	call :ColorText 0a "���ɹ�...�����ѹر�"
) else (
	call :ColorText 0a "���ʧ��...�����Ѵ򿪣���ᵼ��Fildder�޷�����ʹ��"
	pause
	exit
)



set /p choice=������ɣ�������1��ʼ��Ϸ��
if %choice%==1 (
	D:
	cd "DC2_XiuXiu\DC2_XiuXiu"
	git push
	echo "�۸Ľű�������ɣ����Flidder"
	echo.
	echo.


	echo "�����Զ���Fildder......"
	start "" "F:\Fiddler\Fiddler.exe"
	echo "��Fildder�ɹ�"
	echo "�ӳ�7��������������Flidder��ʼ�����"
	echo.
	echo.
	
	timeout /t 7 /nobreak >nul


	echo "�����������"
	cd "C:\Program Files (x86)\Microsoft\Edge\Application"
	start msedge.exe https://www.4399.com/flash/198637.htm
	echo "��������ɹ�"
	echo.
	echo.


	echo "������������������Ͼ������ܡ��ʵ����ɼƻ�2���ɣ�"


) else (
    echo "����������Ϸ"
)

pause


:: ---------------------------------�ָ��ߣ��û��Ĵ���-over-----------------------------------------


goto :eof

:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof






