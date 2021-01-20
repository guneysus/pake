# pake
Just another Make but with Powershell



## INSTALLING

```powershell
Import-Module PowerShellGet
Register-PSRepository -Name "guneysu" -SourceLocation "https://www.myget.org/F/guneysu/api/v2"
Install-Module -Name "pake" -Repository "guneysu" 
```

- create a file called `pake.ps1`
- define functions
- a global exe will parse its contents and autocompletes functions (and may autocomplete parameters)


## TODOs

- [ ] default task
- [ ] multiple virtual targets like `all`
- [ ] passing parameters (no limitations but should test)
- [ ] functions without `function` keyword

