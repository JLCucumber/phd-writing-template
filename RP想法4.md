这是我摘出来的 forest inventory 的 disucussion



Mattamala2025forest 

Coverage 1ha in 20min (3ha per hour) 

Mixed forests over summer season – damp and cluttered. And dense undergrouwth 

We need newer platforms such as Unitree B2 

State Estimation is good than I expected 

They used LiDAR and inertial sensing in the forest 

"robust estimates for closed-loop operation of legged platforms in forests" 

LiDAR and Inertial is fair enough for state estimation!!! 

But introducing more modalities can help improve the navigation performance --- in agreement with viplanner & miki2026 --- semantic and FM-based common sense helps the navigation  

文章指出 building multi-modal scene representations 是未来研究中一个非常重要的一步 

文章指出户外导航中用上 modality:semantics 和 modality:traversability 等 modality 对于 scene representation 和 navigation performance 都很有帮助 

加入 perception:vision 也会帮忙 

确实,而且可能超乎他们当时的预想, 比如 VLM-based  --- miki2026  

自主性方面 

他们用的还是 modular 的方式, 把系统拆分成 mission planning, local planning, locomotion 三个部分. "we aimed for a system where the modules interacted with each other to adapt under different situations" 

"local planner is the main module for improvement 

作者的说法是 Local planner 没有办法区分一些"不可行"的 waypoint, 而且也看不到一些前方的问题 

我觉得这其实是暴露了当前导航系统的两个巨大限制.  

野外自主导航系统一定需要多模态的scene representation  

单一模态(基于几何信息) 会严重限制在野外自主长期部署.  

我们必须至少要引入 semantic 信息来让我们的导航系统理解环境 

而且要在 traversability 那里做丰富地形的分析 -- 不能再简单搞什么 geometic-based 甚至是 0/1 分类了 

Perception Hardware Limits the Observation Space 

Lidar is too sparce, we need depth camera 

We need many depth camera (miki 2026) --- (do we?) 

These fcking sensors are fundamental for the system to build a reliable fcking local map. 

在我看来的解决思路应该是三个流 

一个是Multi-model Scene Representation. 让更丰富的模态在导航系统里流转起来 -- segmentation, traversability, steppable 等等.  

一个是引入 FM 作为 high-level scene common sense encoder. FM 作为系统中负责用common sense 来理解和编译场景信息的最高层模块 然后用权重和语义标签指导下游系统配合运行, 然后实现一个整个系统 common sense 的这样一个水平. 

最后一个是充足的硬件基础. 我到底需要啥传感器, 多少相机, 才能有一个靠谱的地图?  

Forest Usecase 方面 

The use of legged robots in this problems has not been widely explored --- 哪怕这种 "potential advantage" 已经被讨论了超过 40年了 (lol 

现在的时机已经成熟了 --- "we confirmed that current quadruped platforms could positively contribute to forestry tasks" "we forsee them as a complement to current under-canopy drones to map new forest plots, but also as monitoring platforms that could re-visit existing inventories and acquire longituinal data during day and night." 

The main limiting factor for its adoption might actually be the current cost of these platforms, which is currently comparable to TLS devices 

Continuous biodiversity monitoring is another avenue for future research 

A deeper investigation and assessment of the independent systems should be the next step to overcome the challenges we have raised so far.  "by changing the environment for each trail, we could identify new challenges for the different components of the system." 

作者建议应该直接把场所选择在  dense undergrowth -- 这种场景非常重要 

这种场景中的测试才会真正 raise new perception and mobility research 

也只有在这种场景中才能真正挖掘出 legged-platform 作为 monitoring system 的真正应用场景和真正的价值 

"this environments raise the most important questions for new perception and mobility research, and use cases where a terrestrial legged robot would be preferable to deploy" 

How to evaluate complex autonomous systems remains an open question for future research. 

A comprehensive example of longitudinal assessment (Bajracharya-Demonstrating mobile manipulation in the wild: A metrics-driven approach, RSS, 2024) 

这个工作里面作者们主要是评估了在这种环境里面的自主导航表现 

但是如果能够设计更细致的指标来对比 legged platform, aerial platform, wheeled terrestrial robots, human-carreid MLS and static TLS scanning in terms of coverage and scanning time, along with environmental impact (e.g. soild damage) and usability metrics. This is a challenge that requires further work in closer collaboration with foresters and environmental scientists. 


---

另外再一个我的想法:

就是很多人现在都在说 legged robot 未来能干啥能干啥, 但是没有人看见有多少人真的在做这些方面--- 这就是我想做这个领域的一个原因 --- 我本人对 legged robot  这个形态很专一, 我就是单纯想让它在很多地方出现, 证明它能够做出来大家幻想或者想象里能做到的一些事情  --- 就比如森林环境监测. 然后现在也有前人的工作在做这个方面, 我觉得可以继续往下讨论. 森林环境应该是 legged 在陆地上最难但也是最有发挥价值和潜力的空间的地方,  而有全英国有机器人资源和经济基础去做这种 research 的机会非常少, 既然我在这个位置上了, 我的想法和这个机会又是一致的, 我就觉得我应该做点什么.

---

第一步的关注点在 腿足式 野外自主导航系统 上

要开发一个好的野外环境自主导航系统是一个极具难度的事情, 相比起单一模块, 这个任务更看重整个系统在复杂多变环境中长期运行的性能, 这需要研究者对系统高层设计和各模块 (global & local planner, terrain traversability, environment understanding, state estimation, 甚至 locomotion 等) 的具体实现都提出了要求, 这是一个对工程能力要求很强的研究任务

之所以依然称其为是"研究", 是因为当前基于腿足式平台研究野外环境长期自主导航的工作并不多. 野外自主导航系统本身开发和测试的复杂度和周期都很高很长, 而且腿足式平台和传感器硬件价格昂贵, 实地测试的运输和协商成本高昂 -- 种种因素叠加限制了广大研究者对这个研究的深入. 虽然现在涌现了一些相关的工作 (比如在森林地带或者火山附近的监测任务), 但是整体上还是在 lesson learned 阶段 -- 给后面的研究工作提供经验和指导 -- 这侧面反映了当前这个领域还是处在 "under explored" 的状态. 而且由于大多数工作都是基于 ANYmal, SPOT 这种价格高昂和传感单元和计算模块非常顶配的系统, 加上大部分工作没有开源框架, 在其他腿足式平台上想在同等时间和空间量级上复现的难度非常高. 因此, 我们希望基于已有工作的重要贡献, 探索实现一种具备一定跨平台通用性的野外自主导航系统 (WANS), 目标是证明其在更多机器人平台上的可用性, 而且依赖更精简的传感器规模, 并能够在以森林为主的多种野外常见环境中做到较为鲁棒的自主导航. 系统完成后, 我们将会将系统设计思路和重要实现代码开源, 给该领域贡献更多工具. 

除此之外, 配套的监测技术手段和硬件集成方案还不完善. 尽管 @mattamala2025buildingforestinventories 通过 LiDAR SLAM 实现了对森林的3D点云建模和树木HDB信息收集, 但是同一个区域下对树木高度, 物种类别, 气体和土壤等信息的采集方案依然尚待研究. 而 @richter2026largescaleautonomousgas 通过机载质谱分析仪来采集硫化物气体浓度, 实现了对火山带多区域的实时气体监测, 但是这种依赖高度定制的仪器复制难度较高, 而且适用场景有限. 因此, 为了合适的, 我们需要一个在多种生态环境下常用的,易于制作和部署在多种地面机器人平台上的 集成监测负载 (IMP) , 加上一套对应的系统, 这种贡献将会很大程度上为 autonomous system for environmental monotoring 领域的研究带来贡献.


除此之外, 我们将会专门以森林场景为例, 研究腿足式野外自主导航系统和集成监测负载在该场景中的优势和局限, 并且会不断优化 WANS 系统和 IMP 的设计方案. 并且在这个过程中总结工程经验, 来指导后续领域的相关工作更好的开展和改进. 

