param(
    [Parameter(Mandatory = $true)]
    [string]$ProjectPath,

    [Parameter(Mandatory = $true)]
    [string]$ProjectName,

    [Parameter(Mandatory = $true)]
    [string]$ProjectPrefix
)

$ErrorActionPreference = "Stop"

Write-Host "Applying Angular template..." -ForegroundColor Cyan
Write-Host "Project path   : $ProjectPath"
Write-Host "Project name   : $ProjectName"
Write-Host "Project prefix : $ProjectPrefix"
Write-Host ""

$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path
$repositoryRoot = Resolve-Path (Join-Path $scriptDirectory "..")
$templateRoot = Join-Path $repositoryRoot "templates\angular"

if (-not (Test-Path $templateRoot)) {
    throw "Angular template directory not found: $templateRoot"
}

if (-not (Test-Path $ProjectPath)) {
    throw "Target project path not found: $ProjectPath"
}

$packageJsonPath = Join-Path $ProjectPath "package.json"

if (-not (Test-Path $packageJsonPath)) {
    throw "The target directory does not look like an Angular project. Missing package.json: $packageJsonPath"
}

function Copy-TemplateFile {
    param(
        [Parameter(Mandatory = $true)]
        [string]$SourceRelativePath,

        [Parameter(Mandatory = $true)]
        [string]$TargetRelativePath
    )

    $sourcePath = Join-Path $templateRoot $SourceRelativePath
    $targetPath = Join-Path $ProjectPath $TargetRelativePath
    $targetDirectory = Split-Path -Parent $targetPath

    if (-not (Test-Path $sourcePath)) {
        throw "Template file not found: $sourcePath"
    }

    if (-not (Test-Path $targetDirectory)) {
        New-Item -ItemType Directory -Path $targetDirectory | Out-Null
    }

    $content = Get-Content -Path $sourcePath -Raw

    $content = $content.Replace("__PROJECT_NAME__", $ProjectName)
    $content = $content.Replace("__PROJECT_PREFIX__", $ProjectPrefix)

    Set-Content -Path $targetPath -Value $content -NoNewline

    Write-Host "Updated: $TargetRelativePath" -ForegroundColor Green
}

Copy-TemplateFile -SourceRelativePath ".windsurf\rules\guidelines.md" -TargetRelativePath ".windsurf\rules\guidelines.md"
Copy-TemplateFile -SourceRelativePath ".github\copilot-instructions.md" -TargetRelativePath ".github\copilot-instructions.md"
Copy-TemplateFile -SourceRelativePath "package.template.json" -TargetRelativePath "package.json"
Copy-TemplateFile -SourceRelativePath "angular.template.json" -TargetRelativePath "angular.json"
Copy-TemplateFile -SourceRelativePath "tsconfig.template.json" -TargetRelativePath "tsconfig.json"
Copy-TemplateFile -SourceRelativePath "tsconfig.app.template.json" -TargetRelativePath "tsconfig.app.json"
Copy-TemplateFile -SourceRelativePath "eslint.config.template.js" -TargetRelativePath "eslint.config.js"
Copy-TemplateFile -SourceRelativePath "prettier.config.template.js" -TargetRelativePath "prettier.config.js"
Copy-TemplateFile -SourceRelativePath ".editorconfig" -TargetRelativePath ".editorconfig"
Copy-TemplateFile -SourceRelativePath ".prettierignore" -TargetRelativePath ".prettierignore"
Copy-TemplateFile -SourceRelativePath "vscode\extensions.json" -TargetRelativePath ".vscode\extensions.json"
Copy-TemplateFile -SourceRelativePath "vscode\settings.json" -TargetRelativePath ".vscode\settings.json"

Write-Host ""
Write-Host "Angular template applied successfully." -ForegroundColor Cyan
Write-Host ""
Write-Host "Next steps:"
Write-Host "1. Review the Git diff in the target project."
Write-Host "2. Run npm install."
Write-Host "3. Run npm run check."