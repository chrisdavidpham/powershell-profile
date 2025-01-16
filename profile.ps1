Write-Output "Loading $profile`n"

$daysUntilRetimenet = (Get-Date "2055-07-06") - (Get-Date) | Select-Object -ExpandProperty Days
Write-Output "Days until retirement: $daysUntilRetimenet. One less than yesterday!`n"

$date = (Get-Date).GetDateTimeFormats()[5]
Start-Transcript -OutputDirectory "c:\logs\powershell\$date" | Out-Null
