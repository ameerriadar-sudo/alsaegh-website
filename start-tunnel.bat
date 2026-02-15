@echo off
echo ========================================
echo Starting Tunnel for Localhost:3000
echo ========================================
echo.
echo Choose your tunnel service:
echo.
echo 1. Ngrok (requires free account)
echo 2. Cloudflared (no account needed)
echo 3. Localtunnel (no account needed)
echo.
set /p choice="Enter choice (1-3): "

if "%choice%"=="1" goto ngrok
if "%choice%"=="2" goto cloudflared
if "%choice%"=="3" goto localtunnel

:ngrok
echo.
echo Starting ngrok...
echo If you see an authentication error, visit:
echo https://dashboard.ngrok.com/get-started/your-authtoken
echo.
ngrok http 3000
goto end

:cloudflared
echo.
echo Starting cloudflared (no account needed)...
npx --yes cloudflared tunnel --url http://localhost:3000
goto end

:localtunnel
echo.
echo Starting localtunnel (no account needed)...
npx --yes localtunnel --port 3000
goto end

:end
pause

