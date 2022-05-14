param(

[switch] $IncludeSubdirectories
)
Set-StrictMode -Version 3

if($includeSubdirectories)
{
Get-ChildItem -Directory |
Select-Object Name,
@{ Name="Size";
Expression={ ($_ | Get-ChildItem -Recurse |
Measure-Object -Sum Length).Sum + 0 } }
}

else
{
Get-ChildItem -Recurse -Directory
    Select-Object FullName,
@{ Name="Size";
Expression={ ($_ | Get-ChildItem |
Measure-Object -Sum Length).Sum + 0 } }
}