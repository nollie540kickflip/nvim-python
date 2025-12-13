# メモ
* 仮想環境は uv を使用
* pyproject.toml
```toml
[project]
name = "python"
version = "0.1.0"
description = "Add your description here"
readme = "README.md"
requires-python = ">=3.12"
dependencies = [
    "black>=25.12.0",
    "debugpy>=1.8.18",
    "pyright>=1.1.407",
    "ruff>=0.14.9",
]

[tool.ruff]
line-length = 88
select = ["I"]   # I = isort 互換ルール

[tool.ruff.isort]
combine-as-imports = true
force-single-line = false
```
