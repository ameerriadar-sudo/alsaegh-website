# Start ngrok tunnel for Next.js (port 3000)
Write-Host "Starting ngrok tunnel..." -ForegroundColor Green

# Start ngrok in background
Start-Job -ScriptBlock {
    npx --yes ngrok http 3000
} | Out-Null

# Wait for ngrok to start
Write-Host "Waiting for ngrok to initialize..." -ForegroundColor Yellow
Start-Sleep -Seconds 6

# Try to get the public URL
$maxRetries = 10
$retry = 0
$url = $null

while ($retry -lt $maxRetries -and -not $url) {
    try {
        $response = Invoke-RestMethod -Uri "http://localhost:4040/api/tunnels" -ErrorAction Stop
        $httpsTunnel = $response.tunnels | Where-Object { $_.proto -eq 'https' } | Select-Object -First 1
        if ($httpsTunnel) {
            $url = $httpsTunnel.public_url
            break
        }
    } catch {
        $retry++
        Start-Sleep -Seconds 2
    }
}

if ($url) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "Your ngrok public URL:" -ForegroundColor Green
    Write-Host $url -ForegroundColor Cyan
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Ngrok dashboard: http://localhost:4040" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Press Ctrl+C to stop ngrok when done." -ForegroundColor Yellow
} else {
    Write-Host ""
    Write-Host "Could not automatically retrieve URL." -ForegroundColor Yellow
    Write-Host "Please open http://localhost:4040 in your browser" -ForegroundColor Yellow
    Write-Host "to see the ngrok dashboard and get your public URL." -ForegroundColor Yellow
    Write-Host ""
}

# Keep script running
Write-Host "Ngrok is running. Press Ctrl+C to stop..." -ForegroundColor Gray
try {
    while ($true) {
        Start-Sleep -Seconds 10
    }
} catch {
    Write-Host "Stopping ngrok..." -ForegroundColor Yellow
    Get-Job | Stop-Job
    Get-Job | Remove-Job
}

