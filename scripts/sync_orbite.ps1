# Sync-Orbite.ps1
# Synchronizes A0 Atelier (Local) with Orbite (GitHub)
# Usage: .\scripts\sync_orbite.ps1 [-Message "Your commit message"]

param (
    [string]$Message = "feat: A0 Atelier sync $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
)

$ErrorActionPreference = "Stop"

function Write-Status {
    param([string]$Text, [string]$Color = "Cyan")
    Write-Host "[$((Get-Date).ToString('HH:mm:ss'))] $Text" -ForegroundColor $Color
}

Set-Location "$PSScriptRoot\.."

Write-Status "🚀 Initiating Sync to Orbite..."

# 1. Check Status
Write-Status "Checking workspace status..."
$status = git status --porcelain
if (-not $status) {
    Write-Status "Working directory clean. Pulling latest changes..." -Color Yellow
    git pull --rebase origin main
    exit
}

# 2. Add Changes
Write-Status "Staging changes..."
git add .

# 3. Commit
Write-Status "Committing: $Message"
git commit -m "$Message"

# 4. Pull & Push
Write-Status "Pulling remote changes (Rebase)..."
try {
    git pull --rebase origin main
}
catch {
    Write-Status "⚠️ Conflict detected or pull failed. Please resolve manually." -Color Red
    exit 1
}

Write-Status "Pushing to Orbite..."
git push origin main

Write-Status "✅ Sync Complete. Atelier is in orbit." -Color Green
