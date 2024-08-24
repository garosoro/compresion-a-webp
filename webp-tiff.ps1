$fileNames = Get-ChildItem -Path $scriptPath -Recurse -Include *.tif

foreach ($f in $fileNames){
    echo "$($f.Directory)\$($f.Basename)"
    #New-Item "$($f).txt"
    img2webp "$($f)" -o "$($f.Directory)\$($f.Basename).webp"
}

$fileNames2 = Get-ChildItem -Path $scriptPath -Recurse -Include *.webp

foreach ($f in $fileNames){
    echo "$($f.Directory)\$($f.Basename)"
    # New-Item "$($f).txt"
   cwebp -resize 1920 0 "$($f)" -o "$($f.Directory)\$($f.Basename).webp"
}