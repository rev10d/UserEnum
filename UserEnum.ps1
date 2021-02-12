# Users file input, single line, etc
$users = get-content '.\users.txt'

# Write an output to the working directory based on current time to the minute
$LogTime = Get-Date -Format 'MM-dd-yyyy_hh-mm'
$OutPath = ".\"

# Name file output, add timestamp
$OutLog = $OutPath + "User-Deets-" + $LogTime + ".txt"
New-Item -path $OutLog -type File

# Iterate through user list with a 15 second day running "net user $user /domain"
foreach ($user in $users) {
"Testing user: $user" | out-file $OutLog -Append
net user $user /domain >> $OutLog
Start-Sleep -Second 15
}
