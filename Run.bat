@echo off
title หวยเทพ AI - Web Application Launcher
color 0A
echo.
echo ========================================
echo          🔮 หวยเทพ AI 🔮
echo     Web Application Launcher v1.0
echo ========================================
echo.

REM ตรวจสอบว่ามีไฟล์ index.html หรือไม่
if not exist "index.html" (
    echo ❌ ไม่พบไฟล์ index.html
    echo กรุณาตรวจสอบว่าไฟล์อยู่ในโฟลเดอร์เดียวกับ Run.bat
    pause
    exit /b 1
)

echo ✅ พบไฟล์ index.html แล้ว
echo.

REM แสดงตัวเลือกการรัน
echo เลือกวิธีการเปิด Web Application:
echo.
echo [1] เปิดด้วย Default Browser (แนะนำ)
echo [2] เปิดด้วย Chrome
echo [3] เปิดด้วย Firefox  
echo [4] เปิดด้วย Edge
echo [5] รันด้วย Python HTTP Server (Port 8000)
echo [6] รันด้วย Node.js HTTP Server (ถ้ามี)
echo [7] ออกจากโปรแกรม
echo.

set /p choice="กรุณาเลือก (1-7): "

if "%choice%"=="1" goto default_browser
if "%choice%"=="2" goto chrome
if "%choice%"=="3" goto firefox
if "%choice%"=="4" goto edge
if "%choice%"=="5" goto python_server
if "%choice%"=="6" goto node_server
if "%choice%"=="7" goto exit
goto invalid_choice

:default_browser
echo.
echo 🚀 เปิดด้วย Default Browser...
start "" "index.html"
echo ✅ เปิดเรียบร้อยแล้ว!
goto end

:chrome
echo.
echo 🚀 เปิดด้วย Google Chrome...
REM ตรวจสอบที่ตั้งของ Chrome
if exist "C:\Program Files\Google\Chrome\Application\chrome.exe" (
    start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" "%CD%\index.html"
    echo ✅ เปิด Chrome เรียบร้อยแล้ว!
) else if exist "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" (
    start "" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "%CD%\index.html"
    echo ✅ เปิด Chrome เรียบร้อยแล้ว!
) else (
    echo ❌ ไม่พบ Google Chrome
    echo กำลังเปิดด้วย Default Browser แทน...
    start "" "index.html"
)
goto end

:firefox
echo.
echo 🚀 เปิดด้วย Mozilla Firefox...
if exist "C:\Program Files\Mozilla Firefox\firefox.exe" (
    start "" "C:\Program Files\Mozilla Firefox\firefox.exe" "%CD%\index.html"
    echo ✅ เปิด Firefox เรียบร้อยแล้ว!
) else if exist "C:\Program Files (x86)\Mozilla Firefox\firefox.exe" (
    start "" "C:\Program Files (x86)\Mozilla Firefox\firefox.exe" "%CD%\index.html"
    echo ✅ เปิด Firefox เรียบร้อยแล้ว!
) else (
    echo ❌ ไม่พบ Mozilla Firefox
    echo กำลังเปิดด้วย Default Browser แทน...
    start "" "index.html"
)
goto end

:edge
echo.
echo 🚀 เปิดด้วย Microsoft Edge...
start "" "msedge" "%CD%\index.html"
echo ✅ เปิด Edge เรียบร้อยแล้ว!
goto end

:python_server
echo.
echo 🐍 ตรวจสอบ Python...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ ไม่พบ Python
    echo กรุณาติดตั้ง Python จาก https://python.org
    echo หรือเลือกวิธีอื่น
    pause
    goto main_menu
)

echo ✅ พบ Python แล้ว
echo 🚀 เริ่มต้น HTTP Server บน Port 8000...
echo.
echo 📡 เซิร์ฟเวอร์กำลังรัน...
echo 🌐 เปิดเบราว์เซอร์ไปที่: http://localhost:8000
echo 🛑 กด Ctrl+C เพื่อหยุดเซิร์ฟเวอร์
echo.

REM เปิดเบราว์เซอร์อัตโนมัติ
timeout /t 2 /nobreak >nul
start "" "http://localhost:8000"

REM รัน Python HTTP Server
python -m http.server 8000
goto end

:node_server
echo.
echo 📦 ตรวจสอบ Node.js...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ ไม่พบ Node.js
    echo กรุณาติดตั้ง Node.js จาก https://nodejs.org
    echo หรือเลือกวิธีอื่น
    pause
    goto main_menu
)

echo ✅ พบ Node.js แล้ว
echo 🚀 เริ่มต้น HTTP Server บน Port 3000...

REM ตรวจสอบว่ามี package.json หรือไม่
if exist "package.json" (
    echo 📦 พบ package.json - รันด้วย npm
    echo กำลังติดตั้ง dependencies...
    call npm install
    echo กำลังรันเซิร์ฟเวอร์...
    call npm run dev
) else (
    echo 📦 ไม่พบ package.json - รันด้วย npx serve
    echo กำลังรันเซิร์ฟเวอร์...
    echo.
    echo 📡 เซิร์ฟเวอร์กำลังรัน...
    echo 🌐 เปิดเบราว์เซอร์ไปที่: http://localhost:3000
    echo 🛑 กด Ctrl+C เพื่อหยุดเซิร์ฟเวอร์
    echo.
    
    REM เปิดเบราว์เซอร์อัตโนมัติ
    timeout /t 2 /nobreak >nul
    start "" "http://localhost:3000"
    
    npx serve . -p 3000
)
goto end

:invalid_choice
echo.
echo ❌ ตัวเลือกไม่ถูกต้อง กรุณาเลือก 1-7
echo.
pause
goto main_menu

:main_menu
cls
goto start

:end
echo.
echo 🎉 ขอบคุณที่ใช้งาน หวยเทพ AI!
echo 💡 Tips: สามารถรันไฟล์นี้ได้ทุกเมื่อ
echo.

:exit
pause