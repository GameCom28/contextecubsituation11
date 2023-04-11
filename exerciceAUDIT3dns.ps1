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
$outputFile = "$env:HOMEDRIVE$env:HOMEPATH\Documents\$date-auditDNS.txt"
$zoneDNS = "local.anvers.cub.sioplc.fr"

# Récupérer tous les enregistrements DNS du service DNS
$dnsRecords = Get-DnsServerResourceRecord -ZoneName $zoneDNS -RRType A

# Écrire les enregistrements DNS dans un fichier texte
$dnsRecords | Out-File $outputFile
