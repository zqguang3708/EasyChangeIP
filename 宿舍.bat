@echo off
@REM ����ʹ�� Powered by zqguang3708
@echo *******************************************************************************
@netsh interface IP set address "У԰��" static 172.30.52.224 255.255.255.0 172.30.52.1
@if not %errorlevel% EQU 0 goto erroradmin
@echo                                 IP OK......
@GOTO drcom
:drcom
@start C:\Drcom\DrUpdateClient\DrMain.exe
@if not %errorlevel% EQU 0 goto errordrcom
@echo                                Dr.com OK......
@goto exit

:erroradmin
@echo                       IP����ʧ�ܣ�������δʹ�ù���Ա��ݴ�
@GOTO exit
:errordrcom
@echo                            �򿪿ͻ���ʧ�ܣ�������λ�ô���
@GOTO exit
:exit 
@ping /n 3 127.0.0.1 >nul