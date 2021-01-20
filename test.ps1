# https://adamtheautomator.com/powershell-tab-completion/#Simple_Introduction_to_ArgumentCompleters

$env:PSModulePath+="$(pwd);"
import-module pake -force -verbose
