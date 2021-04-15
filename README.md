# pake
GNU Make like simple build/automation tool implemented with Powershell

## How Does it Work?

- Simple, when you run `pake <TARGET>` on powerhell. pake will search for a `pakefile.ps1` in the current directory.
- Imports the powershell file and executes the function named `<TARGET>` defined in the `pakefile.ps1`

## Usage

`pake TARGET`

- install the module and restart your powershell terminal
- import the module `import-module pake` or add this line to profile.
- create a `pakefile.ps1` file in your working directory
- define some functions in your `pakefile.ps` e.g `build`
- has also simple autocomplete feature. try `pake <TAB>`

## Compatibility
Compatible only Powershell > 7.0 and later for now.

## Default Task
define a variable in your `pakefile.ps` by `$default="build"` and execute `pake`
without parameter.

## Installing

```powershell
Import-Module PowerShellGet
Register-PSRepository -Name "guneysu" -SourceLocation "https://www.myget.org/F/guneysu/api/v2"
Install-Module -Name "pake" -Repository "guneysu" -Scope CurrentUser
```
## Example `pakefile.ps1`

```powershell
## pakefile.ps1

$default="build";

function build () {
    dotnet build .\src\Pake\Pake.sln -c Release
    copy-item .\src\Pake\pake\bin\Release\net5.0\pake.dll pake\lib\
}

function publish () {
    Publish-Module -Path .\pake -Repository guneysu -NuGetApiKey $env:MYGET_SECRET
}

function upgrade {
    Import-Module PowerShellGet
    Register-PSRepository -Name "guneysu" -SourceLocation "https://www.myget.org/F/guneysu/api/v2"
    Install-Module -Name "pake" -Repository "guneysu" -Verbose
}

function test {
    Write-Output "TEST";
    $env:PSModulePath+="$(pwd);"
    import-module pake -force -verbose
    pake upgrade
}
```

## TODOs

- [x] default task
- [ ] multiple virtual targets like `all`
- [ ] passing parameters (no limitations but should test)

