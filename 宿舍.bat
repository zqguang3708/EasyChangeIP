@echo off
@REM 个人使用 Powered by zqguang3708
@echo *******************************************************************************
@netsh interface IP set address "校园网" static 172.30.52.224 255.255.255.0 172.30.52.1
@if not %errorlevel% EQU 0 goto erroradmin
@echo                                 IP OK......
@GOTO drcom
:drcom
@start C:\Drcom\DrUpdateClient\DrMain.exe
@if not %errorlevel% EQU 0 goto errordrcom
@echo                                Dr.com OK......
@goto exit

:erroradmin
@echo                       IP设置失败，可能是未使用管理员身份打开
@GOTO exit
:errordrcom
@echo                            打开客户端失败，可能是位置错误
@GOTO exit
:exit 
@ping /n 3 127.0.0.1 >nul