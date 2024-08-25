$fileNames = Get-ChildItem -Path $scriptPath -Recurse -Include *.cbz, *.cbr

foreach ($f in $fileNames) {
    Write-Output "$($f.Directory)\$($f.Basename)$($f.Extension)"
    switch ($f.Extension) {
        '.cbz' {
            7za x "$($f.Directory)\$($f.Basename).cbz"
        }
        '.cbr' {
            unrar x "$($f.Directory)\$($f.Basename).cbr"
        }
    }
    #cwebp "$($f)" -o "$($f.Directory)\$($f.Basename).webp"
    #del /S *.jpg
    #del /S *.png

    #rar a D:\Biblioteca\Manga\"Black Clover"\"Black Clover - Tomo 26".cbr  D:\Biblioteca\Manga\"Black Clover"\"Tomo 26"

    #Write-Output $f
    # New-Item "$($f).txt"
    # cwebp "$($f)" -o "$($f.Directory)\$($f.Basename).webp"
    #rar a D:\Biblioteca\Manga\"Black Clover"\"Black Clover - Tomo 26".cbr  D:\Biblioteca\Manga\"Black Clover"\"Tomo 26"
    #7za x *.cbz
    #unrar x *.cbz
}
Write-Output "--------------------------------------------------"
Write-Output "--------------------------------------------------"
$imageNames = Get-ChildItem -Path $scriptPath -Recurse -Include *.png, *.jpg
foreach ($f in $imageNames) {
    #Write-Output $f
    #Write-Output "$($f)"
    #Write-Output "$($f.Directory)\$($f.Basename).webp"
    cwebp "$($f)" -o "$($f.Directory)\$($f.Basename).webp"
    
}
Write-Output "--------------------------------------------------"
Write-Output "--------------------------------------------------"

Remove-Item * -Recurse -Include *.png, *.jpg
Write-Output "Imagenes .jpg y .png borradas"

Write-Output "--------------------------------------------------"
Write-Output "--------------------------------------------------"

$folderNames = Get-ChildItem -Path $scriptPath -Directory
foreach ($f in $folderNames) {
    #Write-Output $f.FullName
    #Write-Output "$($f.Directory)\$($f.Basename).cbr"
    #Write-Output "$($f.Directory)\$($f.Basename)"
    #rar a "$($f.Directory)\$($f.Basename).cbr" "$($f.Directory)\$($f.Basename)"
    rar a -m5 "$($f.FullName).cbr" "$($f)"
}
Write-Output "--------------------------------------------------"
Write-Output "--------------------------------------------------"