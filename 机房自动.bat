@echo off
@REM ����ʹ�� Powered by zqguang3708
@echo *******************************************************************************
@set jifangIpHead=172.29.12.
@set /a jifangIpEnd=1
:loop
@set /a jifangIpEnd=%jifangIpEnd%+1
@IF jifangIpEnd==255 GOTO IPALL
@set jifangIpReal=%jifangIpHead%%jifangIpEnd%
@netsh interface IP set address "У԰��" static %jifangIpReal% 255.255.255.0 172.29.12.1
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
@echo                              ò�����Կ��õ�IP����ռ����
@GOTO exit 
:erroradmin
@echo                       IP����ʧ�ܣ�������δʹ�ù���Ա��ݴ�
@GOTO exit
:exit 
@ping /n 3 127.0.0.1 >nul