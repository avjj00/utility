<#

. Logitusfunktio PS-skripteille
. Kopsattu --> https://adamtheautomator.com/powershell-log-function/ (22.09.2025)

#>

function WriteLog {

	[CmdletBinding()]
	param(
		[Parameter()]
		[ValidateNotNullOrEmpty()]
		[string]$message
	)
	
	[pscustomobject]@{
		Time = (Get-Date -f g)
		Message = $message
	} | Export-Csv -Path "$env:Temp\APPLICATION_NAME.csv" -Append -NoTypeInformation
	
}

<#

Write-Log -Message 'whatever'

#>