$testResult = Invoke-RestMethod -Uri "https://api.github.com/repos/PowerShell/PowerShell/issues?per_page=1&page=0&state=closed" -Method Get
$issues = Invoke-RestMethod -Uri "https://api.github.com/repos/PowerShell/PowerShell/issues?per_page=100&page=0&state=closed" -Method Get

# foreach ($testResult in $testResults) {
#     $users = $testResult.user
#     foreach ($user in $users) {
#         $line = $user.id
#         Write-Host $line
#     }
# }
#$testResults | Get-Member

#New-TimeSpan -Start $testResult.created_at -End $testResult.closed_at

#$issues | Get-Member

#(New-TimeSpan -Start $testResult.created_at -End $testResult.closed_at).TotalDays

#$save = ($issues).count

#echo "count $save"

write-host "Average TTR for each issue: " -ForegroundColor Red ($issues | 
    Select-Object @{n = 'TimeToResolve'; e = { (New-TimeSpan -Start $_.created_at -End $_.closed_at).TotalDays } } | 
    Measure-Object -Property TimeToResolve -Average).Average

    