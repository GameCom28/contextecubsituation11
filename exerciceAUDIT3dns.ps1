#========================================================================
#NAME: 
#AUTHOR: GameCom28
#DATE: 11/04/2023
#
#VERSION 1.0
#COMMENTS: V�rifie l'�tat des plage DHCP
#
#Requires -Version 2.0
#========================================================================

# Obtenir la date actuelle
$date = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"

# D�finir le nom du fichier texte � cr�er
$outputFile = "$env:HOMEDRIVE$env:HOMEPATH\Documents\$date-auditDNS.txt"
$zoneDNS = "local.anvers.cub.sioplc.fr"

# R�cup�rer tous les enregistrements DNS du service DNS
$dnsRecords = Get-DnsServerResourceRecord -ZoneName $zoneDNS -RRType A

# �crire les enregistrements DNS dans un fichier texte
$dnsRecords | Out-File $outputFile
