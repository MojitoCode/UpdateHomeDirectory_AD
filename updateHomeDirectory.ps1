#ask user for drive letter
$driveLetter = read-host "Enter your drive letter"

#ask user for directory path
$homePath = read-host "enter full UNC: "

#ask user for their OU
$userOU = read-host "Enter your OU: "

#ask user for DC
$userDC = read-host "Enter your DC: "

#ask user for their top-level domain (TLD - ex. "com", "local")
$userTLD = read-host "Enter your TLD: "

$selectedOU = "OU=$userOU,DC=$userDC,DC=$userTLD"

#get all user accounts from the specified ou
$userList = get-aduser -filter * -searchbase $selectedOU 

foreach $user in $userList {
  $homeDir = $homepath + $user.samAccountName
  set-aduser $user.samAccountName -HomeDirectory $homeDir -HomeDrive $driveLetter + ":" 
}
