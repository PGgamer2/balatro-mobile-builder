Write-Host "Cleaning bin, publish, and obj folders."

# Reset the publish folder
Remove-Item -Recurse -Force publish -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path publish | Out-Null

Set-Location balatro-mobile-builder

# Remove obj/build folders
Remove-Item -Recurse -Force "bin\Release" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "bin\publish" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "obj" -ErrorAction SilentlyContinue

# Helper function for publishing and moving files
function Publish-And-Move
{
    param (
        [string]$Profile,
        [string]$SourceExe,
        [string]$DestExe
    )
    Write-Host "Building $Profile"
    dotnet publish "balatro-mobile-builder.csproj" /p:PublishProfile="$Profile"
    Move-Item -Force ".\bin\publish\$Profile\$SourceExe" "..\publish\$DestExe"
}

# Build for all targets
Publish-And-Move "win-x64" "balatro-mobile-builder.exe" "balatro-mobile-builder-win-x64.exe"
Publish-And-Move "win-arm64" "balatro-mobile-builder.exe" "balatro-mobile-builder-win-arm64.exe"
Publish-And-Move "osx-x64" "balatro-mobile-builder" "balatro-mobile-builder-osx-x64"
Publish-And-Move "osx-arm64" "balatro-mobile-builder" "balatro-mobile-builder-osx-arm64"
Publish-And-Move "linux-x64" "balatro-mobile-builder" "balatro-mobile-builder-linux-x64"
Publish-And-Move "linux-arm64" "balatro-mobile-builder" "balatro-mobile-builder-linux-arm64"
