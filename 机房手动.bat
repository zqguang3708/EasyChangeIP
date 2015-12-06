@echo off
@REM 个人使用 Powered by zqguang3708
@echo *******************************************************************************
@echo                                    请输入IP末位......
:loop
@set jifangIpHead=172.29.12.
@set /p jifangIpEnd=
@set jifangIpReal=%jifangip%%jifangipend%
@netsh interface IP set address "校园网" static %jifangIpReal% 255.255.255.0 172.29.12.1
@if not %errorlevel% EQU 0 goto erroradmin
@echo                                  IP OK......
@ping /n 5 127.0.0.1 >nul
@GOTO IPKO
:IPKO 
@ping www.baidu.com -n 2 >nul
@if not %errorlevel% EQU 0 goto errorip
@echo                                     BINGO!
@GOTO exit                        

:erroradmin
@echo                       IP设置失败，可能是未使用管理员身份打开
@GOTO exit
:errorip
@echo                            此IP被占用了，请更换或自动寻找
@goto loop
:exit 
@ping /n 3 127.0.0.1 >nul