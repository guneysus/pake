function Invoke-Pake () {
    [CmdletBinding()]
    param(
        [Parameter()]
        $Target
    )
    
    . ".\pakefile.ps1"
    echo $default
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

Register-ArgumentCompleter -CommandName Invoke-Pake -ParameterName Target -ScriptBlock { Get-PakeTargets }