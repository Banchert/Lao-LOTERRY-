REM ========================================
REM             QuickStart.bat
REM      เปิดแอปด้วยคลิกเดียว (ง่ายสุด)
REM ========================================
@echo off
title หวยเทพ AI - Quick Start
echo 🚀 กำลังเปิด หวยเทพ AI...
start "" "index.html"
echo ✅ เปิดเรียบร้อยแล้ว!
timeout /t 2 /nobreak >nul
exit

REM ========================================
REM             Server.bat  
REM        รัน HTTP Server อัตโนมัติ
REM ========================================
@echo off
title หวยเทพ AI - HTTP Server
color 0B
echo ========================================
echo          🌐 HTTP Server Mode
echo ========================================
echo.

REM ลองใช้ Python ก่อน
python --version >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ ใช้ Python HTTP Server
    echo 🌐 URL: http://localhost:8000
    echo.
    timeout /t 2 /nobreak >nul
    start "" "http://localhost:8000"
    python -m http.server 8000
    goto end
)

REM ถ้าไม่มี Python ลอง Node.js
node --version >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ ใช้ Node.js HTTP Server  
    echo 🌐 URL: http://localhost:3000
    echo.
    timeout /t 2 /nobreak >nul
    start "" "http://localhost:3000"
    npx serve . -p 3000
    goto end
)

REM ถ้าไม่มีทั้งคู่ ใช้วิธีธรรมดา
echo ⚠️  ไม่พบ Python หรือ Node.js
echo 🚀 เปิดด้วยวิธีธรรมดา
start "" "index.html"

:end
pause

REM ========================================
REM             Install.bat
REM       ติดตั้ง Dependencies อัตโนมัติ
REM ========================================
@echo off
title หวยเทพ AI - Auto Installer
color 0E
echo ========================================
echo         📦 Auto Installer
echo ========================================
echo.

echo 🔍 กำลังตรวจสอบ Python...
python --version >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ Python พร้อมใช้งาน
) else (
    echo ❌ ไม่พบ Python
    echo 💡 แนะนำให้ติดตั้งจาก: https://python.org
)

echo.
echo 🔍 กำลังตรวจสอบ Node.js...
node --version >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ Node.js พร้อมใช้งาน
    echo 📦 กำลังติดตั้ง serve package...
    npm install -g serve
    echo ✅ ติดตั้งเสร็จแล้ว!
) else (
    echo ❌ ไม่พบ Node.js
    echo 💡 แนะนำให้ติดตั้งจาก: https://nodejs.org
)

echo.
echo 🔍 กำลังตรวจสอบไฟล์โปรเจค...
if exist "index.html" (
    echo ✅ พบไฟล์ index.html
) else (
    echo ❌ ไม่พบไฟล์ index.html
    echo 💡 กรุณาใส่ไฟล์ index.html ในโฟลเดอร์นี้
)

echo.
echo 🎉 การตรวจสอบเสร็จสิ้น!
echo 💡 ใช้ Run.bat เพื่อเปิดแอป
pause

REM ========================================
REM             Chrome.bat
REM        เปิดด้วย Chrome เท่านั้น
REM ========================================
@echo off
title หวยเทพ AI - Chrome Mode
echo 🚀 เปิดด้วย Google Chrome...

if exist "C:\Program Files\Google\Chrome\Application\chrome.exe" (
    start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" --new-window "%CD%\index.html"
) else if exist "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" (
    start "" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --new-window "%CD%\index.html"
) else (
    echo ❌ ไม่พบ Google Chrome
    echo 🚀 เปิดด้วย Default Browser แทน...
    start "" "index.html"
)

echo ✅ เปิดเรียบร้อยแล้ว!
timeout /t 2 /nobreak >nul
exit

REM ========================================
REM             Fullscreen.bat
REM         เปิดแบบ Fullscreen
REM ========================================
@echo off
title หวยเทพ AI - Fullscreen Mode
echo 🎮 เปิดแบบ Fullscreen...

REM สร้างไฟล์ HTML ชั่วคราวสำหรับ Fullscreen
echo ^<!DOCTYPE html^> > temp_fullscreen.html
echo ^<html^>^<head^>^<title^>หวยเทพ AI^</title^>^</head^> >> temp_fullscreen.html
echo ^<body style="margin:0;padding:0;"^> >> temp_fullscreen.html
echo ^<iframe src="index.html" style="width:100vw;height:100vh;border:none;"^>^</iframe^> >> temp_fullscreen.html
echo ^<script^> >> temp_fullscreen.html
echo setTimeout(function(){document.documentElement.requestFullscreen();},1000); >> temp_fullscreen.html
echo ^</script^>^</body^>^</html^> >> temp_fullscreen.html

start "" "temp_fullscreen.html"
echo ✅ เปิด Fullscreen เรียบร้อยแล้ว!
echo 💡 กด F11 เพื่อออกจาก Fullscreen
timeout /t 3 /nobreak >nul

REM ลบไฟล์ชั่วคราว
del temp_fullscreen.html >nul 2>&1
exit

REM ========================================
REM             DevMode.bat
REM        โหมดสำหรับนักพัฒนา
REM ========================================
@echo off
title หวยเทพ AI - Developer Mode
color 0D
echo ========================================
echo         👨‍💻 Developer Mode
echo ========================================
echo.

echo [1] เปิด VS Code + Live Server
echo [2] เปิด Browser Developer Tools
echo [3] รัน Hot Reload Server
echo [4] ตรวจสอบ Console Errors
echo [5] กลับไปโหมดธรรมดา
echo.

set /p dev_choice="เลือกโหมด (1-5): "

if "%dev_choice%"=="1" goto vscode
if "%dev_choice%"=="2" goto devtools  
if "%dev_choice%"=="3" goto hotreload
if "%dev_choice%"=="4" goto console
if "%dev_choice%"=="5" goto normal
goto invalid

:vscode
echo 🚀 เปิด VS Code...
code .
echo 💡 ติดตั้ง Live Server Extension แล้วกด Go Live
pause
exit

:devtools
echo 🚀 เปิดพร้อม Developer Tools...
start "" "chrome.exe" --auto-open-devtools-for-tabs "%CD%\index.html"
pause
exit

:hotreload
echo 🔥 รัน Hot Reload Server...
if exist "package.json" (
    npm run dev
) else (
    npx vite . --port 5173
)
pause
exit

:console
echo 🐛 เปิดโหมดตรวจสอบ Console...
start "" "chrome.exe" --auto-open-devtools-for-tabs --disable-web-security "%CD%\index.html"
pause
exit

:normal
start "" "index.html"
exit

:invalid
echo ❌ ตัวเลือกไม่ถูกต้อง
pause
exit

REM ========================================
REM             package.json (ตัวอย่าง)
REM         สำหรับใช้กับ Node.js
REM ========================================
REM สร้างไฟล์ package.json แยกต่างหาก:

{
  "name": "lottery-ai-thai",
  "version": "1.0.0", 
  "description": "หวยเทพ AI - เครื่องกำเนิดเลขหวยด้วย AI",
  "main": "index.html",
  "scripts": {
    "start": "serve . -p 3000",
    "dev": "vite . --port 5173 --open",
    "build": "vite build",
    "preview": "vite preview",
    "serve": "serve dist -p 4000"
  },
  "keywords": ["lottery", "ai", "thai", "number-generator"],
  "author": "Your Name",
  "license": "MIT",
  "devDependencies": {
    "serve": "^14.0.0",
    "vite": "^5.0.0"
  }
}