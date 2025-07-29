# function Invoke-Cmake
# {
#     param(
#         [string]$SourceDir = (Resolve-Path ".").Path,
#         [string]$BuildDir = "$SourceDir/build",
#         [string]$Generator = "Ninja",           # You can also use "Unix Makefiles" or "Visual Studio 17 2022"
#         [string]$CXX = "",                      # e.g., "clang++" or full path
#         [switch]$Run
#     )
#
#     # Create build directory if needed
#     if (-not (Test-Path $BuildDir))
#     {
#         New-Item -ItemType Directory -Path $BuildDir | Out-Null
#     }
#
#     # Set up CMake command line
#     $cmakeArgs = @("-S", $SourceDir, "-B", $BuildDir, "-G", $Generator, "-DCMAKE_BUILD_TYPE=Debug")
#
#     if ($CXX -ne "")
#     {
#         $env:CXX = $CXX
#         Write-Host "Using compiler: $CXX"
#     }
#
#     # Step 1: Configure
#     & cmake @cmakeArgs
#
#     # Step 2: Build
#     cmake --build $BuildDir
#
#     # Step 3: Run if requested
#     if ($Run)
#     {
#         $exe = Get-ChildItem -Path $BuildDir -Filter "*.exe" | Where-Object { $_.Name -notmatch "cmake" } | Select-Object -First 1
#         if ($exe)
#         {
#             Write-Host "`nRunning: $($exe.FullName)`n"
#             & $exe.FullName
#         } else
#         {
#             Write-Warning "No executable found in build directory."
#         }
#     }
# }
#
#


function Invoke-Cmake
{
    param(
        [string]$Preset = "debug-ninja",
        [switch]$Run
    )

    # Configure and build using CMake presets
    cmake --preset $Preset
    cmake --build --preset "build-$Preset"

    if ($Run)
    {
        # Get preset info to find binary dir
        $presetInfo = Get-Content $PSScriptRoot/CMakePresets.json | ConvertFrom-Json
        # $binDir = $presetInfo.configurePresets | Where-Object { $_.name -eq $Preset } | Select-Object -ExpandProperty binaryDir
        $binDir = $presetInfo.configurePresets.binaryDir -replace '\$\{sourceDir\}',$PSScriptRoot

        if (-not $binDir)
        {
            Write-Warning "Could not determine binary directory from preset."
            return
        }

        # Get platform info
        $extension = if ($IsWindows)
        { ".exe" 
        } else
        { "" 
        }

        # Search for executable
        $binaries = Get-ChildItem -Path $binDir -File | Where-Object {
            $_.Extension -eq $extension -or (-not $isWindows -and ($_ | Get-Item).Mode -match "x")
        } | Where-Object {
            $_.Name -notmatch "cmake"
        }

        $exe = $binaries | Select-Object -First 1

        if ($exe)
        {
            Write-Host "`nRunning: $($exe.FullName)`n"
            & $exe.FullName
        } else
        {
            Write-Warning "No suitable binary found in $binDir"
        }
    }
}
