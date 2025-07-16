# tools/restore_venv.ps1
# 解压 .venv.zip 并还原为项目虚拟环境

param(
    [string]$ProjectPath = "I:\DevProjects\MyProject"
)

Expand-Archive -Path "$ProjectPath\.venv.zip" -DestinationPath "$ProjectPath\.venv" -Force
Write-Host "✅ .venv 恢复完成" -ForegroundColor Green