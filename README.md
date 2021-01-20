# pake
Just another Make but with Powershell

## Usage

- install the module and restart your powershell terminal
- create a `pakefile.ps1` file in your working directory
- define some functions in your `pakefile.ps` e.g `build`
- execute them by `pake build`
- has also simple autocomplete feature. try `pake <TAB>`

## Default Task
define a variable in your `pakefile.ps` by `$default="build"` and execute `pake`
without parameter.

## Installing

```powershell
Import-Module PowerShellGet
Register-PSRepository -Name "guneysu" -SourceLocation "https://www.myget.org/F/guneysu/api/v2"
Install-Module -Name "pake" -Repository "guneysu" 
```

## TODOs

- [x] default task
- [ ] multiple virtual targets like `all`
- [ ] passing parameters (no limitations but should test)

