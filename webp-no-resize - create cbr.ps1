$fileNames = Get-ChildItem -Path $scriptPath -Recurse -Include *.cbz, *.cbr

foreach ($f in $fileNames) {
    echo "$($f.Directory)\$($f.Basename)$($f.Extension)"
    #switch ($f.Extension)
    #{
    #    '.cbz' {
    #        7za x "$($f.Directory)\$($f.Basename).cbz"
    #    }
    #    '.cbr' {
    #        unrar x "$($f.Directory)\$($f.Basename).cbr"
    #    }
    #}
    #cwebp "$($f)" -o "$($f.Directory)\$($f.Basename).webp"
    #del /S *.jpg
    #del /S *.png

    #rar a D:\Biblioteca\Manga\"Black Clover"\"Black Clover - Tomo 26".cbr  D:\Biblioteca\Manga\"Black Clover"\"Tomo 26"

    #echo $f
    # New-Item "$($f).txt"
    # cwebp "$($f)" -o "$($f.Directory)\$($f.Basename).webp"
    #rar a D:\Biblioteca\Manga\"Black Clover"\"Black Clover - Tomo 26".cbr  D:\Biblioteca\Manga\"Black Clover"\"Tomo 26"
    #7za x *.cbz
    #unrar x *.cbz
}
echo "--------------------------------------------------"
echo "--------------------------------------------------"
$imageNames = Get-ChildItem -Path $scriptPath -Recurse -Include *.png, *.jpg
foreach ($f in $imageNames) {
    echo $f
    echo "$($f)"
    echo "$($f.Directory)\$($f.Basename).webp"
    #cwebp "$($f)" -o "$($f.Directory)\$($f.Basename).webp"
    
}
echo "--------------------------------------------------"
echo "--------------------------------------------------"

Remove-Item * -Recurse -Include *.png, *.jpg
echo "Imagenes .jpg y .png borradas"

echo "--------------------------------------------------"
echo "--------------------------------------------------"

$folderNames = Get-ChildItem -Path $scriptPath -Directory
foreach ($f in $folderNames) {
    echo $f.FullName
    #echo "$($f.Directory)\$($f.Basename).cbr"
    #echo "$($f.Directory)\$($f.Basename)"
    #rar a "$($f.Directory)\$($f.Basename).cbr" "$($f.Directory)\$($f.Basename)"
    rar a "$($f.FullName).cbr" "$($f.FullName)"
}
echo "--------------------------------------------------"
echo "--------------------------------------------------"