@echo off
@REM 个人使用 Powered by zqguang3708
@echo *******************************************************************************
:loop
@echo                            请输入你的IP地址......
@set /p ip=
@set temp=%ip:~-2,1%
@IF "%temp%"=="." GOTO ipset1
@set temp=%ip:~-3,1%
@IF "%temp%"=="." GOTO ipset2
@set temp=%ip:~-4,1%
@IF "%temp%"=="." GOTO ipset3
:ipset1
@set ip0=0
@set ips=%ip:~0,-1%%ip0%
@GOTO IPOK
:ipset2
@set ip0=0
@set ips=%ip:~0,-2%%ip0%
@GOTO IPOK
:ipset3
@set ip0=0
@set ips=%ip:~0,-3%%ip0%
@GOTO IPOK
:IPOK
@netsh interface IP set address "校园网" static %ip% 255.255.255.0 %ips%
@if not %errorlevel% EQU 0 goto erroradmin
@echo                                 IP OK......
@GOTO drcom
:drcom
@start C:\Drcom\DrUpdateClient\DrMain.exe
@if not %errorlevel% EQU 0 goto errordrcom
@echo                                Dr.com OK......
@ping /n 5 127.0.0.1 >nul
@GOTO IPKO
:IPKO 
@ping www.baidu.com -n 2 >nul
@if not %errorlevel% EQU 0 goto errorip
@echo                                     BINGO!
@goto exit

:erroradmin
@echo                       IP设置失败，可能是未使用管理员身份打开
@GOTO exit
:errordrcom
@echo                            打开客户端失败，可能是位置错误
@GOTO exit
:errorip
@echo                                  此IP被占用了，请更换
@goto loop
:exit 
@ping /n 3 127.0.0.1 >nul		