@ECHO OFF
rem Imagex �Ҽ����ߣ���ӭ�޸����䡣Edit by H3.2019/02/25
                    
setlocal EnableDelayedExpansion
set v1=%1
set v2=%2
set K_HKLM=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell
set icon=%%SystemRoot%%\system32\shell32.dll,72
if not #%v2%==# goto :%v2%
if not #%v1%==# goto :%v1%
echo ��װ�����������������%Windir%\System32�У�����Imagexc install���뱣֤ϵͳ����Imagex���
echo ж�أ�Imagexc uninstall
GOTO :END

:Install
rem if not exist %Windir%\system32\Imagex.exe echo ����û��Imagex������˳���װ�� &goto :END
rem wim
reg add "HKCR\.wim" /f /ve /t REG_SZ /d "Microsoft Windows Imaging Format (WIM)"
rem Drive
reg add "HKCR\Drive\shell\Imagextools" /f /v "icon" /t REG_SZ /d "%icon%"
reg add "HKCR\Drive\shell\Imagextools" /f /v "MUIVerb" /t REG_SZ /d "Imagex ����"
reg add "HKCR\Drive\shell\Imagextools" /f /v "SubCommands" /t REG_SZ /d "ImagexDefDrvTo;ImagexBkUp;ImagexCleanup"
reg add "%K_HKLM%\ImagexDefDrvTo" /f /v "MUIVerb" /t REG_SZ /d "ѡ�������������ݻ�װ"
reg add "%K_HKLM%\ImagexDefDrvTo\Command" /f /ve /t REG_SZ /d "Imagexc.cmd %%1 DefDrvTo"
reg add "%K_HKLM%\ImagexCleanup" /f /v "MUIVerb" /t REG_SZ /d "����𻵵�ӳ�����"
reg add "%K_HKLM%\ImagexCleanup\Command" /f /ve /t REG_SZ /d "Imagexc.cmd Cleanup"
reg add "%K_HKLM%\ImagexBkUp" /f /v "MUIVerb" /t REG_SZ /d "���ݴ��̵�����������"
reg add "%K_HKLM%\ImagexBkUp\Command" /f /ve /t REG_SZ /d "Imagexc.cmd %%1 DrvBackUp"
rem Directory
reg add "HKCR\Directory\shell\Imagextools" /f /v "icon" /t REG_SZ /d "%icon%"
reg add "HKCR\Directory\shell\Imagextools" /f /v "MUIVerb" /t REG_SZ /d "Imagex ����"
reg add "HKCR\Directory\shell\Imagextools" /f /v "SubCommands" /t REG_SZ /d "ImagexDefDirTo;ImagexCapture;ImagexBootCapture;ImagexDiscard;ImagexCommit;ImagexCleanup"
reg add "%K_HKLM%\ImagexDefDirTo" /f /v "MUIVerb" /t REG_SZ /d "ѡ����Ŀ¼�����ͷŻ����"
reg add "%K_HKLM%\ImagexDefDirTo\Command" /f /ve /t REG_SZ /d "Imagexc.cmd %%1 DefDirTo"
reg add "%K_HKLM%\ImagexCommit" /f /v "MUIVerb" /t REG_SZ /d "ж�Ҵ�Ŀ¼(����)"
reg add "%K_HKLM%\ImagexCommit\Command" /f /ve /t REG_SZ /d "Imagexc.cmd %%1 Commit"
reg add "%K_HKLM%\ImagexDiscard" /f /v "MUIVerb" /t REG_SZ /d "ж�Ҵ�Ŀ¼(������)"
reg add "%K_HKLM%\ImagexDiscard\Command" /f /ve /t REG_SZ /d "Imagexc.cmd %%1 Discard"
reg add "%K_HKLM%\ImagexBootCapture" /f /v "MUIVerb" /t REG_SZ /d "���������"
reg add "%K_HKLM%\ImagexBootCapture\Command" /f /ve /t REG_SZ /d "Imagexc.cmd %%1 BootCapture"
reg add "%K_HKLM%\ImagexCapture" /f /v "MUIVerb" /t REG_SZ /d "���"
reg add "%K_HKLM%\ImagexCapture\Command" /f /ve /t REG_SZ /d "Imagexc.cmd %%1 Capture"
reg add "HKCR\Directory\Background\shell\Imagextools" /f /v "icon" /t REG_SZ /d "%icon%"
reg add "HKCR\Directory\Background\shell\Imagextools" /f /v "MUIVerb" /t REG_SZ /d "Imagex ����"
reg add "HKCR\Directory\Background\shell\Imagextools" /f /v "SubCommands" /t REG_SZ /d "ImagexCleanup"
rem ImageFile
reg add "HKCR\Microsoft Windows Imaging Format (WIM)\Shell\Imagextools" /f /v "icon" /t REG_SZ /d "%icon%"
reg add "HKCR\Microsoft Windows Imaging Format (WIM)\Shell\Imagextools" /f /v "MUIVerb" /t REG_SZ /d "Imagex ����"
reg add "HKCR\Microsoft Windows Imaging Format (WIM)\Shell\Imagextools" /f /v "SubCommands" /t REG_SZ /d "ImagexDefIndex;ImagexImageInfo;ImagexApply;ImagexApplyDrv;ImagexApplyDir;ImagexMounRo;ImagexMounRw"
reg add "%K_HKLM%\ImagexDefIndex" /f /v "MUIVerb" /t REG_SZ /d "����ӳ�������Ĭ�Ϻ�(��ǰΪ1)"
reg add "%K_HKLM%\ImagexDefIndex\Command" /f /ve /t REG_SZ /d "Imagexc.cmd %%1 DefIndex"
reg add "%K_HKLM%\ImagexMounRo" /f /v "MUIVerb" /t REG_SZ /d "ֻ�����ص�Ŀ¼"
reg add "%K_HKLM%\ImagexMounRo\Command" /f /ve /t REG_SZ /d "Imagexc.cmd %%1 MounRo"
reg add "%K_HKLM%\ImagexApplyDir" /f /v "MUIVerb" /t REG_SZ /d "�ͷŵ�Ŀ¼"
reg add "%K_HKLM%\ImagexApplyDir\Command" /f /ve /t REG_SZ /d "Imagexc.cmd %%1 ApplyDir"
reg add "%K_HKLM%\ImagexMounRw" /f /v "MUIVerb" /t REG_SZ /d "��д���ص�Ŀ¼"
reg add "%K_HKLM%\ImagexMounRw\Command" /f /ve /t REG_SZ /d "Imagexc.cmd %%1 MounRw"
reg add "%K_HKLM%\ImagexApplyDrv" /f /v "MUIVerb" /t REG_SZ /d "��װ����"
reg add "%K_HKLM%\ImagexApplyDrv\Command" /f /ve /t REG_SZ /d "Imagexc.cmd %%1 ApplyDrv"
reg add "%K_HKLM%\ImagexImageInfo" /f /v "MUIVerb" /t REG_SZ /d "�鿴ӳ����Ϣ"
reg add "%K_HKLM%\ImagexImageInfo\Command" /f /ve /t REG_SZ /d "Imagexc.cmd %%1 ImageInfo"
reg add "%K_HKLM%\ImagexApply" /f /v "MUIVerb" /t REG_SZ /d "�ͷŵ���ǰ"
reg add "%K_HKLM%\ImagexApply\Command" /f /ve /t REG_SZ /d "Imagexc.cmd %%1 Apply"
echo Install complete!
goto :EOF

:Uninstall
reg delete "HKCR\Drive\shell\Imagextools" /f
reg delete "HKCR\Directory\shell\Imagextools" /f
reg delete "HKCR\Microsoft Windows Imaging Format (WIM)\Shell\Imagextools" /f
reg delete "%K_HKLM%\ImagexDefDrvTo" /f
reg delete "%K_HKLM%\ImagexCleanup" /f
reg delete "%K_HKLM%\ImagexBkUp" /f
reg delete "%K_HKLM%\ImagexDefDirTo" /f
reg delete "%K_HKLM%\ImagexCommit" /f
reg delete "%K_HKLM%\ImagexDiscard" /f
reg delete "%K_HKLM%\ImagexMounRo" /f
reg delete "%K_HKLM%\ImagexApplyDir" /f
reg delete "%K_HKLM%\ImagexMounRw" /f
reg delete "%K_HKLM%\ImagexApplyDrv" /f
reg delete "%K_HKLM%\ImagexDefIndex" /f
reg delete "%K_HKLM%\ImagexBootCapture" /f
reg delete "%K_HKLM%\ImagexCapture" /f
reg delete "%K_HKLM%\ImagexImageInfo" /f
reg delete "%K_HKLM%\ImagexApply" /f
echo UnInstall complete!
goto :EOF

:BootCapture
set fn=%~n1
imagex /capture %v1% %v1%.WIM "%fn%" /boot /compress maximum
GOTO :END

:Capture
set fn=%~n1
imagex /capture %v1% %v1%.WIM "%fn%" /compress maximum
GOTO :END

:DrvBackUp
rem ����%1��ָ�����̣�����Ԥ����Ŀ���̣�Ŀ���������ļ����Զ�תΪ׷��
CALL :GetVarReg
if #%DrvTo%==# echo û�ж���������ݵ�Ŀ���̣� &goto :END
if #%v1%==# echo û�ж���Դ�̣� &goto :END
set bk=Capture
set d=%v1:~0,1%
set t=%date%
if exist "%DrvTo%backup-%d%" set bk=Append
Imagex /%bk% %v1% %DrvTo%backup-%d% "BKUP-%d%-%t%"
GOTO :END

:Cleanup
rem ɾ�����𻵵İ�װ��ӳ���������Դ
Imagex /Cleanup
GOTO :END

:Discard
Imagex.exe /Unmount %v1%
GOTO :END

:Commit
Imagex.exe /Unmount /commit %v1%
GOTO :END

:ApplyDrv
CALL :GetVarReg
if #%Index%==# set Index=1
Imagex.exe /Apply %v1% %Index% %DrvTo%
GOTO :END

:ApplyDir
CALL :GetVarReg
PUSHD %~dp0
if #%Index%==# set Index=1
Imagex.exe /Apply %v1% %Index% %DirTo%
GOTO :END

:Apply
CALL :GetVarReg
if #%Index%==# set Index=1
set pn=%~dpn1
if not exist %pn% md %pn%       
Imagex.exe /Apply %v1% %Index% %pn%
GOTO :END

:MounRo
CALL :GetVarReg
if #%Index%==# set Index=1
Imagex.exe /Mount %v1% %Index% %DirTo%
GOTO :END

:MounRw
CALL :GetVarReg
if #%Index%==# set Index=1
Imagex.exe /MountRw %v1% %Index% %DirTo%
GOTO :END

:ImageInfo
Imagex.exe /Info %v1%
GOTO :END

:DefIndex
set Index=1
set /p i=������ӳ�������Ĭ��Index:   
if #%i%==# GOTO :EOF
set Index=%i%
REG ADD "%K_HKLM%\ImagexDefIndex" /f /v "MUIVerb" /t REG_SZ /d "����ӳ�������Ĭ�Ϻ�(��ǰΪ%index%)"
GOTO :EOF

:DefDrvTo
REG ADD "%K_HKLM%\ImagexDefDrvTo" /f /v "MUIVerb" /t REG_SZ /d "ѡ�������������ݻ�װ(��ǰΪ%v1%)"
REG ADD "%K_HKLM%\ImagexApplyDrv" /f /v "MUIVerb" /t REG_SZ /d "��װ����:%v1% "
GOTO :EOF

:DefDirTo
REG ADD "%K_HKLM%\ImagexDefDirTo" /f /v "MUIVerb" /t REG_SZ /d "ѡ���ͷŻ����(��ǰΪ%v1%)"
REG ADD "%K_HKLM%\ImagexApplyDir" /f /v "MUIVerb" /t REG_SZ /d "�ͷŵ�Ŀ¼:%v1%"
REG ADD "%K_HKLM%\ImagexMounRo" /f /v "MUIVerb" /t REG_SZ /d "ֻ�����ص�Ŀ¼:%v1%"
REG ADD "%K_HKLM%\ImagexMounRw" /f /v "MUIVerb" /t REG_SZ /d "��д���ص�Ŀ¼:%v1%"
GOTO :EOF

:GetVarReg
For /f "tokens=2 delims=()" %%i in ('Reg Query "%K_HKLM%\ImagexDefIndex" /v "MUIVerb" ') do Set v=%%i
set Index=%v:~3%
For /f "tokens=2 delims=()" %%i in ('Reg Query "%K_HKLM%\ImagexDefDrvTo" /v "MUIVerb" ') do Set v=%%i
set DrvTo=%v:~3%
For /f "tokens=2 delims=()" %%i in ('Reg Query "%K_HKLM%\ImagexDefDirTo" /v "MUIVerb" ') do Set v=%%i
set DirTo=%v:~3%
GOTO :EOF

:END
pause

