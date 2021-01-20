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

#function Save-Prompt {
#    $global:prompt_old = get-content function:\prompt
#}

#function Restore-Prompt {
#    set-content function:\prompt $global:prompt_old
#}

function Pake-Prompt {
    $scriptBlock = { Get-PakeTargets }
    
    Register-ArgumentCompleter -CommandName Invoke-Pake -ParameterName Target -ScriptBlock $scriptBlock
}

& {
#    $currentPromptBlock=(Get-Command Prompt).ScriptBlock
    
    $scriptBlock = { Get-PakeTargets }
    
    Register-ArgumentCompleter -CommandName Invoke-Pake -ParameterName Target -ScriptBlock $scriptBlock
       
}
