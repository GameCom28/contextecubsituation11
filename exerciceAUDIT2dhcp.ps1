﻿#========================================================================
#NAME: 
#AUTHOR: GameCom28
#DATE: 11/04/2023
#
#VERSION 1.0
#COMMENTS: Vérifie l'état des plage DHCP
#
#Requires -Version 2.0
#========================================================================

# Récupération de la date de l'audit
$dateAudit = Get-Date

# Création du fichier de sortie
$auditFile = "$env:HOMEDRIVE$env:HOMEPATH\Documents\contextecubsituation11auditDHCP.txt"
New-Item -ItemType File -Path $auditFile -Force | Out-Null

# Récupération des plages DHCP et vérification de leur activité
Get-DhcpServerv4Scope | ForEach-Object {
    $scopeName = $_.Name
    $scopeState = $_.State
    if ($scopeState -eq "Active") {
        $isActive = "Activée"
    } else {
        $isActive = "Désactivée"
    }
    # Ajout de l'information de la plage au fichier et à l'affichage
    $scopeInfo = "$scopeName : $isActive"
    if ($isActive -eq "Désactivée") {
        Write-Host $scopeInfo -ForegroundColor Red
    } else {
        Write-Host $scopeInfo
    }
    Add-Content $auditFile $scopeInfo
}

# Ajout de la date de l'audit au début du fichier
(Get-Content $auditFile) | Set-Content $auditFile
(Get-Content $auditFile) | Foreach-Object {$_ -replace "^", "Date de l'audit : $dateAudit`r`n"} | Set-Content $auditFile