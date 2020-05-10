$gsb = Get-ChildItem -Path alias:gsb -ErrorAction SilentlyContinue
if (($gsb.Count -eq 0) -or ($gsb.Source -eq 'psScreenBrightness')) {
  Set-Alias -Name gsb -Value Get-ScreenBrightness
}

$ssb = Get-ChildItem -Path alias:ssb -ErrorAction SilentlyContinue
if (($ssb.Count -eq 0) -or ($ssb.Source -eq 'psScreenBrightness')) {
  Set-Alias -Name ssb -Value Set-ScreenBrightness
}
