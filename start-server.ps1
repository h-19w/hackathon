# WKU Horror Game - Local Development Server
$port = 8080
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$url = "http://localhost:$port"

Write-Host "========================================" -ForegroundColor Red
Write-Host "  WKU: WAKE UP - Horror Survival Game  " -ForegroundColor Red
Write-Host "========================================" -ForegroundColor Red
Write-Host ""
Write-Host "Opening $url in your default browser..." -ForegroundColor Green
Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
Write-Host ""

Set-Location $root
Start-Process $url

if (Get-Command python -ErrorAction SilentlyContinue) {
    python -m http.server $port
} elseif (Get-Command py -ErrorAction SilentlyContinue) {
    py -m http.server $port
} elseif (Get-Command npx -ErrorAction SilentlyContinue) {
    npx --yes serve -l $port .
} else {
    Write-Host "ERROR: Install Python 3 or Node.js to run the local server." -ForegroundColor Red
    pause
}
