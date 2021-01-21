function Invoke-Pake () {
    [CmdletBinding()]
    param(
        [Parameter()]
        $Target
    )
    
    . ".\pakefile.ps1"
    Write-Output "Executing $($Target)"
    switch -CaseSensitive ($Target) {
        "" {
            & $default
            break
        }
        "default" { 
            Write-Output "DEFAULT!"
            break
        }
        Default {
            & $Target
            break
        }
    }
    
    Write-Output "Executed $($Target)"
}

set-alias pake Invoke-Pake

$scriptblock = {
    param($commandName,$parameterName,$stringMatch)
    Get-PakeTargets | Where-Object { $_ -like "$stringMatch*" }
}


Register-ArgumentCompleter -CommandName Invoke-Pake -ParameterName Target -ScriptBlock $scriptblock