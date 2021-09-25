
$Char = Get-Content "fari.Maerchenkrieger.Char.de-DE.Walter_HansMeinIgel.json" | ConvertFrom-Json

$Page = 1

$Values =''

$CharPage =$Char.pages.Get($Page);

$CharPage.sections.left.Get(0).blocks | Where-Object Value -ne "" | ForEach-Object { 
  if (![string]::IsNullOrEmpty($Values)) {
    $Values = "$($Values) ; "; 
  }
  $Values = "$($Values)$($_.value)";
}
$Values = "$($CharPage.label): $($Values)"
$Values