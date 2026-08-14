param(
    [Parameter(Mandatory = $true)]
    [string]$InputPath,

    [string]$OutputPath
)

if (-not (Test-Path $InputPath)) {
    throw "Input SCAD file not found: $InputPath"
}

if (-not $OutputPath) {
    $OutputPath = [System.IO.Path]::ChangeExtension($InputPath, '.png')
}

$outputDir = Split-Path -Parent $OutputPath
if ($outputDir -and -not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
}

Write-Host "Rendering $InputPath -> $OutputPath"
& openscad -o $OutputPath $InputPath
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}
