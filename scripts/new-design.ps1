param(
    [Parameter(Mandatory = $true)]
    [string]$Name,

    [string]$Folder = 'designs'
)

$slug = $Name.ToLowerInvariant()
$slug = $slug -replace '[^a-z0-9_-]', '-'
$target = Join-Path $Folder ("$slug.scad")

New-Item -ItemType Directory -Force -Path $Folder | Out-Null

$template = @"
/*
  $slug.scad

  Generated template for a new 3D-printed design.
  Update the dimensions and geometry to match the intended use.
*/

`$fn = 48;

// Parametric design variables, in millimeters.
width = 40;
length = 60;
height = 10;
wall = 2;

module body() {
    cube([width, length, height], center = true);
}

module main() {
    body();
}

main();
"@

Set-Content -Path $target -Value $template
Write-Host "Created $target"
