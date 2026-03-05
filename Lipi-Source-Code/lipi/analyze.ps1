Set-Location 'C:\Users\kanch\Downloads\translater flutter app\lipi'
$output = & 'C:\Users\kanch\flutter\bin\flutter.bat' analyze --no-fatal-infos --no-fatal-warnings 2>&1
$errors = $output | Select-String -Pattern '^\s*error'
if ($errors) {
    Write-Host "ERRORS FOUND:"
    $errors | ForEach-Object { Write-Host $_.Line }
} else {
    Write-Host "NO ERRORS - All clean!"
}
Write-Host ""
Write-Host "SUMMARY:"
$output | Select-String -Pattern 'issues|No issues|error.*found' | ForEach-Object { Write-Host $_.Line }
