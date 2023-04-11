# Obtenir la date de lancement du script
$date = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"

# Obtenir l'état des services DHCP, DNS et AD
$dhcpService = Get-Service -Name dhcp | Select-Object Status
$dnsService = Get-Service -Name dns | Select-Object Status
$adService = Get-Service -Name adws | Select-Object Status



# Créer le contenu du fichier texte
$content = "Exécuter le : $date`n"
$content += "État du service DHCP : $($dhcpService.Status)`n"
$content += "État du service DNS : $($dnsService.Status)`n"
$content += "État du service AD : $($adService.Status)"

# Créer le fichier texte
$filePath = "$env:HOMEDRIVE$env:HOMEPATH\Documents\$date.txt"
Set-Content -Path $filePath -Value $content

Write-Host "Le fichier a été créé : $filePath"
