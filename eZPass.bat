@ECHO OFF
TITLE eZPass - Generating Random Passwords
SETLOCAL ENABLEDELAYEDEXPANSION
MODE 136,20
COLOR 1F
SET "INCREDIBLE="
SET "0=%~1"
IF DEFINED 0 (
	CALL :GotCalled
)
:Start
IF EXIST "%~dp0P.TXT" DEL /F /Q "%~dp0P.TXT"
ECHO.���������������������������������������������������������������������������������������������������������������������������������������
ECHO.��eZPass V.1.0 is calculating random passwords. Length 16 will be added to your clipboard.
ECHO.��
CALL :Main "8"
ECHO.��8:   !P!
ECHO.8:   !P!>>"%~dp0P.TXT"
ECHO.��
CALL :Main "12"
ECHO.��12:  !P!
ECHO.12:  !P!>>"%~dp0P.TXT"
ECHO.��
CALL :Main "16"
ECHO.!P!|CLIP
ECHO.��16:  !P!
ECHO.16:  !P!>>"%~dp0P.TXT"
ECHO.��
CALL :Main "24"
ECHO.��24:  !P!
ECHO.24:  !P!>>"%~dp0P.TXT"
ECHO.��
CALL :Main "32"
ECHO.��32:  !P!
ECHO.32:  !P!>>"%~dp0P.TXT"
ECHO.��
CALL :Main "48"
ECHO.��48:  !P!
ECHO.48:  !P!>>"%~dp0P.TXT"
ECHO.��
CALL :Main "64"
ECHO.��64:  !P!
ECHO.64:  !P!>>"%~dp0P.TXT"
ECHO.��
CALL :Main "128"
ECHO.��128: !P!
ECHO.128: !P!>>"%~dp0P.TXT"
ECHO.���������������������������������������������������������������������������������������������������������������������������������������

IF DEFINED INCREDIBLE (
	CLS
	ECHO.You've woken the creature.
	ECHO.
	CALL :Main "256"
	ECHO.��256: !P!
	ECHO.256: !P!>>"%~dp0P.TXT"
	ECHO.
	CALL :Main "512"
	ECHO.��512:  !P!
	ECHO.512:  !P!>>"%~dp0P.TXT"
	ECHO.
	CALL :Main "1024"
	ECHO.��1024: !P!
	ECHO.1024: !P!>>"%~dp0P.TXT"
	ECHO.
	CALL :Main "2048"
	ECHO.��2048: !P!
	ECHO.2048: !P!>>"%~dp0P.TXT"
	ECHO.
	CALL :Main "4096"
	ECHO.��4096: !P!
	ECHO.4096: !P!>>"%~dp0P.TXT"
)
SET "P=0000"
SET "N=0000"
SET "1=0000"
TITLE 0000
START /WAIT "" NOTEPAD "%~dp0P.TXT"
IF EXIST "%~dp0P.TXT" DEL /F /Q "%~dp0P.TXT"
EXIT /B
:Main
SET "P=" 
SET "N=%~1"
SET /A "N = !N!" 2>nul  
FOR /L %%I IN (1 1 !N!) DO ( 
	SET /A "X = !RANDOM!!N! %% 94 + 33" 
	SET "1=!P:~-8!"
	TITLE eZPass - Generating Random Passwords - !N!: ^!1!
	CMD /C EXIT /B !X! 2>NUL
	SET "P=!P!!=ExitCodeAscii!" 
) 
EXIT /B

:GotCalled
IF "!0!"=="fast" (
	MODE 35,8
	CALL :Main "16"
	ECHO.!P!|CLIP
	ECHO.Generating password with n=16...
	ECHO.
	ECHO.
	ECHO.       ��������������������
	ECHO.       ��!P!��
	ECHO.       ��������������������

	TITLE eZPass - eZMode
)
PAUSE >NUL
EXIT