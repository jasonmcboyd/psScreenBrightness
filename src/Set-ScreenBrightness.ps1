<#
    .SYNOPSIS
    Sets the screens brightness level.

    .DESCRIPTION
    Sets the screens brightness level.

    .PARAMETER Value
    The value to set the brightness level to. Legal values are between 0 and 100 inclusive. If the value is outside the range 0 or 100 the brightness level will be set to 0 or 100.

    .PARAMETER Relative
    This switch causes the value to be added to the current screen brightness level. If the resulting new brightness level is outside 0 or 100 the brightness level will be set to 0 or 100.

    .EXAMPLE
    Set-ScreenBrightness 80

    Sets the screens brightness level to 80.

    .EXAMPLE
    Set-ScreenBrightness -10 -Relative

    Reduces the screens brightness level by 10.
#>
function Set-ScreenBrightness {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $true)]
    [int]
    $Value,

    [Switch]
    $Relative
  )

  if ($Relative) {
    $current = Get-WmiObject -Namespace root/WMI -Class WmiMonitorBrightness | Select-Object -ExpandProperty CurrentBrightness
    $Value += $current
  }

  if ($Value -gt 100) { $Value = 100 }
  if ($Value -lt 0) { $Value = 0 }

  (Get-WmiObject -Namespace root/WMI -Class WmiMonitorBrightnessMethods).WmiSetBrightness(1, $Value)

}
