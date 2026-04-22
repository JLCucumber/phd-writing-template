---
title: "UCL CS MPhil/PhD Personal Statement"  # only PhD 
subtitle: "UCL Computer Science MPhil/PhD Application" # only PhD
author: "Hongbo Li"
date: "April 2026"
bibliography: [assets/refs.bib]
csl: assets/ieee.csl
---
<!-- Target: UCL Computer Science 4-Year MPhil/PhD (open application) -->
<!-- Format: upload as supplementary PDF -- no character limit -->
<!-- Forbidden (if pasting anywhere): " (double quotes), & (ampersand), non-standard/accented chars -->


## Academic Background and Motivation

My path to this PhD application is grounded in a clear research trajectory: from learning how
legged robots move, to asking whether they can survive and operate reliably in the world outside
controlled settings. 
<!-- "to asking whether they can survive" 表达有点奇怪. 这里表达出长期在户外自主导航 -->

During my MSc in Robotics and Artificial Intelligence at UCL, I studied legged locomotion
through reinforcement learning, training quadruped robots in simulation and investigating their
transfer to real terrain. I graduated with Distinction. Immediately after, I joined the
UKRI-funded RoboHike project as a Research Assistant, deploying legged robots in natural outdoor
environments. 

This shift from simulation to the field was decisive. (我改到这里了) A field test in a vineyard made the challenge concrete. Our robot, capable of navigating
indoor corridors reliably, failed consistently in dense vegetation: point clouds were sparse,
traversability estimates broke down, and the planner stalled at boundaries that would be trivial
for a human. The environment was not malfunctioning -- it was simply behaving as natural
environments do. This reframed my research question: not how to make robots move efficiently in
abstract environments, but how to make them operate robustly and persistently in the real,
uncontrolled world.  
<!-- 这个落脚点没问题! -->



## The Problem I Want to Solve

<!-- 我在想这里要不要加入一点引用来作证我的一些论点 -->

Long-term autonomous deployment of legged robots in wild, unstructured environments -- forests,
grasslands, volcanic terrain, disaster sites -- is a fundamentally unsolved engineering challenge. (unsolved 还是尚不成熟?)
Individual capabilities exist in isolation (这里放引用会更好!): SLAM in structured settings (移动机器人小车室内导航), traversability estimation
on open ground, short-duration navigation in controlled tests, (再加一个 -- 长距离但是 tele-operated (并非自主导航, e.g. learning perceptive locomotion 2022 年ETH的那个)). But sustained, adaptive autonomy in environments that change over hours, seasons, and conditions remains elusive.

<!-- 实际上这两年已经有一些工作是在做长时间长距离户外导航了, 比如 oxford, ETH 的一些在 forest, mountain, 甚至volcano. 但是他们各自都有局限性-->
<!-- 另外 agricultural robotics 可能是另外一条线 --- 我需要去了解一下 --- 我需要知道有什么子问题是已经被其他人解决了的 --- 这样我可以拿过来用 -->

根据我目前已经浅显看到的了解, 我需要从两个角度分析和思考我的这个问题 --- 

(1) 拆分细化,分而治之的视角(自下而上): 

哪些子问题已经有了成熟的解决方案? ---  那么就肯定有很多子问题是已经被解决了的 --- 哪怕是在局部场景, 控制了某些变量以后解决了的, 这至少说明它能够被证明有用, 只不过我需要去拿过来测试 (fill the gap). 搞明白这些问题可以让我更好地脚踏实地地明白如何利用现有的轮子和积木来搭建一个我想要的系统, 或者, 让我明白我想要的系统除了现在的这些工具之外, 还缺少什么东西. 换句话说, 如果我可以成熟地做好这一步, 应该就会有一个"表格"形成在我的脑子里, 在这个基础之上, 我才能更聪明地分析我应该怎么设计和优化我的这个系统 --- 而不是漫无目的地尝试;

这个角度主要是为了让我更好地培养 "build" 东西的能力 -- 一个好的 builder 不用必须也是个好的 designer, 但是他肯定非常熟悉自己的工具, 无论任何一个设计师送过来的图纸, 他都知道应该怎么去用现有的工具去"build".

(2) hold住总目标, 分析那些更为系统和针对性的工作的视角(自上而下): 

现在我们不要拘泥于林林总总的子问题和各种工具 --- 我们的最终景愿是什么? --- 是 Long-term Wild Deployment 对吧?

那么我们现在倒着来 --- 相对于这个遥远的目标, 现在肯定已经有了很多比我有才华很多的工作者们做出了一些工作 --- @mattamala2025buildingforestinventories, [@richter2026largescaleautonomousgas] --- 这些工作的各自的长处是什么, 但是局限是什么, 共同的局限在哪里? --- 这些局限甚至可能不需要详细到某个模块的技术短板, 而是可能大概率上你在很多即便是当下最好的工作中还是会找出的共同的问题 --- 比如都是基于 anymal 的平台, 然后都需要一个非常专门定制的而且很重的硬件集成平台 (可能包含了很多相机和雷达, 也需要一个很大的电池) 都是预定 global 轨迹加上 local planner. 除了这些之外, 目前的室外场景难度还可以进一步提升 --- [@richter2026largescaleautonomousgas] 的工作 都是在开阔地带, 虽然有一定起伏但局部都是相对平坦的地表, 而且周围视野开阔




The failure modes are well-characterised: perception degrades in dense vegetation and adverse
lighting; maps built in one season become unreliable in another; models trained in simulation
perform poorly on real terrain; and error accumulation makes sustained operation impractical
beyond short demonstrations. These are not peripheral issues -- they are the core barriers
preventing legged robots from being genuinely useful outside laboratories.

I want to work on this problem directly. The questions I find most compelling are: how can
traversability estimation remain reliable in semantically complex and changing terrain? How can
navigation systems adapt online to environments they were not explicitly trained for? How can
simulation-trained models transfer robustly to the diversity of real wild environments? And how
can large-scale vision-language models serve as grounding priors for navigation decisions in
settings where no explicit map or labelled data exists?

These questions are reflected in work I find technically inspiring: Wild Visual Navigation
demonstrates fast, self-supervised traversability learning via pre-trained models that generalises
across terrain types; the CERBERUS team showed what genuine long-duration autonomy requires in
the subterranean domain; Autonomous Forest Inventory and AutoInspect point toward what a truly
deployed, field-operational legged robot system looks like. What unites these works is an
engineering-first conviction: that closing the gap between laboratory demonstration and
real-world deployment is both the hardest and the most consequential problem in mobile robotics.
That is the conviction I bring to this application.


## Research Experience and Credentials

My technical preparation combines published research, hands-on fieldwork, and active development
of relevant systems.

At RiTA 2025, I had two papers accepted. The first, from my MSc thesis, addresses vision-based
multi-skill agile locomotion for legged robots. I introduced an advantage-weighted policy
distillation mechanism that improves the success rate of a student policy learning multiple
high-difficulty motions from teacher demonstrations -- a problem at the boundary of learning
efficiency and deployment reliability. The second paper addresses the simulation of a novel
closed-loop bipedal robot in Isaac Sim: by constructing a topological diagram of over seventy
leg joints, I identified and resolved redundant kinematic constraints causing severe instability,
enabling a robot that had been effectively un-simulatable to be trained and evaluated.

As an RA on RoboHike, I conduct outdoor experiments on Unitree Go2 platforms in grassland and
vineyard settings, directly confronting the traversability and perception failures I described
above. My responses have included adjusting traversability thresholds for tall grass, applying
point-cloud preprocessing to improve structural density for vegetation obstacles, and developing
a visual-semantic local planner (ViPlanner-based) that integrates depth sensing with Mask2Former
segmentation. This work sits at the intersection of perception, learning, and robot navigation
in unstructured environments -- precisely the territory I want to pursue at PhD level.

My broader toolkit covers multi-GPU distributed training over wide-area networks, Isaac
Sim/Gym/Lab simulation pipelines, and edge compute deployment on Jetson Orin and Intel NUC.
I have hands-on experience with depth cameras, LiDAR (Livox Mid360), thermal cameras, and
event cameras -- relevant to the sensor diversity required for robust long-term field operation.


## Career Objectives and Non-Academic Profile

My long-term goal is to work as a researcher building autonomous systems that are genuinely
engineered for the real world -- reliable, adaptive, and deployable outside of controlled
conditions. In the further future, I am drawn to the application of such systems to ecological
and environmental work: once legged robots can navigate wild environments persistently and
robustly, they become powerful tools for conservation, biodiversity monitoring, and field science
in terrain that is inaccessible or unsafe for repeated human survey. But that vision depends on
first solving the engineering problem, which is where I intend to spend my PhD.

At RiTA 2025 I served as Session Chair for the Bioinspired Robotics track, coordinating speakers,
managing timing, and facilitating discussion -- my first formal service role in the academic
community, alongside oral and poster presentations at the same conference. I hold a National
Second Prize in the Undergraduate Mathematical Contest in Modelling, demonstrating the ability
to work rigorously across unfamiliar technical domains under strict time constraints. Outside
research, I directed and performed in a full-scale production of Hamilton and served as Vice
President of the university Tennis Club, both requiring sustained coordination of large teams
over extended periods.


## Research Interests at UCL CS

At UCL CS, I am particularly interested in research on robust and adaptive perception and
navigation for legged robots operating over long durations in wild environments. The specific
directions I want to pursue -- continual learning for terrain adaptation, traversability
estimation in complex vegetation, sim-to-real transfer, and foundation model integration for
open-vocabulary navigation -- are active research fronts where I believe I can contribute
meaningfully, building directly on my current RA work and published results.

UCL CS provides the research environment, the hardware infrastructure through the RoboHike
project, and the depth in robot learning and autonomous systems that this work demands. I look
forward to identifying a supervisor whose research engages directly with long-term autonomy and
wild-environment robotics, and to contributing to that agenda over the course of a PhD.
