# tools/init_project.ps1
# 初始化标准项目结构并创建本地 .venv

param(
    [string]$ProjectName = "MyNewProject",
    [string]$ParentPath = "I:\DevProjects",
    [string]$PythonVersion = "3.10"
)

$projectPath = Join-Path $ParentPath $ProjectName

# 创建项目目录结构
New-Item -ItemType Directory -Path $projectPath -Force | Out-Null
New-Item -ItemType Directory -Path "$projectPath\data", "$projectPath\models", "$projectPath\notebooks", "$projectPath\scripts" | Out-Null
New-Item -Path "$projectPath\README.md" -ItemType File -Force | Out-Null

# 创建 .venv
conda activate D:\PyEnv\py$($PythonVersion.Replace('.', ''))
python -m venv "$projectPath\.venv"

Write-Host "✅ 项目 $ProjectName 初始化完成：$projectPath" -ForegroundColor Green
Start-Process "code" $projectPath