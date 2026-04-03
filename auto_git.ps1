$Path = "$HOME\Desktop"
$Files = @("otjimalka.html", "otjimalka.txt", "wattmeter.html", "wattmeter.txt")

clear
Write-Host "--- AUTO-GIT START ---" -ForegroundColor Cyan
cd $Path

if (-not (Test-Path ".git")) {
    git init
    git branch -M main
}

while($true) {
    $time = Get-Date -Format "HH:mm:ss"
    $changes = git status --short $Files
    
    if ($changes) {
        Write-Host "[$time] Sending to GitHub..." -ForegroundColor Yellow
        git add $Files
        git commit -m "Auto-update $time"
        git push origin main
        Write-Host "[$time] Success!" -ForegroundColor Green
    } else {
        Write-Host "[$time] No changes." -ForegroundColor Gray
    }
    
    Start-Sleep -Seconds 900
}