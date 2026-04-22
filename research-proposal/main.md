---
title: "Long-Term Autonomous Navigation for Legged Robots in Wild Environments for Environmental Monitoring"
subtitle: "UCL Computer Science MPhil/PhD Application"
author: "Hongbo Li"
date: "April 2026"
bibliography: [assets/refs.bib]
csl: ieee.csl
---

# 1. Introduction


Autonomous robotic platforms capable of operating for extended periods in wild, unstructured environments would transform how we observe and study the natural world — from habitat mapping and biodiversity survey to volcanic and wetland monitoring. Legged robots, whose mobility on rough and vegetated terrain exceeds that of wheeled or aerial platforms, are particularly well placed to serve this role [@dunbabin2012robotsenvironmentalmonitoringa]. Yet despite recent advances in locomotion [@miki2022learningrobustperceptive] and a growing body of bounded-scope field demonstrations [@tranzatto2022teamcerberuswins; @mattamala2025buildingforestinventories], legged autonomy in the wild still tends to be confined to short missions in favourable conditions; and integrated monitoring deployments that exploit this mobility remain comparatively rare and site-specific. Moreover, the monitoring payloads used in existing deployments are typically purpose-built for narrow sensing goals (e.g. tree DBH [@mattamala2025buildingforestinventories], gas sensing [@richter2026largescaleautonomousgas])—an integrated, reusable, cross-platform monitoring payload design for legged robots remains absent

This PhD investigates long-term autonomous navigation of legged robots in wild environments, framed around environmental monitoring as the driving application. The underlying thesis is pragmatic: progress on this problem is currently bounded less by any single algorithmic gap than by the *systems-level engineering and integration* required to turn short demonstrations into sustained, generalisable field capability, and to organise that capability into monitoring deployments whose design is informed by the needs of environmental science. A field-grounded treatment of both the navigation stack and the monitoring-system design space is needed to move beyond isolated success stories. The research takes UK temperate woodland as its primary field context, where dense undergrowth, seasonal variability, and existing ecological monitoring infrastructure provide both technical challenges and ecological relevance

## Research Objectives

**RO1: Develop a Wild Autonomous Navigation System (WANS) for Long-Term Operation on Cost-Controlled Quadruped Platforms**

- *RO1.1* Design and implement the system. 
- *RO1.2* Evaluate in progressively challenging outdoor/forest scenarios.
- *RO1.3* Characterize failure modes and operational constraints through repeated deployment.

**RO2. Develop an Integrated Monitoring Payload (IMP) for Quadruped-Based Environmental Monitoring.**

- *RO2.1* Design a modular, reproducible IMP combining multiple sensing modalities (mapping, atmospheric, soil).
- *RO2.2* Integrate IMP with WANS and validate in UK temperate woodland.
- *RO2.3* Release IMP design and deployment protocols as open-source contributions

**RO3: Contribute Community-Usable Knowledge, Artifacts, and Data from Wild Legged-Robot Deployment**

- *RO3.1* Lessons-learned synthesis: integrate deployment experience with prior-work lessons into a structured reference (failure taxonomies, design decisions, operational protocols).
- *RO3.2* Open-source artifacts: release IMP hardware design, portable WANS components, and deployment tooling.
- *RO3.3* Deployment dataset (conditional on deployment scope and data quality): release a longitudinal UK woodland dataset covering sensor streams, robot telemetry, and monitoring payload readings, to support reproducible evaluation of wild navigation.

# 2. Literature Review


## 2.1 Quadruped robotics and autonomous navigation in unstructured wild environments

Recent work has advanced legged locomotion in rough terrain [@miki2022learningrobustperceptive] and learned traversability in natural environments [@mattamala2024wildvisualnavigation]. Field deployments have demonstrated autonomous forest inventory [@mattamala2025buildingforestinventories] and volcanic gas monitoring [@richter2026largescaleautonomousgas]. However, these rely on high-cost ANYmal or Spot platforms, and long-duration operation on cost-controlled quadrupeds remains underexplored. This gap is the focus of RO1. 

## 2.2 Long-term autonomous field deployment

Existing monitoring payloads for field robots tend to be purpose-built for single sensing targets—examples include LiDAR-based forest structure mapping [@mattamala2025buildingforestinventories] and mass spectrometers for volcanic gas sensing [@richter2026largescaleautonomousgas]. The foundational framing of robots for environmental monitoring [@dunbabin2012robotsenvironmentalmonitoringa] predates recent advances in learning-based locomotion, vision foundation models, and mobile LiDAR SLAM, and provides limited insight of payload integration for legged platforms. As a result, there is no established design for a modular, reusable monitoring payload that combines multiple sensing modalities (e.g., mapping, atmospheric, soil) and can be deployed across different legged platforms without per-deployment customization. Addressing this gap is the focus of RO2.

## 2.3 Autonomous systems for environmental monitoring

Evaluating long-term autonomous operation in wild environments remains an open problem [@mattamala2025buildingforestinventories]. Structured settings have developed evaluation practices—subterranean autonomy benchmarked through the DARPA SubT Challenge [@tranzatto2022teamcerberuswins], industrial long-term autonomy tracked via intervention rates and uptime [@staniaszek2025autoinspectlongtermautonomous]—but no equivalent framework exists for repeated, long-duration deployment in unstructured wild environments. Community-level recognition of this gap is reflected in recent venues such as the ICRA 2026 LOWI workshop [@icra2026workshoplowi]. Moreover, systematic synthesis of field deployment experience remains rare: lessons are typically scattered across per-paper discussion sections rather than organized into community-usable references, with @melo2023animalrobotsafrica standing as a notable exception. Addressing this evaluation and synthesis gap—through framework development, structured lessons, and benchmark release—is the focus of RO3.

# 3. Proposed Methodology

Building on the literature above, this PhD is oriented around the question:

> **How can long-term autonomous navigation of legged robots in wild environments be engineered to support integrated environmental-monitoring deployment on cost-controlled platforms?**

The methodology is organised into three technical workstreams, each linked to one or more research objectives: (3.1) Wild Autonomous Navigation System (WANS) Development; (3.2) Integrated Monitoring Payload (IMP) Development; (3.3) Field Deployment, Lessons Synthesis, and Open Artifacts.

## 3.1 WANS Development

### 3.1.1 Platform and Hardware Setup

Hardware is selected to demonstrate that WANS capability can be built on cost-controlled quadrupeds, contrasting with the ANYmal/Spot-class platforms used in most current wild deployments

**List of Hardware**
- Robot platform: Unitree Go2 / Go2-W / B2 (pending) / A2 (pending)
- Sensor Configuration: LiDAR (Livox Mid360 or equivalent) + 1~2 RGB-D Cameras (RealSense D435i or equivalent), GNSS.
- Computation: Jetson Orin AGX / Intel NUC
- Others: Network Router, HDMI wireless video transmitter,  

Unitree Series is commonly indentified mid-tire platform for cost-controlled experiements; LiDAR, cameras and GNSS are fundamental sensors for perception, localization and mapping; Jetson and Intel provides external computation for running SLAM or Semantic Segmentation. Router and HDMI wireless video transmitter provides network access and remote control over edge computers.


### 3.1.2 System Architecture

Rather than proposing a new algorithmic stack, the WANS integrates existing components into a system designed for roboust wild operation. Perception inputs (LiDAR, RGB-D camera, IMU) feed two parallel streams: FAST-LIO2 performs state estimation and tf transformation, while VLM-guided open-vocabulary semantic segmentation produces scene understanding used for local map annotation. The resulting local map (elevation map with semantic overlay) drives the local planner, which issues velocity commands executed by a learning-based locomotion policy (e.g., the stock Unitree controller). 

![Figure 1: System architecture of the proposed WANS.](image-2.png){#fig:wans-arch width=100%}

Evaluation of the integrated WANS is described in Section 3.3.1.

## 3.2 IMP Development

### 3.2.1 Modular Payload Design

The IMP is scoped around three sensing modules: 
1.  mapping and detection, using LiDAR and RGB cameras (mounted on a dedicated sensor bar distinct from the chemical-sensing modules); 
2.  atmospheric monitoring, using a compact gas-sensor array for gases and ambient conditions such as CO2, particulate matter, temperature, and humidity; 
3.  soil and substrate monitoring, using soil probes for moisture, conductivity, temperature, and pH. 

These three modalities are considered as the principal dimensions most relevant to woodland deployments. Other modalities, such as acoustic or hyperspectral sensing, are important but are treated as out of scope for the initial IMP, since they introduce additional payload, calibration, power, and interpretation complexity that would distract from the core objective of establishing a reproducible and deployable baseline payload.


### 3.2.2 Integration with WANS
- **Mechanical Layer**: each sensing unit is designed as a separable module with standardised mounting, power, and data interfaces, so that modules can be replaced without redesigning the entire payload stack. 3D-print structural supports to secure the IMP to the back of the quadruped platform, ensuring the total weight remains under 5 kg.    
- **Software Layer**: all modules expose a standardised ROS 2 interface contract, including sensor outputs, timestamps, frame definitions, calibration metadata, and health-status reporting, so that they can be logged, synchronised, and integrated consistently within the WANS
- **IMP-WANS Coordination**: the IMP collection period may require the WANS to behave accordingly. For instance, the robot needs to stop and insert soil probe, and slow down near detection zone at gas collection.

To ensure reproducibility, the IMP will be documented through open-source CAD files, bills of materials, interface specifications, and integration protocols, so that the payload can be replicated, adapted, and extended by other researchers.


## 3.3 Evaluation and Synthesis


### 3.3.1 Real-World Deployment

**Level 1: Urban Semi-structured outdoor** -- e.g. UCL East and urban grassland. This level establishes the baseline system in an outdoor setting, where terrain variation, vegetation clutter, and perception ambiguity are limited, allowing early failures to be analysed and attributed to system integration and basic autonomy issues.

**Level 2: Wild Semi-structured outdoor** — e.g. open woodland or hill with relatively clear hiking paths. This level transits into genuinely wild environments, where canopy effects, irregular terrain, and natural visual clutter begin to challenge perception, localization and local planning. But path structure can still support progressive system debugging.

**Level 3: Dense forest** — e.g. UK temperate broadleaf woodland with dense undergrowth. This level is the target deployment scenario for RO1, where path structure maybe absent, vegetation can confuse geometric perception, and challenges system robustness against complex field conditions.
 
WANS and IMP are developed and tested independently during the early phase (Levels 1~2), then integrated and evaluated jointly under Level 3 conditions where dense undergrowth and unstructred terrain challenge both subsystems.  

<!-- During the deployment, we will develop a structured log for the system performances (e.g. human intervention frequency, sustained deployment duration, validity of collected data on IMP), failures modes, and decisions on technical changes.   -->
Each deployment produces a structured log, capturing performance metrics (human intervention frequency, mission duration, IMP data validity), failure modes, and technical changes made. These logs serve as raw material for the synthesis described in Section 3.3.2.

### 3.3.2 Lessons Capture, Artifact Release, and Dataset Contribution

**(a) Lessons-learned synthesis** [describes RO3.1 work]

A field-experience synthesis that integrates the deployment lessons from own and prior work into a structured community reference. This includes failure taxonomies, design-decision records, operational protocols, and a set of proposed evaluation metrics grounded in deployment practice. It is intended to accelerate subsequent field work in legged-robot wild deployments.

**(b) Open-source artifacts** [describes RO3.2 work]  

Open-source release of system artifacts validated through this research: (a) the Integrated Monitoring Payload design (CAD, BOM, firmware, ROS 2 interfaces) and (b) WANS components demonstrated to be portable across the evaluated platforms.


**(c) Longitudinal deployment dataset** [describes RO3.3 work, with conditional framing]

Subject to deployment scope and data quality, a longitudinal dataset will be released convering: LiDAR point clouds, RGB-D streams, IMU and GNSS; WANS intermediate outputs (elevation maps, semantic segmentations, local plans); IMP sensor readings (gas,soil, T/H); and robot state (joint angles, torques). The dataset will be annotated with deployment outcomes and failure events. 

This dataset is intended to support reproducible evaluation of wild navigation algorithms in under-canopy, seasonal-variation contexts not well covered by existing datasets, which could serve as (1) SLAM/navigation benchmark for legged wild navigation (legged platform dynamics, dense undergrowth scenes, seasonal variation); (2) Traversability or semantic learning data (UK forest domain specific); (3) monitoring data from IMP for environmental analysis; (4) Failure mode documentation. 

Both lessons-learned capture and dataset preparation require disciplined data and metadata collection from the first deployment onward; these practices are established in Year 1 as part of the deployment protocol


# 4. Expected Contributions

This research is expected to deliver contributions at three levels:

**System contributions.** 
- (1) A Wild Autonomous Navigation System (WANS) designed for cost-controlled 
quadruped platforms, validated through progressive deployment across urban, 
semi-structured outdoor, and dense-forest scenarios. 
- (2) An Integrated Monitoring Payload (IMP) with modular hardware design and 
standardised software interfaces, suitable for replication across quadruped platforms.

**Empirical contributions.** 
- (1) Repeated deployment evidence characterising the failure modes, operational 
constraints, and design tradeoffs of long-duration legged autonomy in UK 
temperate woodland.
- (2) **Community knowledge contributions.** A field-experience synthesis integrating 
deployment lessons from this work with prior-work lessons, producing a structured reference 
for subsequent field research.

**Open artifacts.** 
- (1) Open-source IMP hardware design (CAD, BOM, firmware), portable WANS components, 
and—subject to deployment scope and data quality—a longitudinal UK woodland 
deployment dataset.

# 5. Research Plan

| Year | WANS (RO1) | IMP (RO2) | Synthesis & Release (RO3) |
|------|------------|-----------|----------------------------|
| **Y1** | Platform setup; module integration; Level 1-2 deployments | — (scoping only) | Deployment logging protocol established |
| **Y2** | Seasonal Level 2 campaigns; Level 3 pilot deployments | IMP v1 development and bench validation (H2) | Interim lessons captured |
| **Y3** | System iteration from field lessons | IMP-WANS integration; paired deployments | Interim dataset curation; synthesis drafting |
| **Y4** | Final deployment wave | IMP release (CAD, BOM, interfaces) | Lessons synthesis paper; dataset release; thesis |



# References
