<#
    .SYNOPSIS
    Gets the screens current brightness level as an integer between 0 and 100 inclusive.

    .DESCRIPTION
    Gets the screens current brightness level as an integer between 0 and 100 inclusive.
    
    .EXAMPLE
    Get-ScreenBrightness

    Returns an integer representing the screens current brightness level.
#>
function Get-ScreenBrightness {
  [CmdletBinding()]
  param()

  Get-WmiObject -Namespace root/WMI -Class WmiMonitorBrightness | Select-Object -ExpandProperty CurrentBrightness

}
