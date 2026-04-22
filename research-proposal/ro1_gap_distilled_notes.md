# RO1 Gap Distillation Notes

这份 note 不是 proposal 正文，而是从 [ro1_gap_stress_test.md](/home/data/projects/phd-writing-template/research-proposal/ro1_gap_stress_test.md:1) 蒸馏出来、主要服务于 **RO1: Develop a Wild Autonomous Navigation System (WANS) for Long-Term Operation on Cost-Controlled Quadruped Platforms** 的论述底稿。

---

## 1. RO1 最稳的核心判断

如果只保留一个最重要的判断，那么它应当是：

> 当前四足机器人在野外环境中的 **mobility** 与 **local traversability capability** 已经显著成熟，但面向 **cost-controlled quadrupeds** 的、能够在 **wild unstructured environments** 中进行 **repeated** 和 **long-duration** operation 的系统级 autonomous navigation evidence 仍然稀少；当前真正的研究瓶颈已经从“机器人能不能走”上移到“系统能不能长期、稳定、可重复地自主运行，以及如何评估这种能力”。

这个判断比 “locomotion solved” 更稳，也比 “野外四足自主导航几乎没人做” 更准确。

---

## 2. RO1 不应该再怎么说

基于现有文献，RO1 最好不要再建立在以下几种表述上：

### 2.1 不要说“wild locomotion 仍然没有被解决”

[Miki et al. 2022](https://arxiv.org/abs/2201.08117) 已经强有力地说明，四足机器人在复杂自然地形中的 perceptive locomotion 已经达到相当成熟的水平。该工作不只是实验室里的 rough terrain 展示，而是在多季节、多类型环境中验证，并完成了无人工协助的一小时山地徒步。它并不意味着 locomotion 已经“彻底解决”，但足以说明：**基础 mobility 早已不是一个零到一的空白问题**。

因此，RO1 不能再把 novelty 放在 “make the quadruped walk in the wild” 这种层面。

### 2.2 不要说“wild terrain perception / traversability 还几乎没人做”

[Mattamala et al. 2024, WVN](https://arxiv.org/abs/2404.07110) 已经展示了基于 pre-trained models 和 online self-supervision 的 visual traversability learning，能够在 forests、grasslands、parks 等自然环境中快速完成 in-field adaptation，并被集成进闭环 local navigation。这个工作说明：**wild terrain perception 已经从 purely geometric heuristics 走向 semantic / learned traversability，并且已经过真实部署验证**。

因此，RO1 也不宜把 novelty 写成 “we introduce semantics or learned traversability into wild navigation” 这种太宽的说法。更准确的说法应该是：**已有这些能力，但它们尚未被组织成长期稳定运行的低成本平台系统**。

### 2.3 不要说“legged robots in the wild 仍然只是 one-off demos”

这个说法在 2026 年已经太粗了。至少以下工作已经把这个判断推窄了：

- [Mattamala et al. 2025](https://arxiv.org/abs/2506.20315): 1.5 年、多个国家、多个 forest campaigns、16 个 missions 的 autonomous forest inventory
- [Richter et al. 2026](https://arxiv.org/abs/2601.07362): 在 Mount Etna 的 autonomous volcanic gas monitoring missions
- [De Benedittis et al. 2025](https://arxiv.org/abs/2511.12526): 两年跨度的 alpine scree monitoring deployments

这些都不是简单的一次性 demo。更稳的说法应当是：

> 野外腿足平台的真实部署已经开始出现，而且已不止一次性演示；但这些 strongest examples 仍集中在高成本 ANYmal / Spot 体系，尚未充分覆盖 cost-controlled quadruped + repeated/long-duration autonomy 这一更具体的角落。

---

## 3. RO1 现在真正能成立的 gap 是什么

从现有证据看，RO1 最稳的 gap 不是单模块 gap，而是一个 **systems-and-deployment gap**。它至少包含四层。

### 3.1 平台层 gap: strongest evidence 仍集中于高成本 quadrupeds

最接近你目标问题的 direct wild legged papers，几乎都依赖 ANYmal，少数工作依赖 Spot：

- [Miki et al. 2022](https://arxiv.org/abs/2201.08117): ANYmal
- [Mattamala et al. 2024](https://arxiv.org/abs/2404.07110): ANYmal C / D
- [Mattamala et al. 2025](https://arxiv.org/abs/2506.20315): ANYmal C / D
- [Richter et al. 2026](https://arxiv.org/abs/2601.07362): ANYmal + custom mass spectrometer
- [De Benedittis et al. 2025](https://arxiv.org/abs/2511.12526): ANYmal C
- [Staniaszek et al. 2025, AutoInspect](https://doi.org/10.1109/TFR.2025.3586831): Spot + custom Frontier payload

这意味着当前 literature 已经证明：**高端 quadruped stack 可以在野外或近野外环境中做到很多事情**。  
但它还没有充分证明：**这些能力能否迁移到 cost-controlled quadrupeds，并在相近的时空尺度上稳定复现**。

因此，对 RO1 来说，platform choice 不是一个边缘实现细节，而是 gap 本身的一部分。

### 3.2 任务层 gap: 从野外自主导航“能工作”到“能长期反复工作”之间还有断层

在野外环境里，已有工作已经证明某些 autonomy stacks “can work”：

- WVN 证明了 wild traversability learning 可行 [Mattamala et al. 2024](https://arxiv.org/abs/2404.07110)
- Forest inventory 证明了 autonomous under-canopy missions 可行 [Mattamala et al. 2025](https://arxiv.org/abs/2506.20315)
- Volcanic monitoring 证明了 integrated sensing + autonomy 可行 [Richter et al. 2026](https://arxiv.org/abs/2601.07362)

但 RO1 关注的并不只是 “can it finish a mission?”，而是：

- 能不能 repeated deployment
- 能不能 mission duration 拉长
- 能不能在更复杂环境序列中维持 operational continuity
- 能不能用 failure data 反过来驱动系统迭代

这正是 [Mattamala et al. 2025](https://arxiv.org/abs/2506.20315) 和 [Richter et al. 2026](https://arxiv.org/abs/2601.07362) 自己都还在承认的 open frontier：问题已不再是一个 isolated mission 是否成功，而是 **long-duration, cross-scenario, operational autonomy** 如何被系统化地建立与证明。

### 3.3 方法层 gap: novelty 已从单模块算法转向 stack integration 和 operational methodology

[CERBERUS](https://arxiv.org/abs/2207.04914) 和 [AutoInspect](https://doi.org/10.1109/TFR.2025.3586831) 非常重要，因为它们说明：

- 高水平 autonomy 的关键往往不只是 planner 或 estimator 本身
- 而是 integration discipline、field testing cadence、recovery design、operator abstraction、logging、deployment procedures

尤其是：

- `CERBERUS` 说明 resilient autonomy 是可以通过长期 field integration 建出来的，但它是 competition-driven、heterogeneous、high-cost system-of-systems [Tranzatto et al. 2022](https://arxiv.org/abs/2207.04914)
- `AutoInspect` 说明 long-term autonomy 是可以做到 35-49 天级别的，但它主要发生在 structured, mapped, operator-prepared industrial settings，而不是 wild natural terrain [Staniaszek et al. 2025](https://doi.org/10.1109/TFR.2025.3586831)

因此，对 RO1 来说，真正合理的 claim 是：

> 研究价值不在于再发明一个 isolated locomotion or traversability module，而在于把已有 mobility/perception progress 组织成一个可在野外长期运行、可重复部署、可分析失败、可被单人操作的 WANS。

### 3.4 评估层 gap: “如何证明系统真的成熟了”仍不清楚

这一点其实是 RO1 最容易写出力度的地方。

[Mattamala et al. 2025](https://arxiv.org/abs/2506.20315) 直接指出复杂 autonomous systems 的 evaluation remains open。  
[Richter et al. 2026](https://arxiv.org/abs/2601.07362) 也展示了 autonomy rate 很高，但仍然暴露 global-local path misalignment、traversability estimation uncertainty、partial observability 等问题。  
[AutoInspect](https://doi.org/10.1109/TFR.2025.3586831) 则提供了长期 autonomy 的 industrial metrics 思路，例如 interventions、mission completion、uptime、operator burden。  
[Baril et al. 2022](https://arxiv.org/abs/2111.13981) 和 [Gadd et al. 2024](https://arxiv.org/abs/2404.10446) 进一步说明 repeated deployment 与 environmental variation analysis 的价值。

所以 RO1 的一个关键贡献方向可以不是 “invent a fundamentally new planner”，而是：

- 定义 progressively challenging scenario ladder
- 以 repeated deployment 收集 failure evidence
- 把 failure modes、intervention frequency、mission duration to failure、cross-scenario transfer 等指标组织起来
- 形成一套更接近 field robotics 需要的 evaluation practice

这会让你的 RO1 从“做一个系统”提升为“做出一种 community-useful way to assess such systems”。

---

## 4. RO1 最适合采用的论述重心

面向 RO1，你现在最稳的 narrative center 不是：

- locomotion breakthrough
- one new semantic module
- one more forest demo

而是下面这条线：

### 4.1 现有工作已经证明若干关键前提成立

- 四足机器人具备强野外 mobility [Miki et al. 2022](https://arxiv.org/abs/2201.08117)
- 视觉语义和 learned traversability 已能增强野外 local navigation [Mattamala et al. 2024](https://arxiv.org/abs/2404.07110)
- 高端 quadruped stacks 已能在森林、火山、山地等自然环境中完成真实 monitoring-oriented deployments [Mattamala et al. 2025](https://arxiv.org/abs/2506.20315); [Richter et al. 2026](https://arxiv.org/abs/2601.07362); [De Benedittis et al. 2025](https://arxiv.org/abs/2511.12526)

### 4.2 但现有 strongest evidence 仍未覆盖 RO1 的目标角落

也就是：

- `cost-controlled quadrupeds`
- `repeated deployment`
- `long-duration operation`
- `wild unstructured environments`
- `systematic failure characterization`

尤其是 cost-controlled 这一维，至今仍明显弱于 ANYmal / Spot literature。

### 4.3 因而 RO1 的研究问题应该被定义为一个 deployment-centered systems question

RO1 真正该问的不是：

> “怎样设计一个更先进的 locomotion / traversability algorithm？”

而应更接近：

> “怎样在成本受控的四足平台上，把已有 mobility、perception 与 planning progress 组织成一个能够在野外复杂环境中长期、反复运行的 autonomous navigation system，并用 repeated deployment 去识别其 failure modes 与 operational constraints？”

这会让 RO1 与现有 literature 的关系非常清楚：

- 你不是否定已有 progress
- 你是在已有 progress 之上，把问题推进到更难但更真实的 deployment regime

---

## 5. 可直接服务 RO1 写作的精炼判断

下面这些判断可以作为后续改写 proposal 的论述素材。

### 判断 A

四足平台在野外环境中的 mobility 与 traversability 已经从 capability demonstration 阶段走向 deployable component 阶段，但还没有充分走向 **cost-controlled long-duration autonomous system** 阶段 [Miki et al. 2022](https://arxiv.org/abs/2201.08117); [Mattamala et al. 2024](https://arxiv.org/abs/2404.07110); [Mattamala et al. 2025](https://arxiv.org/abs/2506.20315).

### 判断 B

现有最强的 direct evidence 已经表明，wild legged deployments 不再只是 one-off fantasy；然而这些 evidence 仍主要集中于 ANYmal / Spot class platforms，因此不能自动推出该能力已经在 cost-controlled quadrupeds 上被建立 [Mattamala et al. 2025](https://arxiv.org/abs/2506.20315); [Richter et al. 2026](https://arxiv.org/abs/2601.07362); [De Benedittis et al. 2025](https://arxiv.org/abs/2511.12526).

### 判断 C

真正缺乏的不是单个导航模块，而是一种经 repeated deployment 验证的、面向野外运行的 autonomous navigation practice：包括 stack integration、deployment protocol、failure logging、post-mortem analysis 与 evaluation methodology [Tranzatto et al. 2022](https://arxiv.org/abs/2207.04914); [Staniaszek et al. 2025](https://doi.org/10.1109/TFR.2025.3586831).

### 判断 D

与其把 RO1 定义为“提出一个新的野外导航算法”，不如把它定义为“在 cost-controlled quadruped 上，把现有 mobility/perception progress 系统化为一个长期运行的 WANS，并通过 repeated deployment 生成 community-useful evidence about failure modes, trade-offs, and operational limits”。

---

## 6. 最适合 RO1 的浓缩版 gap 表述

如果把上面的内容压到最核心，RO1 最稳的 gap 可写成：

> 近期研究已经显著推进了四足机器人在野外地形中的 mobility、visual traversability learning 与若干高端平台上的真实部署，但这些进展尚未转化为在 cost-controlled quadrupeds 上、面向 repeated and long-duration operation 的野外 autonomous navigation evidence。当前缺少的不是单一模块，而是一种可部署、可复现、可评估的 WANS，以及围绕其 failure modes、operational constraints 与 evaluation methodology 的系统化知识。

这应该成为 RO1 的主叙述中心。

---

## 7. 一句最短总结

RO1 最终应主张的不是：

> “我们要证明四足机器人能在野外自主导航。”

而是：

> “我们要证明在成本受控的平台上，如何把已经存在的 mobility 与 perception progress 变成长期、反复、可评估的野外自主导航能力。”
