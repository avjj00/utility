$uninstallPathList = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall','HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall'

$uninstallString = Get-ChildItem -Path $uninstallPathList | ForEach-Object { Get-ItemProperty $_.PSPath } | Where-Object { $_.DisplayName -like "*APPLICATION_NAME_HERE*" } | Select-Object -ExpandProperty UninstallString
$uninstallGuid = $uninstallString | Select-String -Pattern '{[-0-9A-F]+?}' -AllMatches | Select-Object -ExpandProperty Matches | Select-Object -ExpandProperty Value

try {
	
	Start-Process 'msiexec.exe' -ArgumentList "/x $uninstallGuid /norestart /quiet" -WindowStyle Hidden
	
} catch {
					
	Write-Host "Uninstallation failed."
	Write-Host "Last error message: $Error[0].Exception.Message"
					
	exit 1
					
}
