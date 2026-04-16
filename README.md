# Academic Writing Template

Markdown + Pandoc + Zotero 学术写作工作流。适合 proposal、文献综述、读书笔记等场景。

## 文件结构

```
project/
├── main.md        # 正文，在这里写作
├── refs.bib       # 由 Zotero Better BibTeX 自动导出，不要手动编辑
├── ieee.csl       # 引用格式（IEEE）。换格式只需替换此文件
├── apa.csl        # 备用格式（APA 7th）
├── style.css      # HTML/PDF 样式
├── Makefile       # 编译命令
└── output/        # 编译产物，不需要提交 git
    ├── proposal.html
    ├── proposal.pdf
    └── proposal.docx
```

## 编译

```bash
make html    # 浏览器预览，CSS 内嵌，可直接分享
make pdf     # PDF（需要 weasyprint）
make docx    # Word 文档
make clean   # 删除 output/ 目录
```

## 写作

在 `main.md` 里用 `[@citationkey]` 引用文献：

```markdown
Legged robots have shown strong results [@miki2022learning].
多篇引用 [@miki2022learning; @tranzatto2022team].
```

Pandoc Citer 插件在 VSCode 里打 `@` 自动补全引用键。

## 复用到新项目

1. 复制这四个文件到新目录：`Makefile` `style.css` `ieee.csl` `apa.csl`
2. 新建 `main.md`，frontmatter 照抄：

```yaml
---
title: "标题"
author: "姓名"
date: "2026"
bibliography: [refs.bib]
csl: ieee.csl
---
```

3. 在 Zotero 右键新 Collection → Export → Better BibTeX → 勾选 Keep updated → 路径指向新项目的 `refs.bib`
4. 更新 VSCode `settings.json` 里的路径：

```json
{
  "pandocCiter.rootFile": "/path/to/new-project/main.md",
  "pandocCiter.DefaultBibs": ["/path/to/new-project/refs.bib"]
}
```

## 依赖

| 工具 | 用途 | 安装 |
|------|------|------|
| pandoc | Markdown 转换 | `sudo apt install pandoc` |
| weasyprint | HTML → PDF | `pipx install weasyprint` |
| google-chrome | 备用 PDF 引擎 | 已装 |
| Zotero + Better BibTeX | 文献管理 | zotero.org |
| VSCode + Pandoc Citer | 引用补全 | VSCode 扩展市场 |

## 换引用格式

从 [Zotero Style Repository](https://www.zotero.org/styles) 下载 `.csl` 文件，
或直接从 GitHub 下载：

```bash
# APA
curl -s https://raw.githubusercontent.com/citation-style-language/styles/master/apa.csl -o apa.csl
# IEEE
curl -s https://raw.githubusercontent.com/citation-style-language/styles/master/ieee.csl -o ieee.csl
```

然后改 `main.md` frontmatter 的 `csl:` 字段，以及 `Makefile` 里的 `--csl=` 参数。

## Citation Key 格式（Better BibTeX）

推荐公式：`auth.lower + year + veryshorttitle.lower`

生成结果示例：`miki2022learning`、`tranzatto2022team`

设置路径：Zotero → Edit → Settings → Better BibTeX → Citation Keys
