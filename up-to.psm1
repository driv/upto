<#
  .Synopsis
  Quickly navigate up the directory hierarchy to a matching directory

  .Description
  Searches up the directory hierarchy for a matching directory and sets the path
  to the highest matching location

  .Parameter target
  The subpath to search for

  .Example
  # In `C:\Users\MyUser\Documents\foo\bar\baz` go to the `foo` directory
  Up-To foo

  .Example
  # From any directory on the `C:\` drive, quickly go to the top level directory
  Up-To c
#>
Function Up-To {
  Param (
    [Parameter(Mandatory=$true)]
    [string]$target
  )

  Set-Location -Path (
    [regex]::match((Get-Item -Path ".\").FullName, "(.*?" + $target + ".*?(\\|$))|(^.*$)").Value)
}
Set-Alias upto Up-To
Export-ModuleMember -Function Up-To -Alias upto