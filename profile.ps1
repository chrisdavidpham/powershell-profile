Write-Output "Loading $profile`n"

$totalDaysOfWork = [math]::Floor(((Get-Date "2055-07-06") - (Get-Date "2011-07-06") | Select-Object -ExpandProperty Days) / 365 * 230)
$daysUntilRetimenet = (Get-Date "2055-07-06") - (Get-Date) | Select-Object -ExpandProperty Days
$workDaysUntilRetirement = [math]::Floor($daysUntilRetimenet / 365 * 230)
$daysWorked = $totalDaysOfWork - $workDaysUntilRetirement

$motivationalQuotes = "
Days of work remaining: $workDaysUntilRetirement 
Days worked: $daysWorked / $totalDaysOfWork
Better is loving to win than hating to lose.
Failure invites two choices: lose or learn.
Recompense to no man evil for evil. Provide things honest in the sight of all men. Romans 12:18
Our greatest ability as humans is not to change the world; but to change ourselves. Gandhi
If you want to change the world, start with yourself. Gandhi
Live as if you were to die tomorrow. Learn as if you were to live forever. Gandhi
You never know where your actions will lead to. But if you don't do anything they will lead you nowhere. Gandhi
Carefully watch your thoughts, for they become your words. Manage and watch your words, for they will become your actions. Consider and judge your actions, for they have become your habits. Acknowledge and watch your habits, for they shall become your values. Understand and embrace your values, for they become your destiny. Gandhi
When I despair, I remember that all through history the way of truth and love has always won. There have been tyrants and murderers and for a time they seem invincible, but in the end, they always fall... think of it, always. Gandhi
The best way to find yourself is to lose yourself in the service of others. Gandhi
It is for us to make the effort. The result is always in God's hands. Gandhi
The simplest acts of kindness are by far more powerful then a thousand heads bowing in prayer. Gandhi
If you light a lamp for somebody, it will also brighten your path. Buddha
Change is never painful, only the resistance to change is painful. Buddha
You will not be punished for your anger, you will be punished by your anger. Buddha
Mind is everything. What we think, we become. Buddha
One moment can change a day, One day can change a life and One life can change the world. Buddha
The way to happiness is: keep your heart free from hate, your mind from worry. Live simply, give much. Fill your life with love. Do as you would be done by. Buddha
What you have become is the result of what you have thought. Buddha
Pain is certain, suffering is optional. Buddha
Every experience, no matter how bad it seems, holds within a blessing of some kind. The goal is to find it. Buddha
The mind that perceives the limitation is the limitation. Buddha
The greatest action is not conforming with the worlds ways. Buddha (perhaps Individuality > Tradition)
".Split("`n", [System.StringSplitOptions]::RemoveEmptyEntries)

$quoteIndex = Get-Random -Minimum 0 -Maximum $motivationalQuotes.Length

Write-Output $motivationalQuotes[$quoteIndex] `n

if (-not (Get-Location | Select-Object -ExpandProperty Path | Select-String "\dev\" -SimpleMatch -Quiet)) {
  Set-Location "C:\dev"
}

$date = (Get-Date).GetDateTimeFormats()[5]
Start-Transcript -OutputDirectory "c:\logs\powershell\$date" | Out-Null
