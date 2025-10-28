# Decompositions

## 目录
- [项目简介](#项目简介)
- [仓库结构](#仓库结构)
  - [代码](#代码)
  - [文档与图像](#文档与图像)
- [快速开始](#快速开始)
- [参考资料](#参考资料)
- [我的博士论文中如何使用 RIF-OB 分解](#我的博士论文中如何使用-rif-ob-分解)

## 项目简介
本仓库整理了常见经济学分解方法（如 Oaxaca–Blinder 与 RIF-OB）的相关脚本、可视化示例与参考资料，便于在实证研究中快速复现和比较不同分解策略。

## 仓库结构

### 代码
- `shapley-region.ipynb`：用于展示 Shapley 分解结果的 Jupyter Notebook，可在 Python 环境中运行。
- `RIF-OB stata do-file.do`：实现 RIF-OB 分解的 Stata 脚本。
- `visualization code of RIF-OB STATA do-file.do`：配套的 Stata 可视化代码，帮助生成图表与结果展示。

### 文档与图像
- `DECOMPOSITION METHODS IN ECONOMICS.pdf`：经济学中常见分解方法的综述材料。
- `RIF+RIF-OB 2024 by Andrew .pdf`：RIF 与 RIF-OB 方法的课程或培训讲义。
- `The OB in Stata 2024 byBen Jann.pdf`：Oaxaca–Blinder 分解在 Stata 中的应用指南。
- `Figure2.tiff`、`Figure3.tiff`：用于论文或报告的示例图像，可配合 Notebook 或 Stata 代码使用。

## 快速开始
1. 根据需要选择执行环境：
   - 若使用 Python，可在本地或云端 Notebook 中打开 `shapley-region.ipynb`，确保安装 pandas、numpy、matplotlib 等常用依赖。
   - 若使用 Stata，可在对应版本中运行 `RIF-OB stata do-file.do`，并视需求调用可视化脚本。
2. 参考文档目录，查阅对应理论背景与操作说明。

## 参考资料
- Fortin, Lemieux & Firpo (2011) 对 RIF-OB 分解的详细介绍。
- Andrew、Ben Jann 等人的讲义与教材，为使用者提供操作指南与案例。

## 我的博士论文中如何使用 RIF-OB 分解
我关注到了老年人的 self perception of aging 存在城乡和性别差异，于是使用 RIF-OB 分解分析这种差异的影响因素。RIF-OB 分解的好处是除了均值差异之外还可以研究分布差异，因此我的研究主要关注了四种差异：均值差异、方差差异、P90-P10 分位数差异、基尼系数差异。
是根据 [Jann2024](./The%20OB%20in%20Stata%202024%20byBen%20Jann.pdf)、[Andrew2024](./RIF+RIF-OB%202024%20by%20Andrew%20.pdf) 的教程，在 STATA18 中完成的分析，[代码](./RIF-OB%20stata%20do-file.do)。
另外我还对结果进行了可视化，可以得到一个更直观的对比图，[绘制代码](./visualization%20code%20of%20RIF-OB%20STATA%20do-file.do) 在此分享。
[图片](./Figure3.tiff)
