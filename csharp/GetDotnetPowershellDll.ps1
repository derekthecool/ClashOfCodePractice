# $Container = "mcr.microsoft.com/dotnet/sdk:8.0.412"

$Container = "mcr.microsoft.com/dotnet/sdk"

$Script = @'
$path = (Get-ChildItem -Recurse -Path "/usr/share/powershell/.store/powershell.linux.x64" -Filter "System.Management.Automation.dll" | Select-Object -First 1).FullName
$bytes = [System.IO.File]::ReadAllBytes($path)

$compressedStream = New-Object System.IO.MemoryStream
$gzip = New-Object System.IO.Compression.DeflateStream($compressedStream, [IO.Compression.CompressionMode]::Compress, $true)
$gzip.Write($bytes, 0, $bytes.Length)
$gzip.Close()

# Reset position to 0 before reading
$compressedStream.Position = 0
$base64 = [System.Convert]::ToBase64String($compressedStream.ToArray())

$output_file = "/d/OutputBase64PowershellDll.txt"
# Optional: line wrap Base64 to fit size limiters
[System.IO.File]::WriteAllText($output_file, $base64)


# $path = (Get-ChildItem -Recurse -Path "/usr/share/powershell/.store/powershell.linux.x64" -Filter "System.Management.Automation.dll").FullName
# $bytes = [System.IO.File]::ReadAllBytes($path)
# $ms = New-Object System.IO.MemoryStream
# $gz = New-Object System.IO.Compression.GZipStream($ms, [IO.Compression.CompressionMode]::Compress)
# $gz.Write($bytes, 0, $bytes.Length)
# $gz.Close()
# 
# $output_file = "/d/OutputBase64PowershellDll.txt"
# [System.Convert]::ToBase64String($ms.ToArray()) | Set-Content "$output_file"

gci $output_file
'@

Set-Content -Path "$PSScriptRoot/Script.ps1" -Value $Script

podman run -it --rm -v "${PWD}:/d" $Container pwsh -File "/d/Script.ps1"
