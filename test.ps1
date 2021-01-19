# https://adamtheautomator.com/powershell-tab-completion/#Simple_Introduction_to_ArgumentCompleters

$env:PSModulePath+="D:\repos\pake;"
import-module pake -force -verbose

$scriptBlock = { Get-PakeTargets }
# $scriptBlock = { 'foo', 'bar' }

# Register-ArgumentCompleter -CommandName show-pake -ParameterName Target -ScriptBlock $scriptBlock

# Register-ArgumentCompleter -CommandName show-pake -ParameterName Target -ScriptBlock { Get-PakeTargets } # $scriptBlock

# Register-ArgumentCompleter -CommandName pake -ParameterName Target -ScriptBlock $scriptBlock
