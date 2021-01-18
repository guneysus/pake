function Run-Target () {
    [CmdletBinding()]
    param(
        [Parameter()]
        [string]$Name
    )
    
    . .\pakefile; $Name
}