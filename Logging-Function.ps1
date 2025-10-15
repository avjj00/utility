<#

. Logitusfunktio PS-skripteille

#>
$logFile = "C:\Windows\Temp\logifileennimi.log"

function WriteLog {
	
	Param([string]$logString)
	
	$stamp = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")
	$logMessage = "$stamp $logString"
	
	Add-Content $logFile -Value $logMessage -Encoding UTF8

}

<#

WriteLog 'Whatever'


#>
