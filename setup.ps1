# 1. Install PowerShell 7 and Fastfetch using Winget
Write-Host "Installing PowerShell 7 and Fastfetch..." -ForegroundColor Cyan
winget install --id Microsoft.PowerShell --source winget --accept-package-agreements --accept-source-agreements
winget install --id fastfetch-cli.fastfetch --source winget --accept-package-agreements --accept-source-agreements

# 2. Define directory paths
$homeDir = $HOME
$configDir = Join-Path $homeDir ".config"
$fastfetchDir = Join-Path $configDir "fastfetch"
$psProfileDir = Join-Path $homeDir "Documents\PowerShell"

# 3. Create the directories and hide .config
if (-not (Test-Path $configDir)) {
    Write-Host "Creating hidden .config directory..."
    New-Item -Path $configDir -ItemType Directory -Force | Out-Null
    # Make the .config folder hidden
    (Get-Item $configDir).Attributes += 'Hidden'
}

if (-not (Test-Path $fastfetchDir)) {
    Write-Host "Creating fastfetch directory inside .config..."
    New-Item -Path $fastfetchDir -ItemType Directory -Force | Out-Null
}

if (-not (Test-Path $psProfileDir)) {
    Write-Host "Creating PowerShell directory in Documents..."
    New-Item -Path $psProfileDir -ItemType Directory -Force | Out-Null
}

# 4. Write config.jsonc
Write-Host "Writing config.jsonc..."
$configContent = @'
{
  "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
  "logo": {
    "type": "file",
    "source": "C:/Users/aniru/.config/fastfetch/ascii.txt",
    "color": {
      "1": "#FFFFFF",  
      "2": "#F2CDCD",
      "3": "#F5C2E7",
      "4": "#FAB387",
      "5": "#F9E2AF",
      "6": "#A6E3A1",
      "7": "#94E2D5",
      "8": "#89DCEB",
      "9": "#710193" 
    },
    "padding": {
      "top": 1,
      "right": 3
    }
  },
  "display": {
    "separator": " "
  },
  "modules": [
    "break",
    {
      "type": "title",
      "color": {
        "user": "#F5C2E7",
        "at": "#CDD6F4",
        "host": "#89DCEB"
      }
    },
    "break",
    {
      "type": "os",
      "key": "",
      "keyColor": "#89DCEB"
    },
    {
      "type": "cpu",
      "key": "",
      "keyColor": "#F5C2E7"
    },
    {
      "type": "board",
      "key": "󰚗",
      "keyColor": "#FAB387"
    },
    {
      "type": "memory",
      "key": "",
      "keyColor": "#A6E3A1",
      "format": "{used} / {total} ({percentage})"
    },
    {
      "type": "disk",
      "key": "",
      "keyColor": "#94E2D5"
    },
    "break",
    {
      "type": "colors",
      "symbol": "circle"
    }
  ]
}
'@
$configPath = Join-Path $fastfetchDir "config.jsonc"
Set-Content -Path $configPath -Value $configContent -Encoding UTF8

# 5. Write ascii.txt
Write-Host "Writing ascii.txt..."
$asciiContent = @'
$9⠀⠀⠀⠀⠀⠀⠀⢢⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣶⣶⡟⠁⠀⠀⠀⠀⠀
$9⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣷⣶⣦⣤⣀⡀⠀⠀⠀⠀⢀⣀⣤⣴⣶⣶⣶⣶⣶⣶⣦⣤⣀⡀⢀⣀⣠⣤⣴⣶⣾⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀
$9⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀
$9⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
$9⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
$9⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⠁⠙⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠀⠸⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
$9⠀⠀⠀⠀⠀⠀⠐⢶⣶⣶⣶⣶⣶⣶⣾⣿⣿⣿⣿⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣶⣶⣶⣶⣾⠟⠁⠀⠀⠀⠀⠀⠀
$9 ⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀$1⠠⣶⡆$9⠈⠻⣿⣿⣿⣿⣿⠋$1⠠⣶⡆$9⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀
$9⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣤⣤⣤⣤⣤⣿⣿⣿⣿⣿⣦⣤⣤⣶⣶⣶⣾⡿⢿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
$9⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⡛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢀⣾⣿⣿⣿⣿⣯⣤⡤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
$9⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠶⣶⣶⣾⣿⣿⣿⣿⣧⠀⠛⠁⠀⠈⠿⠋⠉⠉⠉⠉⠻⠋⠀⠀⠈⠁⢠⣾⣿⣿⣿⣿⣿⣿⣿⣷⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀
$9⠀⠀⠀⠀⠀⠀⢠⣤⣤⣤⣀⠀⠈⠻⢿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⠟⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀
$9⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣷⣦⡀⠀⠙⠿⣿⣿⣿⣿⣿⣦⣀⣠⣀⣴⡀⣠⡀⣠⡀⣴⣄⣠⣾⣿⣿⣿⣿⣿⣿⡿⠋⠀⣼⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀
$9⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣋⣀⣠⣾⣿⣿⣿⣿⣿⣿⣷⣶⣶⣤⣄⠀
$9⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷
$9⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠛⠻⣿⣿⣿⡿⠟⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿
$9⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠿⠿⠿⠛⠁⣿⣿⠃⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⠁⠀⠀⠀⠀⠀⠹⡇⠀⠀⠀⠈⠙⠛⠋⠁⣸⡿⠃
$9⠸⣿⣿⡟⠉⠉⠉⠉⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠛⠁⠀⠀⠀⠀⠙⣧⠙⣿⣿⣿⣿⣿⣿⣿⣿⠘⡏⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡿⠁⠀
$9⠀⢻⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠣⠈⠻⣿⡿⢿⣿⣿⣿⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
$9⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢷⠈⢻⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
$9⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
$9⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
'@
$asciiPath = Join-Path $fastfetchDir "ascii.txt"
Set-Content -Path $asciiPath -Value $asciiContent -Encoding UTF8

# 6. Write profile.ps1
Write-Host "Writing profile.ps1 to Documents\PowerShell..."
$profileContent = @'
### Chris Titus Tech's PowerShell profile


Write-Host "Use 'Show-Help' to list all available functions" -ForegroundColor Yellow


#KeyBinds
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineKeyHandler -Chord 'Ctrl+w' -Function BackwardDeleteWord
Set-PSReadLineKeyHandler -Chord 'Alt+d' -Function DeleteWord
Set-PSReadLineKeyHandler -Chord 'Ctrl+LeftArrow' -Function BackwardWord
Set-PSReadLineKeyHandler -Chord 'Ctrl+RightArrow' -Function ForwardWord
Set-PSReadLineKeyHandler -Chord 'Ctrl+z' -Function Undo
Set-PSReadLineKeyHandler -Chord 'Ctrl+y' -Function Redo

# Functions

# System Utilities
function uptime {
    (Get-Date) - (Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime | Select-Object Days, Hours, Minutes, Seconds
}

function winutil {
    Invoke-RestMethod https://christitus.com/win | Invoke-Expression
}

function winutildev {
    Invoke-RestMethod https://christitus.com/windev | Invoke-Expression
}

# Git Shortcuts
function gs { git status }
function ga { git add . }
function gp { git push }
function gpush { git push }
function gpull { git pull }
function gcl { git clone $args }
function g { __zoxide_z github }

function gcom {
    git add .
    git commit -m "$args"
}

function lazyg {
    git add .
    git commit -m "$args"
    git push
}

function docs {
    Set-Location -Path ([Environment]::GetFolderPath("MyDocuments"))
}



# Help Function
function Show-Help {
    $title    = $PSStyle.Foreground.BrightMagenta
    $section  = $PSStyle.Foreground.BrightBlue
    $command  = $PSStyle.Foreground.BrightGreen
    $desc     = $PSStyle.Foreground.BrightWhite
    $accent   = $PSStyle.Foreground.BrightYellow
    $dim      = $PSStyle.Foreground.BrightBlack
    $reset    = $PSStyle.Reset

    Write-Host @"
${title}󰘳 PowerShell Profile Help${reset}
${dim}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${reset}

${section}󰊢 Update${reset}
  ${command}Update-Profile${reset}  ${accent}→${reset} ${desc}Updates the profile from a remote repository.${reset}

${section}󰊢 Git Shortcuts${reset}
${dim}────────────────────────────────────────────────────${reset}
  ${command}g${reset}                  ${accent}→${reset} ${desc}Changes to the GitHub directory${reset}
  ${command}ga${reset}                 ${accent}→${reset} ${desc}git add .${reset}
  ${command}gcl <repo>${reset}         ${accent}→${reset} ${desc}git clone${reset}
  ${command}gcom <message>${reset}     ${accent}→${reset} ${desc}add + commit${reset}
  ${command}gp / gpush${reset}         ${accent}→${reset} ${desc}git push${reset}
  ${command}gpull${reset}              ${accent}→${reset} ${desc}git pull${reset}
  ${command}gs${reset}                 ${accent}→${reset} ${desc}git status${reset}
  ${command}lazyg <message>${reset}    ${accent}→${reset} ${desc}add + commit + push${reset}

${section}󰘴 System Shortcuts${reset}
${dim}────────────────────────────────────────────────────${reset}
  ${command}docs${reset}               ${accent}→${reset} ${desc}Documents folder${reset}
  ${command}uptime${reset}             ${accent}→${reset} ${desc}System uptime${reset}
  ${command}winutil${reset}            ${accent}→${reset} ${desc}Run WinUtil${reset}
  ${command}winutildev${reset}         ${accent}→${reset} ${desc}Run WinUtil Dev${reset}

${dim}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${reset}
"@
}
# Minimal profile: UTF‑8 + Oh My Posh (if installed) + Fastfetch with explicit config path
try {
    [Console]::InputEncoding  = [System.Text.Encoding]::UTF8
    [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
    $OutputEncoding = [System.Text.UTF8Encoding]::new($false)
    chcp 65001 > $null
} catch {}

Clear-host

# Force Fastfetch to use YOUR config every time (bypass path confusion)
if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
    fastfetch -c "C:/Users/aniru/.config/fastfetch/config.jsonc"
}
'@
$psProfilePath = Join-Path $psProfileDir "profile.ps1"
Set-Content -Path $psProfilePath -Value $profileContent -Encoding UTF8

Write-Host "`nSetup complete! Start a new PowerShell 7 session to see your profile and fastfetch layout." -ForegroundColor Green