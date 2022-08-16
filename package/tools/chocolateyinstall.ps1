$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = "$toolsDir\file"
$ziplocation = "$toolsDir\unzip"

$url      = 'https://download.rsa.com/tokens/windows/RSASecurIDSoftwareToken5.0.3x64.zip' 

$pp = Get-PackageParameters

$sa = ""
$sa += if($pp.SETCOPYPROTECTION) { ' SETCOPYPROTECTION=' + $pp.SETCOPYPROTECTION}
$sa += if($pp.SETSINGLEDATABASE) { ' SETSINGLEDATABASE=' + $pp.SETSINGLEDATABASE}
$sa += if($pp.SETDATABASEDIR) { ' SETDATABASEDIR=' + $pp.SETDATABASEDIR}
$sa += if($pp.SETROAMING) { ' SETROAMING=' + $pp.SETROAMING}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI' 
  file         = "$fileLocation\RSASecurIDToken503x64.msi"
  softwareName  = 'rsa-secureid-software-token*' 
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"$sa"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyZipPackage $packageName $url -checksum "CD1CF1430ACCF98FD713379EEEF359E158DCD342BBAFBFF3BDC6B0871B5FCE578421509C2B6990B9BE4B05D679026C61D97F007FCE92FCC552BF8482DD86E1F1" -checksumType "sha512" -UnzipLocation $ziplocation
Get-ChocolateyUnzip  "$ziplocation\RSASecurIDToken503.zip" $fileLocation
Install-ChocolateyPackage @packageArgs
