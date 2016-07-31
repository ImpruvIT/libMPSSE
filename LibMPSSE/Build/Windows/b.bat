rem echo off
cls

SET MinGW=%~dp0..\..\..\MinGW
SET MinGW_bin=%MinGW%\bin

ECHO MinGW bin directory: %MinGW_bin%

SET PATH=%PATH%;%MinGW_bin%

echo Downloading needed MinGW modules
mingw-get install gcc mingw32-make

echo Cleaning project... 
mingw32-make clean

echo --------------------------------------------------------------------------------
echo Building project... 
mingw32-make
copy libMPSSE.dll ..\..\..\Release\lib\windows\i386\ 
copy libMPSSE.a ..\..\..\Release\lib\windows\i386\

exit

'echo --------------------------------------------------------------------------------
'echo Building test application...
'cd ../../../Test
'del *.o *.exe
'mingw32-make

'echo Copying test application to PWD
'cd ../libMPSSE/Build/Windows
'copy ..\..\..\Test\test.exe .

'echo --------------------------------------------------------------------------------
'echo Running Test Application
'test.exe > output.txt
'start notepad output.txt
'echo --------------------------------------------------------------------------------
