# Refresh the hosted copies from the current main branches of the tool repositories.
$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
$tools = @(
    @{ Repo = 'ansii-editor'; File = 'Krynn_256_Color_Text_Editor.html'; Folder = 'color-editor' },
    @{ Repo = 'crafting-studio'; File = 'Krynn_Crafting_Studio_v23.html'; Folder = 'crafting-studio' }
)
foreach ($tool in $tools) {
    $destination = Join-Path $projectRoot ('docs/' + $tool.Folder + '/index.html')
    Invoke-WebRequest -Uri ('https://raw.githubusercontent.com/legimia/' + $tool.Repo + '/main/' + $tool.File) -OutFile $destination
    Write-Output ('Updated ' + $tool.Folder)
}
