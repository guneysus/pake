# https://adamtheautomator.com/powershell-tab-completion/#Simple_Introduction_to_ArgumentCompleters

$env:PSModulePath+="D:\repos\pake;"
import-module pake

$scriptBlock = { Get-PakeTargets }


Register-ArgumentCompleter -CommandName show-pake -ParameterName Target -ScriptBlock { Get-PakeTargets } # $scriptBlock

# Register-ArgumentCompleter -CommandName pake -ParameterName Target -ScriptBlock $scriptBlock
