# 03 · Anaconda 多版本策略：高效管理多版本 Python 环境

> 本文探讨如何通过 Anaconda 实现多版本 Python 环境的高效管理，包括如何创建、切换和删除不同版本的 Python 环境，以满足不同项目的需求。

---

## 🎯 为什么多版本管理至关重要？

在 Python 开发过程中，不同项目可能需要不同版本的 Python，而不同版本的 Python 可能有不同的依赖包需求。直接在系统环境中切换 Python 版本不仅容易引发版本冲突，还可能导致系统不稳定。因此，使用 Anaconda 管理多版本 Python 环境能够有效解决版本冲突、确保环境隔离。

---

## 🧭 Anaconda 多版本管理基本概念

通过 Anaconda，我们可以为每个 Python 版本创建独立的环境，每个环境具有自己的 Python 版本和依赖包。环境之间的相互隔离避免了依赖冲突，确保每个项目都有其独立的运行环境。

### 创建多个版本环境

- **创建 Python 3.8 环境**：
  ```powershell
  conda create -p D:\PyEnv\py38 python=3.8 -y
  ```

- **创建 Python 3.10 环境**：
  ```powershell
  conda create -p D:\PyEnv\py310 python=3.10 -y
  ```

- **创建 Python 3.12 环境**：
  ```powershell
  conda create -p D:\PyEnv\py312 python=3.12 -y
  ```

在上面的命令中，`-p` 参数指定了自定义路径，使环境存放在 `D:\PyEnv` 下，避免了默认的 `envs` 目录，路径更简洁。



如果使用默认的 `envs` 目录，则命令更简洁易记：
### 创建多个版本环境

- **创建 Python 3.8 环境**：
  ```powershell
  conda create py38 python=3.8 -y
  ```

- **创建 Python 3.10 环境**：
  ```powershell
  conda create py310 python=3.10 -y
  ```

- **创建 Python 3.12 环境**：
  ```powershell
  conda create py312 python=3.12 -y
  ```
## 📁 Python 路径结构树状示例图

### 1. 使用 `D:\Conda\envs\`（默认路径）
```text
Anaconda 环境（基础路径：D:\Conda\）
├─ base 环境（默认 Python 版本）
│    ├─ python.exe: D:\Conda\python.exe
│    ├─ 工具路径: D:\Conda\Scripts\
│
├─ 环境路径（D:\Conda\envs\py38\）
│       ├─ py38 环境（Python 3.8）
│       │ ├─ python.exe: D:\Conda\envs\py38\python.exe
│       │ ├─ 工具路径: D:\Conda\envs\py38\Scripts\
│       │
├─ 环境路径（D:\Conda\envs\py39\）
│        ├─ py39 环境（Python 3.9）
│        │ ├─ python.exe: D:\Conda\envs\py39\python.exe
│        │ ├─ 工具路径: D:\Conda\envs\py39\Scripts\
│        │
├─ 环境路径（D:\Conda\envs\310\）
│ ├─ py310 环境（Python 3.10）
│        │ ├─ python.exe: D:\Conda\envs\310\python.exe
│        │ ├─ 工具路径: D:\Conda\envs\310\Scripts\
│        │
├─ 环境路径（D:\Conda\envs\py311\）
│ ├─ py311 环境（Python 3.11）
│        │ ├─ python.exe: D:\Conda\envs\py311\python.exe
│        │ ├─ 工具路径: D:\Conda\envs\py311\Scripts\
│        │
├─ 环境路径（D:\Conda\envs\py312\）
│ ├─ py312 环境（Python 3.12）
│        │ ├─ python.exe: D:\Conda\envs\py312\python.exe
│        │ ├─ 工具路径: D:\Conda\envs\py312\Scripts\
│        │
├─ 环境路径（D:\Conda\envs\py313\）
│ └─ py313 环境（Python 3.13）
│        ├─ python.exe: D:\Conda\envs\py313\python.exe
│        ├─ 工具路径: D:\Conda\envs\py313\Scripts\
│
└─ MSYS2 环境（D:\msys64\mingw64）
    └─ Python 3.12 环境（如需）
        ├─ python.exe: D:\msys64\mingw64\bin\python.exe
        ├─ 工具路径: D:\msys64\mingw64\bin\

````



### 2. 使用 `D:\PyEnv\`（自定义路径）
```text
Anaconda 环境（基础路径：D:\Conda\）
├─ base 环境（默认 Python 版本）
│ ├─ python.exe: D:\Conda\python.exe
│ ├─ 工具路径: D:\Conda\Scripts\
│
├─ 环境路径（D:\PyEnv\py38\）
│ ├─ py38 环境（Python 3.8）
│ │ ├─ python.exe: D:\PyEnv\py38\python.exe
│ │ ├─ 工具路径: D:\PyEnv\py38\Scripts\
│ │
├─ 环境路径（D:\PyEnv\py39\）
│ ├─ py39 环境（Python 3.9）
│ │ ├─ python.exe: D:\PyEnv\py39\python.exe
│ │ ├─ 工具路径: D:\PyEnv\py39\Scripts\
│ │
├─ 环境路径（D:\PyEnv\py310\）
│ ├─ py310 环境（Python 3.10）
│ │ ├─ python.exe: D:\PyEnv\py310\python.exe
│ │ ├─ 工具路径: D:\PyEnv\py310\Scripts\
│ │
├─ 环境路径（D:\PyEnv\py311\）
│ ├─ py311 环境（Python 3.11）
│ │ ├─ python.exe: D:\PyEnv\py311\python.exe
│ │ ├─ 工具路径: D:\PyEnv\py311\Scripts\
│ │
├─ 环境路径（D:\PyEnv\py312\）
│ ├─ py312 环境（Python 3.12）
│ │ ├─ python.exe: D:\PyEnv\py312\python.exe
│ │ ├─ 工具路径: D:\PyEnv\py312\Scripts\
│ │
├─ 环境路径（D:\PyEnv\py313\）
│ └─ py313 环境（Python 3.13）
│ ├─ python.exe: D:\PyEnv\py313\python.exe
│ ├─ 工具路径: D:\PyEnv\py313\Scripts\
│
└─ MSYS2 环境（D:\msys64\mingw64）
        └─ Python 3.12 环境（如需）
        ├─ python.exe: D:\msys64\mingw64\bin\python.exe
        ├─ 工具路径: D:\msys64\mingw64\bin\

````

---

## ⚙ 环境切换与激活

### 使用 `conda activate` 激活环境

在创建完多个版本的 Python 环境后，您可以通过 `conda activate` 命令切换并激活所需的环境。假设您创建了 `py38` 和 `py310` 环境：

- **激活 Python 3.8 环境**：
  ```powershell
  conda activate D:\PyEnv\py38
  ```

- **激活 Python 3.10 环境**：
  ```powershell
  conda activate D:\PyEnv\py310
  ```

请注意，如果您希望使用简化的 `conda activate py310`，需要在初始化过程中配置路径，使得 `conda` 能够识别该路径。这可以通过手动指定环境目录，或将环境目录添加到 `conda` 配置中来实现。

---

## 🧰 环境版本切换中的常见操作

### 1. 切换环境

切换 Python 环境非常简单。您只需使用 `conda activate` 命令指定目标环境路径即可。例如，切换到 Python 3.8 环境：

```powershell
conda activate D:\PyEnv\py38
```

若要退出当前环境并返回到默认的 `base` 环境，使用以下命令：

```powershell
conda deactivate
```

### 2. 安装特定版本的包

在激活某个环境后，您可以使用 `conda install` 或 `pip` 安装特定版本的包。例如，在 `py310` 环境中安装 `numpy`：

```powershell
conda activate D:\PyEnv\py310
conda install numpy=1.21.2
```

或者使用 `pip` 安装：

*作为 Python 来源的基础 Conda 环境，除非必要，不然一律使用 conda instal 命令安装*

*目的是保持基础 Python 解释器 环境的纯净和稳定*

*原因是 conda install 命令和 pip install 命令混用，会导致环境依赖交叉污染进而导致不稳定*

*但是，需要注意的是，往往 pip 渠道中软件包版本的更新速度快于 conda 渠道，多数情况下 pip 渠道包更能适应迭代较快的 AI 项目*
```powershell
pip install numpy==1.21.2
```

### 3. 查看所有已安装的环境

要查看所有已创建的环境以及它们的路径，可以使用：

```powershell
conda env list
```

这将列出所有环境，并标明当前激活的环境。

---

## 🧰 管理和删除环境

### 删除环境

如果您不再需要某个环境，可以使用以下命令删除环境：

```powershell
conda env remove -p D:\PyEnv\py310
```

删除环境时，`-p` 后面需要跟环境的路径。

### 导出环境配置

如果您希望将某个环境的配置导出到一个 YAML 文件，以便在其他机器上重建该环境，可以使用以下命令：

```powershell
conda env export -p D:\PyEnv\py310 > py310_environment.yml
```

然后，您可以在其他机器上通过以下命令导入该环境配置：

```powershell
conda env create -f py310_environment.yml
```

---

## 🧰 环境更新

如果需要更新某个环境的 Python 版本，可以使用 `conda install` 来更新到指定版本。例如，将 `py310` 环境更新到 Python 3.9：

```powershell
conda activate D:\PyEnv\py310
conda install python=3.9
```

---

## 📚 延伸阅读

- [02 · 路径结构规范：构建可控、统一的本地 Python 环境体系](./02-路径结构规范.md)
- [04 · 工具链隔离：确保每个环境独立且无冲突](./04-工具链隔离.md)

---

## ✅ 总结

通过 Anaconda 管理多版本 Python 环境，可以有效避免版本冲突、依赖混乱的问题。为每个项目或不同版本创建独立的环境，不仅使得开发过程更加稳定，而且提高了跨平台迁移和协作的效率。在环境切换、更新、删除时，Anaconda 提供了简单且高效的工具，使得管理多版本 Python 环境变得更加容易。



