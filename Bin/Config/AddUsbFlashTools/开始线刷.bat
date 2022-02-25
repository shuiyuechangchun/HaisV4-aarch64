@echo off
title Hais丶HaisDevice 线刷 - Q群：927251103

echo.***********************************************
echo.
echo.  1、刷机有风险、刷入前请备份好数据，做好变砖准备。
echo.  2、此包未经测试，刷入出现任何问题自己负责。
echo.  3、刷入请先【解锁】进入Fastboot模式后打开此脚本。
echo.  4、刷入失败请检查USB、驱动、手机是否正常。
echo.  5、开机卡一屏可等10分钟,不开机可尝试格式化data后重刷。
echo.  6、刷入前请保持当前目录无空格,剩余大小大于10G,否则可能刷入失败。
echo.
echo.***********************************************
echo.
echo.  Y=保留数据刷入(默认)           N=双清刷入(大写,推荐手动格式化data后再刷)
echo.
set /p CHOICE=您的选择：
cd %~dp0
echo.
echo.请将手机进入fastboot,工具会自动开始刷入
echo.
echo.进入后如无响应请前往Q群'927251103'共享寻找驱动安装后重启手机于工具重新开始。
echo.
META-INF\fastboot %* getvar product 2>&1 | findstr /r /c:"^product: *HaisDevice" || (
	echo.当前机型不是HaisDevice，不型不匹配,禁止刷入
	pause		%HaisDevice%
	exit /B 1	%HaisDevice%
)	%HaisDevice%
META-INF\fastboot %* set_active a 
echo.
echo.
echo.   刷机过程请耐心等待,中途不要退出,完成后会有中文提示
echo.  请忽视'Invalid sparse file format at header magic'提示
echo.
echo.
if exist super.new.dat.brx (
	if not exist firmware-update\super.img (
		echo.正在解压中,硬盘剩余小于10G将会失败...
		META-INF\brx -d super.new.dat.brx -o firmware-update\super.img
	)
	META-INF\fastboot %* erase super  >NUL 2>NUL
	ping -n 5 127.0.0.1 >nul 2>nul
	echo.系统正在刷入中,请不要中途退出,完成后会有中文提示。
	META-INF\fastboot %* flash super firmware-update\super.img
)
if exist system.new.dat.brx (
	if not exist firmware-update\system.img (
		echo.线刷文件正在准备中...
		META-INF\brx -d system.new.dat.brx -o firmware-update\system.img
	)
	META-INF\fastboot %* flash system firmware-update\system.img
)
if exist vendor.new.dat.brx (
	if not exist firmware-update\vendor.img (
		echo.线刷文件正在准备中...
		META-INF\brx -d vendor.new.dat.brx -o firmware-update\vendor.img
	)
	META-INF\fastboot %* flash vendor firmware-update\vendor.img
)
if exist system_ext.new.dat.brx (
	if not exist firmware-update\system_ext.img (
		echo.线刷文件正在准备中...
		META-INF\brx -d system_ext.new.dat.brx -o firmware-update\system_ext.img
	)
	META-INF\fastboot %* flash system_ext firmware-update\system_ext.img
)
if exist vendor.new.dat.brx (
	if not exist firmware-update\vendor.img (
		echo.线刷文件正在准备中...
		META-INF\brx -d vendor.new.dat.brx -o firmware-update\vendor.img
	)
	META-INF\fastboot %* flash vendor firmware-update\vendor.img
)



if "%CHOICE%" == "N" (
	echo.用户数据正在清除中...
	META-INF\fastboot %* erase userdata  >NUL 2>NUL
	META-INF\fastboot %* erase secdata  >NUL 2>NUL
	META-INF\fastboot %* erase metadata  >NUL 2>NUL
	META-INF\fastboot %* erase exaid  >NUL 2>NUL
	META-INF\fastboot -w  >NUL 2>NUL
	echo.
)
echo.
echo.
echo.  恭喜您刷机完成，系统正在重启，如无响应可手动重启。
echo.
META-INF\fastboot %* set_active a 
META-INF\fastboot %* reboot 
echo.***********************************************
echo.
echo.  1、此包未经测试，刷入出现任何问题自己负责。
echo.  2、如不能开机，可尝试REC恢复或格式化data后开机。
echo.  3、如不能开机，可使用官方MiFlash刷官包恢复。
echo.  4、如觉得不错，希望你进群能支持一下Hais。
echo.
echo.***********************************************
echo.
echo.   如保留数据刷开机卡一屏，请尝试卸载面具后重启
echo.
echo.***********************************************
echo.  按任意键关闭此窗口
echo.
pause
exit