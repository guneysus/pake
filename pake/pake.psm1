function Invoke-Pake () {
    param(
        [string] $Target
    )
    
    . ".\pakefile.ps1"
    switch -CaseSensitive ($Target) {
        "" {
            $Target=$default
            break
        }
        "default" { 
            $Target=$default
            break
        }
        Default {
           break
        }
    }
    
    write-debug "Args: $($Args)" 
    write-debug "Unbound Arguments: $($MyInvocation.UnboundArguments)"            
    write-debug "Input: $($input)" 
    write-debug "Bound Parameters: $($MyInvocation.BoundParameters)"

    write-debug "Executing $($Target)"
    invoke-expression "$Target $($MyInvocation.UnboundArguments)"    
    write-debug "Executed $($Target)"
}

set-alias pake Invoke-Pake

$scriptblock = {
    param($commandName,$parameterName,$stringMatch)
    Get-PakeTargets | Where-Object { $_ -like "$stringMatch*" }
}


Register-ArgumentCompleter -CommandName Invoke-Pake -ParameterName Target -ScriptBlock $scriptblock