# Build the native dependencies of the pythonocc-core Windows wheels and
# install them to $env:PYOCC_DEPS_PREFIX:
#  * SWIG (swigwin binary distribution), in <prefix>/swig
#  * OCCT, built with MSVC. Its 3rd parties (freetype, FreeImage, RapidJSON)
#    are built by vcpkg, through the OCCT vcpkg manifest, and their DLLs
#    copied to <prefix>/bin.
#
# Nothing is done if the prefix is already complete (restored from cache).
$ErrorActionPreference = "Stop"
$PSNativeCommandUseErrorActionPreference = $true

# below normal priority for the whole build (inherited by the child
# processes), so that the CI runner agent still gets CPU time for its
# heartbeats: a starved agent is reported as lost
(Get-Process -Id $PID).PriorityClass = "BelowNormal"

$SwigVersion = "4.5.1"
$OcctTag = "V8_0_1"
$Triplet = "x64-windows-pyocc"
$DepsPrefix = $env:PYOCC_DEPS_PREFIX
if (-not $DepsPrefix) { throw "PYOCC_DEPS_PREFIX must be set" }
$Here = Split-Path -Parent $PSScriptRoot

$CompleteMark = Join-Path $DepsPrefix ".pyocc-deps-complete"
if (Test-Path $CompleteMark) {
    Write-Host "Dependencies already installed in $DepsPrefix"
    exit 0
}

# short work directory: the vcpkg and OCCT build trees hit MAX_PATH otherwise
$Work = if ($env:PYOCC_DEPS_WORK) { $env:PYOCC_DEPS_WORK } else { "C:\pyocc-work" }
New-Item -ItemType Directory -Force -Path $Work, $DepsPrefix | Out-Null
Set-Location $Work

# SWIG
curl.exe -fsSL -o swigwin.zip "https://downloads.sourceforge.net/project/swig/swigwin/swigwin-$SwigVersion/swigwin-$SwigVersion.zip"
Expand-Archive swigwin.zip -DestinationPath .
Move-Item "swigwin-$SwigVersion" (Join-Path $DepsPrefix "swig")

# vcpkg: a full clone, the OCCT manifest pins a baseline commit
git clone https://github.com/microsoft/vcpkg.git vcpkg
.\vcpkg\bootstrap-vcpkg.bat -disableMetrics

# OCCT
New-Item -ItemType Directory -Force -Path occt-src | Out-Null
curl.exe -fsSL -o occt.tar.gz "https://github.com/Open-Cascade-SAS/OCCT/archive/refs/tags/$OcctTag.tar.gz"
tar xzf occt.tar.gz --strip-components=1 -C occt-src
cmake -S occt-src -B ob -G "Visual Studio 17 2022" -A x64 `
  -DBUILD_USE_VCPKG=ON `
  "-DVCPKG_ROOT=$Work/vcpkg" `
  "-DVCPKG_TARGET_TRIPLET=$Triplet" `
  "-DVCPKG_OVERLAY_TRIPLETS=$Here/triplets" `
  "-DINSTALL_DIR=$DepsPrefix" `
  -DINSTALL_DIR_LAYOUT=Unix `
  -DBUILD_LIBRARY_TYPE=Shared `
  -DBUILD_RELEASE_DISABLE_EXCEPTIONS=OFF `
  -DBUILD_MODULE_Draw=OFF `
  -DBUILD_DOC_Overview=OFF `
  -DUSE_TCL=OFF `
  -DUSE_TK=OFF `
  -DUSE_FREETYPE=ON `
  -DUSE_RAPIDJSON=ON `
  -DUSE_FREEIMAGE=ON `
  -DUSE_DRACO=OFF `
  -DUSE_TBB=OFF `
  -DUSE_VTK=OFF `
  -DUSE_OPENVR=OFF `
  -DUSE_FFMPEG=OFF
# no --parallel: OCCT already compiles each project with /MP (one cl.exe per
# core), MSBuild /m on top would run several projects at once and exhaust the
# agent memory. _CL_ is appended to the cl.exe command line, it overrides the
# OCCT /MP with one compiler per core, but at most one per 3 GB of memory
$MemJobs = [math]::Floor((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 3GB)
$Jobs = [math]::Max(1, [math]::Min([Environment]::ProcessorCount, $MemJobs))
Write-Host "Building with $Jobs compilers"
$env:_CL_ = "/MP$Jobs"
cmake --build ob --config Release
cmake --install ob --config Release

# the 3rd party DLLs, for delvewheel. RapidJSON is header only, its headers
# are included by the OCCT glTF headers: put them next to the OCCT headers
# so that the pythonocc build finds them
$VcpkgInstalled = "ob/vcpkg_installed/$Triplet"
Copy-Item "$VcpkgInstalled/bin/*.dll" (Join-Path $DepsPrefix "bin")
Copy-Item -Recurse "$VcpkgInstalled/include/rapidjson" (Join-Path $DepsPrefix "include/opencascade")

# the wheels only need the libraries, headers and cmake config
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue `
  (Join-Path $DepsPrefix "share/doc"), (Join-Path $DepsPrefix "share/opencascade/samples")

Set-Location \
Remove-Item -Recurse -Force $Work
Get-Date | Out-File $CompleteMark
