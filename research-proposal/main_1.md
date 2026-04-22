---
title: "Long-Term Autonomous Navigation for Legged Robots in Forest Environments for Environmental Monitoring"
subtitle: "UCL Computer Science MPhil/PhD Application"
author: "Hongbo Li"
date: "April 2026"
bibliography: assets/refs.bib
csl: assets/ieee.csl
---

# 1. Motivation & Vision

Why legged robots for environmental monitoring, why now, why UK forest
一段话给出 big picture，最多 3 句话 state the gap this PhD addresses


Sentence 1-2: The big picture problem

<!-- 世界上存在的一个大问题/趋势 -->
生态系统和对人类社会的影响大 --- 热带雨林, 火山, 物种多样性. 因此生态系统监测非常重要.

然而, 生态系统监测的规模需求 vs 人力监测的局限存在明显的不足. 
- 宏观上的气象站卫星图象没办法替代对局部地区深入的监测, 例如森林气体和物种监测需要更细致的手段
- 常规人力和固定点位仪器局限性明显
- 引入自主无人系统无人机


Sentence 3-5: The technology opportunity

<!-- 什么技术让这个问题有了新的解决可能 -->
Robotics Autonomous system 被
例如：legged robots 近几年在 wild deployment 上的进展


Sentence 6-8: The specific gap

但即使有这些进展，仍然有一个具体未被解决的 gap
例如：从 demo 到 sustained deployment 之间的 gap，或者从 controlled field trial 到 real monitoring program 的 gap


Sentence 9-10: The thesis claim

这个 PhD 将通过 X 方式 address 这个 gap
一句话说清楚 what you're going to do


# 2. Background & Related Work


Gap 1: From Demo to Sustained Deployment

现状：大部分 legged-in-wild 工作是 one-off demonstrations
关键 paper：Mattamala 2025（他们自己在 discussion 里就承认这点）
你的增量：long-term, repeated, longitudinal deployment

Gap 2: From Geometric to Multi-modal Scene Understanding

现状：大部分野外 navigation 还是 geometric-based apporaches  
关键 paper： 
- @mattamala2025buildingforestinventories 基于 Lidar-based SLAM 做的 state estimation and SLAM, 
你的增量：把 VLM + semantics + learned traversability 集成到 real forest deployment

Gap 3: Missing Evaluation Framework for Field Monitoring

现状：没有公认的 benchmark / evaluation protocol for robot-based monitoring
关键 paper：Mattamala 2025 discussion 明确说 "evaluation is open question"
你的增量：建立 systematic evaluation framework


(Optional) Gap 4: Robots as Ecological Tools

现状：robotics 和 ecology 社区之间的 gap 
关键 paper：那篇 biodiversity expert survey paper @pringle2025opportunitieschallengesmonitoring and @dunbabin2012robotsenvironmentalmonitoringa
你的增量：把 robot capability 和 ecological monitoring needs 对齐 



# 3. Reserach Questions

我的科研问题由三个方面的问题组成, 但是他们最终都服务于我的终极主题


研究问题1: 什么样的WANS系统设计和策略 (包括如何使用 VLM, multi-modal scene representation (combining geometric, semantic, and learned traversability cues 等等) 能让 robot 在稠密温带森林环境中稳定的工作? 我们如何设计一个适合森林或者更多环境的IMP, 而且能做到好用便宜而且便于集成和复制, 并且把这个经验分享给社区? "

研究问题2: "在实地部署过程中有哪些 lessons learned? What are the WANS系统 trade-off, dominant failure modes, data quality tradeoffs, and operational constraints of repeated legged robot deployment for biodiversity monitoring in UK temperate woodland over a long-term, large-scale period? ?"

研究问题3: " How can we systematically evaluate and benchmark autonomous legged-robot-based environmental monitoring against existing methods (TLS, ALS/drone, human transect, fixed sensors), across dimensions of coverage, data fidelity, environmental impact, and operational cost"



# 4. Proposed Approach


stage 1: WANS系统搭建和测试
目标: 搭建 WANS 和 IMP 原型系统, 在结构化室外和简单森林环境下验证通过
方法: 
- 平台: Unitree B2 or go2-w
- WANS modular 设计: 
  - Perception: Lidar, RGB-D Camear
  - FM-based Scene Encoding module VLM
  - Semantic Segmentation Module: Open Semantic Segmentation
  - Local Map Representation Module: Elevation Map
  - RL-based Local Planner
  - RL-based Locomotion Module 
- 测试地点: UCL East 或周边室外自然地带 
预期: WANS 能够野外部署且不报错; IMP集成好了单独测试功能通过, 且能部署到 WANS 上做初步验证.

stage 2: IMP 系统设计和测试
- 目标: 设计可以部署在 WANS 上的 IMP 系统
- 方法: 
  - (1) Mapping and Detection: Lidar & RGB Camera; 
  - (2) 大气与气体监测 (CO2、CH4、SO2、H2S、NH3、VOC、颗粒物，以及温湿): 气体小型传感器阵列 (NDIR、PID、MOS/MOX) ; 
  - (3) 土壤和沉积物监测(土壤水分、电导率、温度、pH): soil probe & 接触式 pH/EC;
- 预期: 独立测试能功能正常, 能部署在WANS

stage 3: 实地测试, 系统优化, 正式部署期
目标: 短期实地部署, 收集数据并评估系统表现, 并且改进系统
方法:
- 地点: Wytham Woods 或 Alice Holt
- 实地部署准备工作: 运输, 网络信号, 安全措施等 
- 收集数据: (1) 部署总时长和轨迹; (2) work w/o intervention; (3) IMP 传感器数据
- 改进方案: WANS模块调整/改进; IMP调整和改进
预期: 完善系统功能, 总结实地部署经验

stage 4: 中长期部署, 多地形实验, 总结经验和开源工作.


# 5. Timeline & Milestones



# 6. Expected Contributions 

- deeply validated, field-tested contributions published in venues that value real-world rigor (Science Robotics, IJRR, Field Robotics)

output 是 deployments + open artifacts + field-style papers
field-focused PhD on legged robots for environmental monitoring
long-term field deployments, open-source artifacts, lessons-learned methodology, collaboration with ecology groups

Target: Field Robotics, IJRR, Science Robotics Research Resources)

# 7. Resources & Collaborations
- Robohike resources:
  - Robots: Unitree Go2, Go2-w, B2 (pending), A2 (pending)
  - Sensors: Lidar, Camera
  - Edge Computing: Jetson Series, Intel NUC Series.
  - Others: Network, Batterery
- Ecology collaborators
- Field Sites:
  - Wytham, Alice Holt, etc. (需要确认)


# 8. References

