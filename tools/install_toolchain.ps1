# tools/install_toolchain.ps1
# 为当前 Conda 环境安装全工具链

pip install poetry virtualenv pipenv uv hatch
Write-Host "✅ 构建工具链安装完成 (poetry / uv / hatch 等)" -ForegroundColor Green
