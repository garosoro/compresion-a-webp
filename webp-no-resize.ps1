$fileNames = Get-ChildItem -Path $scriptPath -Recurse -Include *.png,*.jpeg,*.jpg

foreach ($f in $fileNames){
    echo "$($f.Directory)\$($f.Basename)"
    # New-Item "$($f).txt"
    cwebp "$($f)" -o "$($f.Directory)\$($f.Basename).webp"
}

