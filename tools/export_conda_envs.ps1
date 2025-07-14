# PowerShell 脚本：导出所有 Conda 环境列表
conda env list | Out-File -FilePath conda_envs.txt