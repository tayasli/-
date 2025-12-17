# run-server.ps1 — start a simple local HTTP server for this folder
# Usage: run this script once; it will start Python's http.server in a new hidden window

$folder = Split-Path -Parent $MyInvocation.MyCommand.Path
if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
    Write-Host "Python executable not found in PATH. Install Python or adjust this script to use your python path." -ForegroundColor Yellow
    exit 1
}

Start-Process -FilePath "python" -ArgumentList "-m http.server 8000" -WorkingDirectory $folder -WindowStyle Hidden
Write-Host "Server started in background. Open http://localhost:8000/index.html" -ForegroundColor Green
