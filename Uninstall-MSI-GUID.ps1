$uninstallPathList = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall','HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall'

$uninstallString = Get-ChildItem -Path $uninstallPathList | ForEach-Object { Get-ItemProperty $_.PSPath } | Where-Object { $_.DisplayName -like "*APPLICATION_NAME_HERE*" } | Select-Object -ExpandProperty UninstallString

$uninstallGuid = $uninstallString | Select-String -Pattern '{[-0-9A-F]+?}' -AllMatches | Select-Object -ExpandProperty Matches | Select-Object -ExpandProperty Value
