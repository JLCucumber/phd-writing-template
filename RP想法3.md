
1. personal statement 用 pdf 上传。排版的方式你可以直接复用 research-proposal 的这个格式。 提醒一下 personal statement 和 research proposal 两份文件的侧重点应该是不同的。
2. 我认为首要和重点主题是关于机器人长期野外导航（long-term wild navigation），解决各种技术难题，并且对比和总结不同的方法方案。但是我不认为环境监测只是一个花瓶，我认为应该认真思考未来自主无人系统能够怎么样被有效和成体系地运用到环境监测之中，并且为人类和地球生态检测与保护做出一些前瞻性的贡献和思考。
   1. 这个问题一会儿再展开说。
   2. 但是 research proposal 不要加入太多情感化的内容，按照标准的学术和工程来认真看待。
   3. personal statement 适当表达动机和情感，不要过于抒情。 
3. rp 结构按照 introduction - literature review - proposed methodology - expected contribution - appendix (Gantt Chart) - reference 的结构写. 草稿如下
   1. Topic: Legged Long-term Navigation in the Wild for Environmental Monitoring
   2. introduction
      1. 让机器人在多种非结构化环境（从室内和城市场所转换到复杂的野外环境）中实现自主和安全的导航是当前机器人研究领域非常重要的任务。
      2. 简述当前的 research gap。
      3. objectives

   3. literature review
      1. legged robot: from locomotion -> navigation
         1. 这里我想给到的 point 是：（1） 尽管其在高难度 locomotion 任务中取得了巨大的进展，（2） 但是 legged robots 自主导航依然是一个尚待解决的挑战。
      2. autonomous navigation in wild
         1. 这里我想给到的点：（1）首先是给到自主导航主要是哪几个模块，还有现有的主流方法和应用场景大概是啥（室内，平面，结构化等等）（2）然后去讲野外非结构化环境相对于室内或者结构化环境困难在哪些方面（比如植被，比如不规则地形，比如观测不稳定啥的），然后然后再去说这些困难是怎么对这些主流方法构成的挑战的（特别是geometric-based）；（3）最后可以给到一些比较有希望的方法论和工具上（比如 VLM, open-semantic segmentation model, 总体modular但是部分模块端到端），然后意思就是给到听众，这些东西可能会更适合在野外部署， 我可能会用在方法论里面。
      3. long-term field deployment
         1. 这里我想给到的点: (1) 首先就是长期部署和短期部署的最主要的区别和挑战是啥？，（2）然后去盘现在有没有在野外自主导航但是时长比较短工作？给到的意思就是现在的部署还是时长上不去（或者就是算法验证，不考虑工程意义）；回扣一下长期部署的意义和挑战有多么大。（3）然后再给到一些长期自主导航的工作（肯定有），先肯定他们的意义和进步性（比如更近了一步），然后说我们的目标是在什么方面上更加好，特别是点出来要在”更高的高度“，去设计和构建一个更加面向生态和环境监测的长期自主导航系统 -- 就引到后面了。
      4. autonomous systems in Environmental monitoring
         1. 这里我想给到的点：（1）首先是整明白大概意思和前人一些工作（理论&实践都说点），说这些东西都很有价值很有洞见，但是可能某些方面不太行了。。。。（2）反正你最后就是给到这个系统的构建是很重要的，比如时效性--我们就说缺思考新情况下的RAS环境监测工作, 比如太理论--那就说缺硬件集成方案的工程经验贡献，比如太笼统--就说缺贡献基于实地实验和测试的一些评估方案。


   4. proposed methodology
      1. 这里再回扣一下咱们的研究问题是啥 --- 咱们就是要做一个能够在野外长期自主导航的系统，还要基于这个系统，给autonomous system 用于环境监测这个方面做出不管是理论还是工程上的贡献。
      2. 然后就说咱们构想出来的方法论（这里太考验功底了。。。）
         1. 首先是你的那个自主导航系统
            1. 最基本的： 你得把你这个系统里几个层面的东西大概用什么讲清楚吧？
               1. 先是硬件平台吧：啥型号机器狗，啥传感器，啥方案
               2. 然后是软件系统了吧：
                  1. 总思路肯定是模块化了吧
                  2. 最高层肯定是认知和决策层了吧 -- 那就是 VLM 了吧
                  3. 中间层肯定是环境感知和 traversability analysis 了吧 -- 那就是 semantic segmentation 和 elevation map 这种东西了吧， 最后肯定是把传感器信号转成机器人坐标里的点云信息了吧（risk, preferred, steppable）这种了吧。
                  4. 然后下层肯定是 local planner 了吧 -- isaac lab + RL 走起
                  5. 然后底层肯定是 locomotion 了吧 -- isaaclab + RL 走起
               3. 然后你还得说你怎么做长期方案了吧
                  1. 电池咋办， 防水咋办， 网络咋办， 冗余设计要做吗
            2. 然后你也得说你的实地测试和评估方案了吧
               1. 你这个多地形的长期稳定性，自主性和鲁棒性得超大量质性评估一下了吧 -- 什么草地，高地，森林，山地，带个地理位置（英国欧洲哪哪）这种的了吧。
               2. 你这个系统方法的优越性肯定得质性和量化评估一下了吧 -- 什么 environment understanding 模块，traversability 模块， local planning 模块这些 ablation study 这种了吧。 
               3. 它跨平台通用性的价值肯定得质性论证一下吧---换几个平台部署试试吧？
               4. 长期运行稳定性肯定得质性和量化评估一下吧---你肯定有方法间的对比吧？
         2. 然后就是那个 environmental monitoring 方面的贡献了吧？
            1. 首先肯定是你得有点理论贡献吧 -- 你得看看古人文献，和专家交流一下吧？你得想想什么监测最好弄最实际了吧（建图和视觉识别这种了吧）？然后你得想想适合什么自主系统的场景有哪些了吧？然后不同场景可能最需要而且最适合自主平台来做的监测指标是什么了吧（动物植物气体土壤微生物）？然后你得有个理论层面的传感器集成方案了吧（camera lidar 还有什么分析采样仪了吧）。
            2. 然后肯定是你得有点更应用向的贡献了吧 -- 你最好不还是得有个什么硬件设计的demo环节了吧， 你得拿出一个能集成在这种移动平台的监测硬件继承系统然后证明这个玩意的质性和量性可用性了吧。
            3. 最后你肯定得集成两条 stream 做个毕业大demo了吧 --- 你得证明你这个玩意儿能和机器人一起用吧？你得证明你这个数据肯定是有价值的了吧？ 
   5. expected contribution
      1. 最后你不得总结一下你得饼吗
      2. 你肯定最主要的是先给出一个实质性的野外自主导航系统这种贡献了吧
      3. 然后你肯定是需要给环境监测这块儿一个有长期价值（目前没啥用）的一些理论贡献和初步验证了吧



我这个东西会不会太工程了？学术性创新性是啥呀？强工程的phd能叫读博吗

---
1. “Career objectives and non-academic profile”
另外我希望自己未来能够长期呆在一个学术和非学术的交流活动中， 多去交流分享和讨论关于 long-term wild deployment, RAS for environmental monitoring 这类领域的一些工作和进展。 我希望我的未来短期的工作能够让我更好地去一同和有才华的工作者和研究者们一起去建设这个事业和领域。

2. ”3.2 The autonomous navigation system. -A per-module research-question table 18(this is the key academic-positioning device — each engineering choice anchored to an open question, hypothesis, and planned experiment):“
这里 open question 我感觉开得有点多了。实际上我这个思路可能是来自 miki2026 那个工作的大体框架，一开始我可能不会倾向于说真的耗费大量时间和精力在研究这几个模块到底什么组合最好 ---  ETH 这个工作其实我觉得已经有了很强的借鉴意义和范式了， 我们需要做的可能更多是挪用到除了 ANYmal 以外的平台上（unitree A2, go2 这种），因为我们最后的需求是给一个相对ETH他们来说泛用性更强一些（性能和表现差一些没关系）的系统--- 所以我觉得我这样以他们的工作范式为蓝本加上我对通用型和跨平台方面的改进， 可能更适合我想做的事情 --- 我。。。可能不太擅长（或者不太偏好）抓一个具体的点做算法或者单一个模块的创新。。。。


3. “Research interests at UCL CS and supervisor fit： Name Prof Dimitrios Kanoulas and the RoboHike project explicitly.
Connect specific research directions (continual adaptation, traversability in complex vegetation, foundation-model-grounded navigation, open-vocabulary scene understanding) to ongoing work in his group.“

   这里太笼统啦。。。。我在里面现在做了挺多事情的。包括 cmu-navigation stack, iplanner, viplanner, hardware system integration on go2-w platform, fieldtest experience, etc. 我感觉这些更实际一些，而且我可能到时候真的会基于我今年的很多工作接着往下做！ 