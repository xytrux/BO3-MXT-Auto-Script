REM filepath: /c:/Users/Armando/Documents/BO3-MXT-Repack/MXT/Automation Script (Beta)/autoinject.bat
@echo off
setlocal

:: Set the path to the DLL and the target process name
set DLL_PATH="Dx11 ImGui - Black Ops lll.dll"
set TARGET_PROCESS=BlackOps3.exe
set INJECTOR_PATH="Injector.exe"

:: Find the process ID of the target process
for /f "tokens=2 delims=," %%i in ('tasklist /fi "imagename eq %TARGET_PROCESS%" /fo csv /nh') do set PID=%%i

:: Check if the process is running
if "%PID%"=="" (
    echo %TARGET_PROCESS% is not running.
    exit /b 1
)

:: Inject the DLL using Injector.exe
"%INJECTOR_PATH%" --process-name %TARGET_PROCESS% --inject %DLL_PATH%

echo DLL injected successfully.
endlocal