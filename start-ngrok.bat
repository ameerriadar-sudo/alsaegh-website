@echo off
echo Starting ngrok tunnel to localhost:3000...
echo.
echo If this is your first time using ngrok, you may need to:
echo 1. Sign up at https://dashboard.ngrok.com/signup
echo 2. Get your authtoken from https://dashboard.ngrok.com/get-started/your-authtoken
echo 3. Run: ngrok config add-authtoken YOUR_TOKEN
echo.
echo Starting ngrok...
echo.
npx --yes ngrok http 3000
pause

