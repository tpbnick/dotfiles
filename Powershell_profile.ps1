# Nick's Powershell Profile
Invoke-Expression (&starship init powershell)
# Enable predictive IntelliSense
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Enable history search with arrow keys
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Enable menu completion on Tab
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# Quick directory navigation shortcuts
function .. { Set-Location .. }
function ... { Set-Location ../.. }
function .... { Set-Location ../../.. }

# Quick file/folder search in current directory
function ff { param($name) Get-ChildItem -Recurse -Name "*$name*" }

# Quick grep equivalent
function grep { param($pattern, $file) Select-String $pattern $file }

# Get public IP address
function myip { (Invoke-WebRequest -Uri "https://ipinfo.io/ip").Content.Trim() }

# Ctrl+L to clear screen
Set-PSReadLineKeyHandler -Key Ctrl+l -Function ClearScreen

# Reload PowerShell profile
function reload { . $PROFILE }

# Open current directory in Windows Explorer
function ex { explorer . }

# FNM (NodeJS)
fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression

# VSCode
function c { code . }

# Scoop Specific
# Make sure scoop-search is installed in scoop
function ss { param($app) scoop-search $app }
function si { param($app) scoop install $app }
function su { scoop update * }
function sc { scoop cleanup * }

# Sublime Text
function s {
    param($Path = ".")
    & "C:\Program Files\Sublime Text\sublime_text.exe" $Path
}

# Zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })
