@echo off
@REM ����ʹ�� Powered by zqguang3708
@echo *******************************************************************************
@echo                                    ������IPĩλ......
:loop
@set jifangIpHead=172.29.12.
@set /p jifangIpEnd=
@set jifangIpReal=%jifangip%%jifangipend%
@netsh interface IP set address "У԰��" static %jifangIpReal% 255.255.255.0 172.29.12.1
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
@echo                       IP����ʧ�ܣ�������δʹ�ù���Ա��ݴ�
@GOTO exit
:errorip
@echo                            ��IP��ռ���ˣ���������Զ�Ѱ��
@goto loop
:exit 
@ping /n 3 127.0.0.1 >nul