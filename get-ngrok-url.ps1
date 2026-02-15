# Get ngrok URL from API
Write-Host "Checking ngrok status..." -ForegroundColor Yellow

$maxAttempts = 10
$attempt = 0
$found = $false

while ($attempt -lt $maxAttempts -and -not $found) {
    try {
        $response = Invoke-RestMethod -Uri "http://localhost:4040/api/tunnels" -ErrorAction Stop
        $tunnel = $response.tunnels | Where-Object { $_.proto -eq 'https' } | Select-Object -First 1
        
        if ($tunnel) {
            Write-Host ""
            Write-Host "========================================" -ForegroundColor Green
            Write-Host "✅ NGROK TUNNEL ACTIVE" -ForegroundColor Green
            Write-Host "========================================" -ForegroundColor Green
            Write-Host ""
            Write-Host "Your Public URL:" -ForegroundColor Yellow
            Write-Host $tunnel.public_url -ForegroundColor Cyan -BackgroundColor Black
            Write-Host ""
            Write-Host "Local URL: http://localhost:3000" -ForegroundColor Gray
            Write-Host "Ngrok Dashboard: http://localhost:4040" -ForegroundColor Gray
            Write-Host ""
            Write-Host "========================================" -ForegroundColor Green
            Write-Host ""
            $found = $true
            break
        }
    } catch {
        $attempt++
        if ($attempt -lt $maxAttempts) {
            Write-Host "Waiting for ngrok to start... ($attempt/$maxAttempts)" -ForegroundColor Gray
            Start-Sleep -Seconds 2
        }
    }
}

if (-not $found) {
    Write-Host ""
    Write-Host "⚠️  Could not connect to ngrok API" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Please make sure:" -ForegroundColor White
    Write-Host "1. Ngrok is running (check if a window opened)" -ForegroundColor White
    Write-Host "2. Visit http://localhost:4040 in your browser" -ForegroundColor White
    Write-Host "3. Look for the 'Forwarding' URL in the ngrok window" -ForegroundColor White
    Write-Host ""
}
