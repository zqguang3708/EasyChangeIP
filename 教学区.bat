@echo off
@REM ����ʹ�� Powered by zqguang3708
@echo *******************************************************************************
:loop
@echo                            ���������IP��ַ......
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
@netsh interface IP set address "У԰��" static %ip% 255.255.255.0 %ips%
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
@echo                       IP����ʧ�ܣ�������δʹ�ù���Ա��ݴ�
@GOTO exit
:errordrcom
@echo                            �򿪿ͻ���ʧ�ܣ�������λ�ô���
@GOTO exit
:errorip
@echo                                  ��IP��ռ���ˣ������
@goto loop
:exit 
@ping /n 3 127.0.0.1 >nul		