function Invoke-Pake () {
    [CmdletBinding()]
    param(
        [Parameter()]
        $Target
    )
    
    . ".\pakefile.ps1"
    Write-Output "Executing $($Target)"
    & $Target
    Write-Output "Executed $($Target)"
}

set-alias pake Invoke-Pake

& {
    $scriptBlock = { Get-PakeTargets }
    Register-ArgumentCompleter -CommandName Invoke-Pake -ParameterName Target -ScriptBlock $scriptBlock

}
