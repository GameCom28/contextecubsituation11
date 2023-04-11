#========================================================================
#NAME: 
#AUTHOR: GameCom28
#DATE: 11/04/2023
#
#VERSION 1.0
#COMMENTS: Vérifie l'état des plage DHCP
#
#Requires -Version 2.0
#========================================================================

# Obtenir la date actuelle
$date = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"

# Définir le nom du fichier texte à créer
$outputFile = "$env:HOMEDRIVE$env:HOMEPATH\Documents\$date-auditAD.txt"

# Récupérer tous les utilisateurs Active Directory du domaine
$users = Get-ADUser -Filter *

# Écrire les informations des utilisateurs dans un fichier texte
$users | Select-Object Name, SamAccountName, Description, EmailAddress, UserPrincipalName, Enabled | Format-Table -AutoSize | Out-File $outputFile
