# tools/export_conda_envs.ps1
# 导出当前 Conda 环境列表

$condaPath = "D:\Conda\Scripts\conda.exe"
$envList = & $condaPath env list
$envList | Out-File -Encoding UTF8 -FilePath "env_list.txt"
Write-Host "✅ 已导出 Conda 环境列表至 env_list.txt" -ForegroundColor Green


# tools/compress_venv.ps1
# 将项目中的 .venv 压缩成 zip

param(
    [string]$ProjectPath = "I:\DevProjects\MyProject"
)

Compress-Archive -Path "$ProjectPath\.venv\*" -DestinationPath "$ProjectPath\.venv.zip" -Force
Write-Host "✅ 已压缩 .venv 至 .venv.zip" -ForegroundColor Green
