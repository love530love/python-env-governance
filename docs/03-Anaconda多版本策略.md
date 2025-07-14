# 03 · Anaconda 多版本策略：构建稳固可控的 Python 环境体系

> 本章节聚焦在 Windows 平台下的 Python 多版本管理策略，
> 
> 通过 Anaconda 构建“系统级统一调度 + 项目级 `.venv` 独立”的稳定架构。

---

## 🧭 为什么要使用多版本治理？

Python 生态庞大，不同项目经常依赖不同版本：

- 老项目可能停留在 Python 3.8
- 新框架（如 Pytorch 2.2、Transformers）要求 Python 3.10+
- 特定工具链（如 UV、Hatch）仅在某些版本下稳定

**问题是：**

- 系统中只能安装一个 Python 版本？
- 虚拟环境工具安装杂乱，版本冲突？
- 没法统一调度和路径控制？

我们需要一个方案：

✅ 多版本共存  
✅ 清晰路径结构  
✅ 可调度可复现  
✅ 易于集成 IDE（如 PyCharm）  

---

## 🔧 方案概览：Anaconda 构建多版本中心

我们以 `Anaconda` 为基础工具，构建如下结构（安装路径设为 `I:\Conda`）：

```text
I:\Conda\
├── base\             ← Anaconda 默认环境（建议 Python 3.11）
├── python38\         ← 自定义创建的 Python 3.8 环境
├── python39\
├── python310\
├── python311\
└── python312\
````

---

## 🏗 创建新版本环境（推荐命名规则）

```bash
# 创建 python 3.8 环境
conda create -p I:\Conda\python38 python=3.8 -y

# 创建 python 3.12 环境
conda create -p I:\Conda\python312 python=3.12 -y
```

> 使用 `-p` 指定路径，避免环境存入默认的 `envs` 目录。

---

## 🧭 使用方式一：作为 PyCharm 解释器

在 PyCharm 中：

1. 添加解释器 → `Add Interpreter`
2. 选择 `Conda Environment` → `Existing environment`
3. 浏览选择：`I:\Conda\python38\python.exe` 等路径
4. 可按项目需求绑定不同 Python 版本

---

## 🧭 使用方式二：生成 `.venv` 项目级环境

在不同版本环境中，利用 `venv` 创建项目内环境：

```bash
# 进入 Anaconda 的 python38 环境
conda activate I:\Conda\python38

# 进入项目路径
cd I:\DevProjects\myproject

# 创建 venv
python -m venv .venv

# 激活环境
.\.venv\Scripts\activate
```

> 这样就实现了：系统统一调度 + 项目级隔离！

---

## 🔁 `.venv` 与 Anaconda 多版本的关系

| 层级         | 作用      | 示例路径                            |
| ---------- | ------- | ------------------------------- |
| Conda 多版本  | 系统级调度器  | `I:\Conda\python310\python.exe` |
| 项目 `.venv` | 项目级依赖隔离 | `I:\DevProjects\xxx\.venv\`     |
| 构建工具       | 本地化封装   | `.venv\Scripts\poetry.exe`      |

---

## 💡 结合构建工具封装使用

示例（以 uv + hatch 本地化安装）：

```bash
# 激活 venv 后
pip install uv hatch

# 安装完后
where uv
# => 应指向 .venv\Scripts\uv.exe

# 退出 venv 后不可全局使用
```

---

## 📦 环境导出与复现

每个 Conda 环境可导出 `env.yaml`，便于迁移：

```bash
conda activate I:\Conda\python38
conda env export > env_py38.yaml

# 在另一台机器恢复
conda env create -f env_py38.yaml -p I:\Conda\python38
```

---

## 🗂 配套文档推荐阅读

* [多版本 Python 虚拟环境路径治理方案](https://aicity.blog.csdn.net/article/details/149021241)
* [路径结构规范（02-章节）](./02-路径结构规范.md)
* [工具链隔离（04-章节）](./04-工具链隔离.md)

---

## ✅ 小结

Anaconda 不是为了替代 `.venv`，而是作为：

* Python 多版本的统一调度入口；
* `.venv` 项目环境的基础构建来源；
* 工具链隔离的依托与版本保障；

配合路径治理、构建治理、调度治理理念，Anaconda 多版本体系将成为你本地 AI 环境治理的重要基石。


