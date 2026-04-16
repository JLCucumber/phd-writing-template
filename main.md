---
title: "Long-Term Autonomous Navigation for Legged Robots in Wild Environments"
subtitle: "UCL Computer Science MPhil/PhD Application"
author: "Your Name"
date: "April 2026"
bibliography: [refs.bib]
csl: ieee.csl
---

## 1. Research Question

How can legged robots achieve robust, persistent autonomous navigation in wild, unstructured environments over extended deployment periods — adapting to changing terrain, degraded perception conditions, and the diversity of real outdoor settings that no simulation fully captures?


## 2. Background and Motivation

Legged robots have demonstrated impressive mobility in laboratory settings and short-duration field tests. Yet the gap between a controlled demonstration and a robot that can operate reliably in a forest for six hours — adapting to seasonal undergrowth, recovering from sensor occlusion, re-planning when the terrain it mapped at dawn looks different at dusk — remains large and largely unaddressed as a unified research problem.

This gap matters. A legged robot that can navigate wild environments over long durations without human intervention would unlock applications ranging from autonomous forest inventory [@mattamala2025building] and volcanic gas monitoring [@richter2026largescale] to disaster relief, infrastructure inspection [@staniaszek2025autoinspect], and eventually ecological field science. What currently stands in the way is not locomotion — quadruped locomotion has advanced dramatically through learning-based methods [@miki2022learning] — but autonomous navigation: the ability to perceive, plan, and adapt in environments that are semantically complex, dynamically changing, and radically underrepresented in any training distribution.

Three interlocking problems define the frontier:

**Traversability in complex vegetation.** Standard geometric or semantic traversability estimators, trained on curated datasets or in simulation, degrade significantly in dense, varying vegetation. Point clouds are sparse; visual features are cluttered; the boundary between passable and impassable terrain is ambiguous and context-dependent.

**Adaptation to environmental change.** Wild environments change over hours (lighting, shadows, weather) and seasons (vegetation density, ground conditions). A navigation system that cannot update its world model online will accumulate errors and eventually fail on any mission longer than its training distribution covers.

**Sim-to-real transfer at scale.** Simulation remains the primary training substrate for learned navigation components, but the domain gap between even high-fidelity simulators (Isaac Sim, Gazebo) and real forests is substantial. Methods that close this gap without requiring expensive real-world data collection at scale are a prerequisite for practical deployment.

Recent work has addressed each of these challenges in isolation. Wild Visual Navigation [@mattamala2024wild] shows that pre-trained vision models can be used as self-supervised traversability priors, enabling fast generalisation to new terrain without labelled data. The CERBERUS team [@tranzatto2022team] demonstrated long-duration autonomous operation in subterranean environments through careful systems integration and robust state estimation. Open-vocabulary navigation approaches [@peng2025lovon] show that language-grounded models can direct robot navigation without pre-built maps. No work yet unifies these threads into a framework explicitly targeting long-term, adaptive, legged robot autonomy in wild outdoor environments.


## 3. Research Objectives

This PhD proposes to address the core barriers to long-term wild-environment autonomy through four focused research objectives:

**Objective 1: Robust and adaptive traversability estimation for wild terrain.**
Develop a traversability estimation framework that remains reliable in dense vegetation, under varying lighting and weather, and across seasonal change. The approach will build on self-supervised learning from pre-trained visual representations (extending Wild Visual Navigation [@mattamala2024wild]), combined with online adaptation mechanisms that update the traversability model during deployment without requiring  labelled data or human intervention. The existing ViPlanner-based system on the RoboHike platform will serve as the starting baseline.

**Objective 2: Online and continual learning for navigation in changing environments.**
Investigate methods for online adaptation of navigation-relevant models (traversability, semantic segmentation, local planning) during deployment. This includes continual learning approaches that mitigate catastrophic forgetting, and self-supervised update mechanisms triggered by prediction inconsistencies or environment change detection. The goal is a navigation system that improves with deployment time rather than degrading.

**Objective 3: Sim-to-real transfer via foundation model priors.**
Develop and evaluate methods for bridging the simulation-to-reality gap in wild-environment navigation, leveraging large-scale vision-language models as domain-invariant priors. The hypothesis is that semantic features extracted by models trained on internet-scale data are more domain-invariant than low-level sensor features, and can serve as a stable representation backbone that reduces the sim-to-real gap for downstream navigation tasks. 

**Objective 4: Long-duration field deployment and evaluation.**
Validate the integrated system through field deployments of progressively increasing duration and complexity — from multi-hour missions in grassland and vineyard settings (available through RoboHike), to deployment in denser forest environments. Define and contribute evaluation metrics for long-term autonomy that go beyond success rate in short episodes: mission completion over time, adaptation rate, and failure recovery. Community benchmarks in this area remain underdeveloped [@icra2026lowi].


## 4. Proposed Methodology

The research will follow an integrated development approach in three phases:

**Phase 1 (Year 1): Baseline, benchmarks, and traversability.**
Consolidate the existing ViPlanner-based system into a reproducible baseline. Conduct systematic outdoor experiments (grassland, vineyard, light forest) to characterise current failure modes with structured metrics. Develop the first iteration of the adaptive traversability estimator (Objective 1). Build high-fidelity Isaac Sim environments representative of target wild settings, initiating the sim-to-real research thread.

**Phase 2 (Years 2–3): Adaptation, transfer, and integration.**
Address Objectives 2 and 3 in parallel. Implement and evaluate continual learning mechanisms for online model adaptation. Develop the foundation model prior approach for sim-to-real transfer, with systematic ablations across environment types and conditions. Integrate all components into a unified navigation stack and evaluate on Unitree Go2 hardware across increasingly challenging outdoor settings.

**Phase 3 (Years 3–4): Long-duration field trials and dissemination.**
Conduct long-duration field deployments (Objective 4). Iterate on identified failure modes. Contribute datasets, benchmarks, and open-source code to the community. Write up and submit thesis.

The research will be grounded throughout in real hardware — the Unitree Go2 platforms and sensor suite (Livox Mid360 LiDAR, depth cameras) already in use on the RoboHike project — avoiding the common pitfall of learned navigation work that never leaves simulation.


## 5. Expected Contributions

1. A traversability estimation framework for wild terrain that adapts online during deployment, with demonstrated robustness across vegetation type, lighting, and seasonal variation.

2. A continual learning approach for navigation-relevant models that enables improvement through deployment without catastrophic forgetting or human annotation.

3. A sim-to-real transfer method leveraging foundation model representations, with evaluation on wild outdoor navigation tasks.

4. A field evaluation protocol and dataset for long-term legged robot autonomy in wild environments, filling a gap in existing benchmarks that focus on short-episode tasks.

5. An integrated, open-source navigation system validated through multi-hour autonomous missions on a real quadruped in outdoor environments.


## 6. Preliminary Work

The candidate brings significant relevant preliminary work:

- Two peer-reviewed papers accepted at RiTA 2025: vision-based multi-skill agile locomotion (MSc thesis, advantage-weighted policy distillation) and simulation debugging for a novel closed-loop bipedal robot (Isaac Sim topology analysis).
- One year of Research Assistant experience on the RoboHike project (UKRI-funded), including outdoor navigation experiments, traversability engineering, and development of the ViPlanner-based visual-semantic local planner.
- Familiarity with the full navigation stack: state estimation (FASTLIO), terrain analysis, local planning, and path following on a real legged robot platform.
- Simulation expertise across Isaac Gym, Isaac Sim, and Isaac Lab.

@dunbabin2012robots

## 7. Timeline

| Period   | Focus                                                               |
|----------|---------------------------------------------------------------------|
| Year 1   | Baseline consolidation; traversability dataset; Obj. 1 first iter. |
| Year 2   | Continual learning (Obj. 2); sim-to-real (Obj. 3); publications    |
| Year 3   | Integration; extended field trials; conference publications         |
| Year 4   | Long-duration deployments; benchmarks; thesis writing               |


## References
