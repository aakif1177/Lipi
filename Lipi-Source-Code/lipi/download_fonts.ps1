$base = "C:\Users\kanch\Downloads\translater flutter app\lipi\assets\fonts"
$fonts = @(
    @("NotoSansDevanagari", "https://github.com/google/fonts/raw/main/ofl/notosansdevanagari/NotoSansDevanagari%5Bwdth%2Cwght%5D.ttf"),
    @("NotoSansBengali", "https://github.com/google/fonts/raw/main/ofl/notosansbengali/NotoSansBengali%5Bwdth%2Cwght%5D.ttf"),
    @("NotoSansTamil", "https://github.com/google/fonts/raw/main/ofl/notosanstamil/NotoSansTamil%5Bwdth%2Cwght%5D.ttf"),
    @("NotoSansTelugu", "https://github.com/google/fonts/raw/main/ofl/notosanstelugu/NotoSansTelugu%5Bwdth%2Cwght%5D.ttf"),
    @("NotoSansKannada", "https://github.com/google/fonts/raw/main/ofl/notosanskannada/NotoSansKannada%5Bwdth%2Cwght%5D.ttf"),
    @("NotoSansMalayalam", "https://github.com/google/fonts/raw/main/ofl/notosansmalayalam/NotoSansMalayalam%5Bwdth%2Cwght%5D.ttf"),
    @("NotoSansGujarati", "https://github.com/google/fonts/raw/main/ofl/notosansgujarati/NotoSansGujarati%5Bwdth%2Cwght%5D.ttf"),
    @("NotoSansGurmukhi", "https://github.com/google/fonts/raw/main/ofl/notosansgurmukhi/NotoSansGurmukhi%5Bwdth%2Cwght%5D.ttf"),
    @("NotoSansOriya", "https://github.com/google/fonts/raw/main/ofl/notosansoriya/NotoSansOriya%5Bwdth%2Cwght%5D.ttf"),
    @("NotoNastaliqUrdu", "https://github.com/google/fonts/raw/main/ofl/notonastaliqurdu/NotoNastaliqUrdu%5Bwght%5D.ttf"),
    @("NotoSansMeeteiMayek", "https://github.com/google/fonts/raw/main/ofl/notosansmeeteimayek/NotoSansMeeteiMayek%5Bwght%5D.ttf")
)
foreach ($f in $fonts) {
    $name = $f[0]
    $url = $f[1]
    $outPath = Join-Path $base "$name-Regular.ttf"
    Write-Host "Downloading $name..."
    try {
        Invoke-WebRequest -Uri $url -OutFile $outPath -ErrorAction Stop
        $size = [math]::Round((Get-Item $outPath).Length / 1KB)
        Write-Host "  OK ($size KB)"
    } catch {
        Write-Host "  FAILED: $_"
    }
}
Write-Host "All fonts downloaded!"
