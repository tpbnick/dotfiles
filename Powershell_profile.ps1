Invoke-Expression (&starship init powershell)
# Enable predictive IntelliSense
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Enable history search with arrow keys
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Enable menu completion on Tab
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
