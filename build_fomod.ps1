

function CreateBuildFolders {
    
    New-Item -Path "build" -ItemType Directory | Out-Null

    New-Item -Path "build/NPE - GAMMA EXP Edition Redux" -ItemType Directory | Out-Null
    
}

function BuildMod {

    $target = "build/NPE - GAMMA EXP Edition Redux"
    Copy-Item -Recurse -Force -Path  ".\Main\Modules\BHSRO\gamedata", ".\Main\Modules\Custom HUD\gamedata", ".\Main\Modules\BlackMarket\gamedata" -Destination $target -Exclude .bak

    # Copy-Item -Force -Path ".\doc\NPE.pdf" -Destination $target
}

CreateBuildFolders
BuildMod

$compress = @{
    Path = "build/NPE - GAMMA EXP Edition Redux/gamedata" 
    CompressionLevel = "Fastest"
    DestinationPath = "release/NPE GAMMA EXP Edition Redux.zip"
}
Compress-Archive @compress -Force

Remove-Item -Force -Recurse -Path "./build"