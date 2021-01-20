$default="build";

function build () {
    dotnet build .\src\Pake\Pake.sln -c Release # TODO parameter
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