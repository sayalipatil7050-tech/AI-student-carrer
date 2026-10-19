@echo off
setlocal enabledelayedexpansion
title AI-Based Student Career Recommendation System - College Design Thinking Project

echo =====================================================================
echo  AI-BASED STUDENT CAREER RECOMMENDATION SYSTEM
echo  College Design Thinking Project
echo  Backend: Java Spring Boot ^| Database: SQLite ^| AI/ML: Java ML
echo =====================================================================
echo.

REM 1. Check Java Installation
where java >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Java is not installed or not in your system PATH!
    echo Please install OpenJDK 8, 11, 17, or 21 from https://adoptium.net/
    echo After installing, add the JDK bin directory to your PATH and restart this script.
    pause
    exit /b 1
)

echo [OK] Java detected:
java -version
echo.

REM 2. Check Maven Installation
where mvn >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo [OK] System Maven detected. Starting Spring Boot Application...
    mvn spring-boot:run
    goto END
)

REM Check local portable maven
if exist "%~dp0.tools\apache-maven-3.9.6\bin\mvn.cmd" (
    echo [OK] Local portable Maven found in .tools
    call "%~dp0.tools\apache-maven-3.9.6\bin\mvn.cmd" spring-boot:run
    goto END
)

echo [INFO] System Maven not found in PATH.
echo Downloading lightweight portable Maven automatically (one-time setup)...
if not exist "%~dp0.tools" mkdir "%~dp0.tools"

powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Write-Host 'Downloading Apache Maven...'; Invoke-WebRequest -Uri 'https://archive.apache.org/dist/maven/maven-3/3.8.8/binaries/apache-maven-3.8.8-bin.zip' -OutFile '%~dp0.tools\maven.zip' -UseBasicParsing; Write-Host 'Extracting Maven...'; Expand-Archive -Path '%~dp0.tools\maven.zip' -DestinationPath '%~dp0.tools' -Force; Remove-Item '%~dp0.tools\maven.zip' -Force"

if exist "%~dp0.tools\apache-maven-3.8.8\bin\mvn.cmd" (
    echo [OK] Portable Maven ready. Starting Spring Boot Application...
    call "%~dp0.tools\apache-maven-3.8.8\bin\mvn.cmd" spring-boot:run
    goto END
)

echo [ERROR] Could not automatically download Maven.
echo Please install Apache Maven from https://maven.apache.org/download.cgi
echo or run this project inside IntelliJ IDEA / VS Code with Maven extension.
pause
exit /b 1

:END
pause
