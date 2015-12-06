@echo off
@REM 个人使用 Powered by zqguang3708
@echo *******************************************************************************
@set jifangIpHead=172.29.12.
@set /a jifangIpEnd=1
:loop
@set /a jifangIpEnd=%jifangIpEnd%+1
@IF jifangIpEnd==255 GOTO IPALL
@set jifangIpReal=%jifangIpHead%%jifangIpEnd%
@netsh interface IP set address "校园网" static %jifangIpReal% 255.255.255.0 172.29.12.1
@if not %errorlevel% EQU 0 goto erroradmin
@echo                                  IP OK......
@ping /n 5 127.0.0.1 >nul
@GOTO IPKO
:IPKO 
@ping www.baidu.com -n 2 >nul
@if not %errorlevel% EQU 0 goto loop
@echo                                     BINGO!
@GOTO exit

:IPALL
@echo                              貌似所以可用的IP都被占用了
@GOTO exit 
:erroradmin
@echo                       IP设置失败，可能是未使用管理员身份打开
@GOTO exit
:exit 
@ping /n 3 127.0.0.1 >nul