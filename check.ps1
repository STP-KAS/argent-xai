# Recheck pinned GitHub tips against live refs. Does not clone Argent.
$ErrorActionPreference = "Stop"
$pins = Get-Content -Raw -Path (Join-Path $PSScriptRoot "pins.json") | ConvertFrom-Json
$fail = 0

Write-Host "argent-xai pin recheck  freeze=$($pins.freeze)"
foreach ($name in $pins.pins.PSObject.Properties.Name) {
  $p = $pins.pins.$name
  $url = if ($p.kind -eq "release-tag") {
    "https://api.github.com/repos/$($p.repo)/git/ref/tags/$($p.ref)"
  } else {
    "https://api.github.com/repos/$($p.repo)/commits/$($p.ref)"
  }
  $live = Invoke-RestMethod -Uri $url -Headers @{ "User-Agent" = "STP-KAS-argent-xai" }
  $sha = if ($p.kind -eq "release-tag") { $live.object.sha } else { $live.sha }
  $ok = $sha -eq $p.sha
  if (-not $ok) { $fail++ }
  $mark = if ($ok) { "OK  " } else { "DRIFT" }
  Write-Host ("{0}  {1,-18} {2}  pin={3}  live={4}" -f $mark, $name, $p.ref, $p.sha.Substring(0, 12), $sha.Substring(0, 12))
}

if ($fail -gt 0) {
  Write-Host "Pins drifted. Update pins.json after reading the new commits. Do not quote the freeze as current."
  exit 1
}
Write-Host "Pins match the freeze. Argent still has no tag unless you add one here after checking GitHub Releases."
exit 0
