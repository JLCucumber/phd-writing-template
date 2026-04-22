# UCL CS MPhil/PhD Application — Personal Statement & Research Proposal

## Context

The user is preparing a UCL Computer Science MPhil/PhD application (open application, target supervisor: Prof Dimitrios Kanoulas, RoboHike PI). The supporting-statement requirements (per the screenshot) are:

- 3000-character text box OR PDF upload allowed
- Forbidden characters: double quotes, ampersand, non-standard/accented characters
- Must address: (1) academic interests + reasons for applying, (2) career objectives + non-academic achievements + publications, (3) research areas/projects of interest

The user chose to **upload PDFs for both** the Personal Statement (PS) and the Research Proposal (RP), reusing the pandoc + IEEE CSL setup already in [research-proposal/](research-proposal/).

**Important constraints from user**:
- The previous draft at [research-proposal/main.md](research-proposal/main.md) is **not a reference** — the RP is being rebuilt from the user's new outline. Old structure, old objectives, and old framing are discarded.
- The keyword **sim-to-real is dropped** entirely. The technical concept of simulation training (Isaac Lab) survives as a development tool, but it is not a research question, not an objective, and not surfaced in titles, contributions, or section headings.

The user has also flagged a substantive concern about whether a strongly-engineered systems proposal counts as a PhD. The plan accommodates that by stating a single overarching research question with three nested objectives (long-term wild navigation, cross-platform adaptation under weaker embodied sensors, and a review-style synthesis of legged systems for environmental monitoring), and by being explicit that the substantive new findings come from iterative engineering refinement during repeated field deployment, not from per-module algorithmic invention.

## Top-level decisions (locked)

1. **Submission format**: both PS and RP as PDF. Reuse the [research-proposal/Makefile](research-proposal/Makefile) pandoc + ieee.csl pipeline. A parallel `personal-statement/` folder will be created with the same conventions.
2. **PS / RP division of labour** (must not overlap):
   - **PS** = who you are, why this PhD, why UCL, what you bring. Motivation and (controlled) emotion permitted. Light technical content.
   - **RP** = pure academic-engineering argument. No personal narrative, no first-person motivation story.
3. **Narrative spine**: long-term wild navigation for legged robots is the technical core; environmental monitoring is the **driving constraint and validation scenario**, not decoration and not a parallel stream.
4. **Forbidden characters**: no `"` (use single quotes if needed), no `&` (write "and"), no accented characters. This applies to PS and RP source files. A pre-compile check is part of the verification step.
5. **Target supervisor named in PS**: Prof Dimitrios Kanoulas (RoboHike PI). Confirm spelling before finalizing.
6. **Page budgets**:
   - **PS**: 2 pages of body (roughly 6000-7500 characters including spaces). Leaves headroom under most academic norms; readable in a single sitting.
   - **RP**: 8-10 pages total. Provisional split: Introduction ~1 page, Literature Review ~3 pages, Methodology ~3 pages, Expected Contributions ~0.5 page, Timeline/Gantt appendix ~0.5 page (authored by user), References ~1-2 pages.
   - These are targets, not hard limits. The Makefile renders to A4 with default pandoc margins; we can tune the geometry pass if either document overflows.
7. **Language style (applies to PS, RP, and this plan itself)**:
   - Short sentences. Plain word order. Avoid stacked subordinate clauses.
   - Each paragraph carries one clear idea. The first sentence states the point; the rest support it.
   - Maintain professional vocabulary, but do not chase elevated phrasing for its own sake.
   - When a sentence runs over two lines on screen, split it.
8. **Long-term scope clarification (from user)**:
   - "Long-term" in this proposal means **multi-day to multi-week deployments** (e.g. 3-5 days, scaling toward 1-2 weeks, with a stretch goal around one month).
   - **Seasonal-scale adaptation is out of scope.** Drop any "season", "seasonal", or "across-seasons" language from PS and RP.
9. **Toolchain detail (from inspecting [research-proposal/Makefile](research-proposal/Makefile) and [research-proposal/README.md](research-proposal/README.md))**:
   - Pipeline is `pandoc main.md -> HTML -> weasyprint -> PDF`. **No LaTeX in the loop**, so any tables we include render via HTML+CSS, which is robust.
   - The current Makefile writes `output/proposal.pdf`. For the personal-statement folder we will rename target to `personal_statement.pdf` so both PDFs can sit side by side without confusion when uploaded.
   - Refs.bib is auto-exported by Zotero (Better BibTeX); we extend it through Zotero, not by hand-editing, so the keys we cite must already exist or be added through Zotero first. Existing keys verified as present include: `mattamala2024wildvisualnavigation`, `mattamala2025buildingforestinventories`, `miki2022learningrobustperceptive`, `miki2026commonsensereasoning`, `peng2025lovonleggedopenvocabulary`, `richter2026largescaleautonomousgas`, `staniaszek2025autoinspectlongtermautonomous`, `tranzatto2022teamcerberuswins`, `dunbabin2012robotsenvironmentalmonitoring`, `icra2026workshoplowi`. (The duplicate `dunbabin2012robotsenvironmentalmonitoringa` should be cleaned up in Zotero before final compile.)

## Academic positioning and unifying research thesis

The user's meta-question — "is this too engineering, can a strong-engineering proposal count as a PhD?" — is answered by being honest about what kind of PhD this is. **It is a systems-research PhD**: the contribution is not a new algorithm in a single module, but the deliberate adaptation, integration, and field-validation of an existing paradigm on a new class of platforms for a new use case.

### Unifying thesis (kept short, in plain language)

> **This PhD builds a long-term wild navigation system for legged robots, designed for cross-platform deployment rather than tied to one chassis. It adopts the foundation-model-grounded navigation paradigm developed at ETH and Oxford, and adapts it for sustained multi-day to multi-week missions in outdoor settings. The motivating use case is environmental monitoring.**

Three sentences, each plain. Every section of the RP traces back to this. Sections that do not advance it get cut.

### One big research question (covers both streams)

The proposal carries a **single overarching research question**, with several objectives nested under it. The two streams (long-term wild navigation; environmental monitoring) are NOT framed as separate research questions.

> **How can a legged robot platform achieve sustained autonomous navigation in wild outdoor environments over multi-day to multi-week deployments, in a way that makes it usable as a tool for ecological and environmental monitoring?**

Objectives nested under this question:
1. Adapt the FM-grounded wild navigation paradigm (after Miki 2026; Mattamala 2024-2025) to a cross-platform setting, where the candidate platforms have markedly weaker embodied sensor suites than ANYmal.
2. Identify and address the system-level engineering changes needed to scale wild deployment from short demonstrations to multi-day and multi-week missions.
3. Produce a written, comprehensive synthesis of how this class of legged platform fits into ecological and environmental monitoring — covering both the bigger-picture framing and the more practical questions of measurement targets, equipment combinations, and the comparison between autonomously-collected and expert-collected field data.

Engineering deliverables under each objective are described in §3 of the RP. Per-module algorithmic novelty is not claimed.

### Positioning vs the closest existing work

The closest five works in [research-proposal/refs.bib](research-proposal/refs.bib) define the landscape. The differentiator is platform breadth and deployment duration, not a deeper algorithmic claim.

| Closest existing work | What they did | Our differentiator |
|---|---|---|
| AutoInspect (Staniaszek 2025, Oxford) | 49-day legged autonomous inspection in industrial / fusion-reactor settings | Wild unstructured environments; environmental-monitoring use case rather than industrial inspection |
| Building Forest Inventories with Legged Robots (Mattamala 2025, Oxford/ETH) | Multi-deployment forest inventory on ANYmal | Cross-platform reach (no fixed chassis assumption); aimed at cross-environment-type use, not only forest |
| Common Sense Reasoning for Wild Navigation (Miki 2026, ETH) | Capability assessment of foundation models for wild navigation on ANYmal | We treat this paradigm as our blueprint and adapt it for platforms with much weaker embodied sensor suites, and for longer deployments |
| Wild Visual Navigation (Mattamala 2024, Oxford/ETH) | Self-supervised traversability via pre-trained models, short-duration | Same technique reused; emphasis is on multi-day to multi-week stability rather than single-session adaptation |
| Mount Etna Gas Monitoring (Richter 2026, ETH) | Single-mission environmental measurement on a quadruped | We aim at periodic, repeated monitoring of a region, not a single mission |

The white space is **long-term + wild + cross-platform + monitoring-motivated**, with the PhD's job being to systematically engineer and field-validate that combination.

### Writing-style commitment (anti-handbook rule, softened)

Methodology sections frame each engineering choice in the form **"We adopt X (after [prior work]) and adapt it to Y because Z."** This keeps the work anchored in research dialogue without forcing every module to be a novel research question. Where a real open question exists (e.g. cross-platform porting outcomes), state it as such; where the work is adaptation, say so plainly.

## Personal Statement — design

**Output**: `personal-statement/main.md` → `personal-statement/output/personal_statement.pdf`

**Voice**: confident, conviction-tested, technically grounded. Brief moments of personal motivation are allowed (especially in the opening and the career-objectives section), but no poem-like or overly emotional passages.

**Target length**: 2 pages of PDF body, roughly 6000-7500 characters including spaces.

**Hard rule against PS-RP overlap**: PS is about the candidate; RP is about the research. The risk in [ucl_cs_personal_statement.md](ucl_cs_personal_statement.md) (the existing draft) is that section 2 reads like a mini-research-proposal. The new PS must avoid this. Concretely:

| Goes in PS | Goes in RP | Goes in **both** (unavoidable but kept brief in PS) |
|---|---|---|
| Personal trajectory (MSc → RA → why PhD now) | Research questions and hypotheses | The high-level problem (long-term wild navigation) — one paragraph in PS, full treatment in RP |
| Antarctic sea-ice professor lecture as the turning point that opened robotics-for-environmental-monitoring as a direction | Vegetation / wild-terrain failures as technical motivation | RoboHike platform reference |
| Credentials (RiTA papers; RA work including viplanner-style semantic local planner progress) | Methodology details, system architecture | Kanoulas / UCL CS connection |
| Long-term life-vision (collaboration with ZSL, WWF, UCL, industry; long-term practitioner/researcher role; community engagement intent) | Literature review with citations | — |
| Specific concrete UCL-side experience: cmu-navigation stack, iplanner, viplanner, hardware integration on Go2-W, field-test experience | Per-module engineering choices, evaluation protocol, Gantt | — |

PS contains **zero** literature citations. PS describes problem motivation but never describes the proposed solution architecture (cognition / perception / planner / etc.) — that is RP's job.

**Section outline** (5 sections):

1. **Academic background and motivation** (~1000 chars)
   - From locomotion (MSc) to navigation (RA) to wild outdoor deployment.
   - **Turning point: an invited UCL talk by an Antarctic sea-ice researcher**, who showed how field sensors translated into ecological insight. This was the moment that opened robotics-for-environmental-monitoring as a personal direction.
   - Brief mention of the follow-up self-education (biodiversity literature, RAS-in-conservation reading, the AI-INTERVENE application process) as evidence that the interest is sustained, not a single-talk impression.
   - Source material: [why_phd.md](why_phd.md), [why_program.md](why_program.md).
2. **The problem I want to solve** (~1500 chars)
   - Long-term autonomous navigation for legged robots in wild outdoor environments.
   - The three core obstacles, in plain language: perception in semantically complex terrain; the system getting steadily worse the longer it runs without intervention; the difficulty of moving a system that works in one place to a new place without retraining.
   - Why this is the bottleneck, not locomotion.
   - One sentence at the end signalling that environmental monitoring is the use case that motivates the long-term and wild constraints — RP carries the technical argument.
3. **Research experience and credentials** (~1500 chars)
   - Two RiTA 2025 papers (advantage-weighted distillation; Isaac Sim closed-loop topology).
   - RoboHike RA work with concrete technical interventions; **most recent direction: viplanner-style semantic-based local planner progress** alongside the broader navigation-stack work.
   - Toolkit: multi-GPU distributed training, Isaac Sim/Gym/Lab, Jetson AGX Orin / NUC, depth sensors and Livox Mid360 LiDAR. (No thermal / event cameras — out of scope.)
4. **Career objectives and non-academic profile** (~1200 chars)
   - **Career vision (made specific, replacing the previous generic version)**: this PhD is the entry point of a long-term path. After PhD, the goal is to keep working on long-term quadruped navigation for environmental monitoring as a career — through partnerships with ZSL, WWF, UCL, and industry, in either research-staff or engineering-staff roles. PhD is the start, not the end; the deeper meaning of the work shows up over a career, not over four years.
   - **Community engagement**: intent to stay actively involved in academic and non-academic exchanges around long-term wild deployment and RAS for environmental monitoring. Even without leadership ambition, the goal is to be a sustained, present contributor and collaborator with talented peers in this area.
   - Non-academic: RiTA Session Chair, MCM National Second Prize, Hamilton production, Tennis Club VP — kept brief; these are evidence of long-form coordination capacity, not personality colour.
5. **Research interests at UCL CS and supervisor fit** (~900 chars, expanded for specificity)
   - Name Prof Dimitrios Kanoulas and the RoboHike project explicitly.
   - **Replace the generic list with concrete RoboHike work the candidate has already done and would build on**: cmu-navigation-stack integration; iplanner work; viplanner-style semantic local planner; hardware system integration on the Go2-W platform; field-test experience across grassland and vineyard sites.
   - State plainly that the planned PhD work is a direct continuation of these RoboHike contributions, scaling toward longer-duration outdoor deployment.

## Research Proposal — design

**Output**: rewrite [research-proposal/main.md](research-proposal/main.md) → `research-proposal/output/proposal.pdf` (output filename comes from the existing Makefile target). The current contents of `main.md` will be **discarded entirely**, not edited incrementally.

**Working title**: Legged Long-term Navigation in the Wild for Environmental Monitoring

**Section outline** (per user's draft, refined):

### 1. Introduction (~600 words)
- Open with the core engineering challenge: autonomous, safe navigation across non-structured environments — moving from indoor/urban settings into complex wild environments — is a central, unresolved task in modern robotics.
- State the research gap concisely: locomotion has matured; wild navigation has not; long-term wild navigation tied to a meaningful application has barely been attempted.
- State the **single overarching research question** verbatim from the "One big research question" section above, then list the three nested objectives. Do not introduce additional standalone research questions.

### 2. Literature Review (~1500 words across four sub-sections)

**2.1 Legged robots: from locomotion to navigation.**
- Argue: (a) locomotion has advanced dramatically through learning-based methods; (b) autonomous navigation for legged systems remains open. Cite ANYmal/Miki; cite Wild Visual Navigation; cite CERBERUS.

**2.2 Autonomous navigation in the wild.**
- (a) Decompose mainstream navigation pipelines (state estimation, mapping, traversability, local/global planning, control); state where structured-environment methods sit.
- (b) Catalog wild-environment failure modes (vegetation density, irregular terrain, perception instability, semantic ambiguity); explain how these specifically break geometric-only methods.
- (c) Survey promising directions (VLMs as cognitive priors, open-semantic segmentation, hybrid modular-with-end-to-end-blocks). Signal which we will adopt in the methodology.

**2.3 Long-term field deployment.**
- (a) What changes between short-term and long-term deployment (drift, model staleness, perception degradation under shifting conditions, hardware endurance, the need for online adaptation rather than one-shot training).
- (b) Existing wild navigation work tends to be short-duration or algorithm-only; identify the gap.
- (c) Acknowledge longer-duration efforts (CERBERUS subterranean; AutoInspect; Autonomous Forest Inventory); credit their advances; state our differentiator: explicit design **for** ecological/environmental monitoring at the system level, not retrofitted.

**2.4 Autonomous systems for environmental monitoring.**
- (a) Survey theoretical and applied prior work (RAS in conservation, mobile sensing platforms — drones, fixed sensor networks, citizen science, ML on remote-sensing imagery).
- (b) Identify the white space for legged systems specifically: where they can complement (not replace) existing methods, and where they fail.
- (c) Motivate the §3.4 review-style synthesis as the natural response to the gap that no single existing review brings together the bigger-picture role of legged platforms with the practical questions of measurement targets and equipment.
- This sub-section is primarily groundwork for §3.4; it does not introduce additional research questions of its own.

### 3. Proposed Methodology (~1800 words)

**3.1 Recap of the research question** (1 short paragraph).
- Restate the single overarching research question (verbatim from the "One big research question" section above), and tie it to the three nested objectives. The PhD aims to build a long-term wild navigation system that runs across multiple legged platforms, adapts the FM-grounded paradigm developed at ETH/Oxford, and supports environmental monitoring as a written, integrated contribution.

**3.2 The autonomous navigation system.**

The system is built by **adopting the FM-grounded navigation paradigm (after Miki 2026, Mattamala 2024-2025) and adapting it for cross-platform deployment**. The work's distinguishing character is iterative engineering refinement informed by repeated field testing, not algorithmic invention inside a single module. Three system-level questions guide the work — stated plainly, without per-module RQ tables:

- **System-level question 1**: Can the FM-grounded wild navigation paradigm, as demonstrated on ANYmal, be adapted to and stabilised on legged platforms whose embodied sensor suites are markedly weaker than ANYmal's? (ANYmal carries multiple RealSense cameras around the body; the candidate platforms typically do not, so much of the perception layer's stability assumption has to be re-earned through external sensor mounting and re-tuned perception.)
- **System-level question 2**: What system-level engineering changes are required to scale wild deployment from short demonstrations toward multi-day and multi-week missions?
- **System-level question 3**: Across at least two of the candidate platforms, how reliably does the integrated stack transfer, and what fails first when it does not?

> **Honest caveat (kept in this plan, not in the RP itself):** the candidate is realistic about the risk that the planned hardware platforms may not match the assumed perception-stack assumptions out of the box, and is committed to the "stay rational, address it as it arises" approach. The methodology is written so that re-tuning to weaker sensor suites is an explicit objective rather than a hidden assumption.

Then the system layers, in prose, written in the form **"We adopt X (after [prior work]) and adapt it to Y because Z"**:

- **Hardware platforms**: primary candidate is **Unitree A2 or B2** (selection driven by which has the more usable embodied sensor suite and is available through RoboHike). Backup platforms are **Unitree Go2 or Go2-W**. The platform list is intentionally not framed as "Unitree-class" — the framing is cross-platform, with the listed candidates as the realistic near-term set. Sensors: Livox Mid360 LiDAR and depth cameras (additional depth coverage will need to be mounted; this is part of the engineering work, not a free assumption). No thermal or event cameras. Compute: **on-board GPU compute is required for inference (Jetson AGX Orin or similar GPU edge module). No NUC.**
- **Software stack** (modular by default, mirroring the ETH paradigm):
  - **Cognition layer**: a large vision-language model used as a grounding prior, after Miki 2026. **The VLM runs as a cloud service accessed over network, not on-edge.** Edge-only VLM compute is not in scope; we explicitly take the cloud-VLM-via-network approach and accept its connectivity constraints.
  - **Perception layer**: VLM-derived priors guide an open-vocabulary semantic segmentation that produces task-relevant labels and categories. The VLM prior together with the segmentation result is then projected onto an elevation map to construct a multi-dimensional **local value map** (channels for risk, preference, steppable). This is the central perception representation downstream modules consume.
  - **Local planner**: an **RL-based local planner** (trained in Isaac Lab) that takes the local value map plus a local goal point as input and outputs **cmd-vel** directly. There is no explicit 3D path planning step. A viplanner-style semantic local planner is retained as an alternative comparison option, but not as the primary architecture.
  - **Locomotion**: reuse existing learned controllers; not a research question for this proposal.
  - **State estimation**: FASTLIO baseline.
- **Long-term operational design**: kept brief in the RP. Battery management, weatherproofing, network coverage (relevant given the cloud-VLM dependency), and redundancy are real engineering concerns; they are discussed at the level of "addressed as encountered", not expanded into a methodology subsection.

**3.3 Field testing and evaluation scheme.**

- **Multi-terrain stability and robustness**: grassland, light forest, mountain trail. Geographically named where possible (UK and European sites accessible via RoboHike).
- **Per-module ablations**: included to demonstrate that the integrated system is well-behaved, but not the centre of attention. Light-touch quantitative metrics for cognition (cloud-VLM call quality and latency), perception (local value map quality vs ground truth where obtainable), and planning (success and intervention rates).
- **Cross-platform generalisation** (high-priority for this PhD): port the stack across at least two candidate platforms (primary: A2 / B2; backup: Go2 / Go2-W); characterise what transfers, what breaks, and what required platform-specific changes — especially around sensor mounting and perception re-tuning.
- **Long-term stability** (high-priority): longitudinal runs that track navigation reliability, perception drift, network/cloud-VLM availability, and intervention frequency over 3-5 day, 1-2 week, and (stretch) approximately one-month deployments.

**3.4 Environmental monitoring — review-style written contribution (Objective 3 under the single big RQ).**

Environmental monitoring is folded into the single overarching research question (see "One big research question" above), not split off as a separate research thread. The methodology treats it as a **written, comprehensive review-and-synthesis contribution**, not as a hardware-build subproject. The earlier framing of this section as "a practical sensor-combination recommendation" was too narrow and too engineering-flavoured; the user's preferred framing is broader and more theoretical, while still allowing the practical questions to live inside it.

Concretely, this section produces a single written deliverable (a review-style chapter that may also be developed into a journal review paper) that addresses, under one umbrella, both the bigger picture and the more practical sub-questions:

- **Bigger picture (the part that must not be dropped).** A grounded synthesis of how mobile autonomous legged platforms fit into the broader practice of ecological and environmental monitoring — what they uniquely enable, where they cannot replace existing methods, what the recent shifts in the field are (drone surveys, fixed sensor networks, citizen-science crowdsourcing, ML on remote-sensing imagery), and what the white space for legged systems looks like.
- **Practical sub-questions (kept, but as objectives under the bigger picture, not as standalone RQs).** Within that umbrella, the review may discuss:
  - which measurement targets and onboard equipment combinations are most cost-effective and informative for legged platforms in long-term wild monitoring;
  - whether autonomously-collected data, from this class of platform, gives downstream analyses comparable utility to expert-collected data, for the monitoring tasks identified as practical.

  These were previously framed as separate research questions; per user direction they are now nested objectives under the single big RQ.

**Timing of this work** — open question the user is still resolving. Three options were considered:

1. *Late-stage only* (Year 3-4, written after enough field time to inform the review). Risk: insufficient cross-pollination with the navigation work earlier on.
2. *Early-stage only* (Year 1-2, written as background-setting). Risk: written before the candidate has the field experience to ground the synthesis.
3. *Cross-cutting* (begins Year 1 as background reading and structured note-taking; structures into a draft mid-PhD; finalised by Year 3-4). **This is the assistant's recommendation**, because a review-style contribution benefits from being shaped by the navigation work it sits alongside, while still being written-down progressively rather than at the last minute. The user's note "I think I'm too idealism on something now" is taken seriously — the cross-cutting option is the one that lets the candidate retain the ambition without forcing all of it into a single late chapter.

The user can override the timing decision when we draft this section.

**Scope honesty.** This is a review and synthesis contribution. It is not a hardware demonstrator. The proposal says this directly so reviewers do not pull it forward into a hardware-build expectation.

### 4. Expected Contributions (~300 words, scaled back deliberately)

The contributions are stated honestly: this is a systems-research PhD whose substantive new findings come from iterative engineering refinement under repeated field deployment. The deliverables are framed accordingly.

1. **A long-term wild navigation system designed for cross-platform deployment.** Open-source code, hardware integration documentation, and a working integrated stack adapted from the ETH/Oxford paradigm. This is the primary deliverable.
2. **A cross-platform adaptation study.** A characterisation of what transfers between the candidate platforms (primary: A2 / B2; backup: Go2 / Go2-W), what breaks, and what required platform-specific engineering — particularly around weaker embodied sensor suites and the resulting perception-stack adjustments. This is where the PhD's most defensible new finding lies.
3. **A long-term wild navigation evaluation protocol.** A reproducible protocol for evaluating navigation reliability over multi-day to multi-week deployment durations. (A companion **dataset** release is a possible deliverable but is held under review — to be confirmed by Year 2 depending on data quality and platform availability.)
4. **A review-style synthesis of legged autonomous platforms in environmental monitoring.** A written, comprehensive contribution (with the ambition of being submittable as a review article) that connects the bigger-picture role of legged systems in ecological and environmental monitoring to the practical sub-questions of measurement targets, equipment combinations, and the comparison between autonomously-collected and expert-collected field data. This is positioned as a substantive scholarly contribution in its own right, not as a hardware-build demonstrator.

Per-module algorithmic contributions are **not** claimed. The work re-uses existing modules (FM cognition via cloud VLM after Miki 2026; perception via VLM-prior-guided open-vocabulary segmentation projected onto an elevation-map local value map; RL-based local planner trained in Isaac Lab) and the new findings come from cross-platform adaptation and from sustained-deployment engineering.

### 5. Appendix — Timeline / Gantt chart

**Deferred to the user.** The user has stated that they will write the timeline and Gantt chart themselves. The executor leaves §5 of `main.md` as an empty section heading (or a one-line placeholder such as `_To be drafted by author._`) and does not propose phasing on the user's behalf. No year-by-year table, no track list, no phase framing is to be authored by the assistant.

### 6. References
- Reuse and extend [research-proposal/refs.bib](research-proposal/refs.bib). Add references for the env-monitoring sub-section.

## Critical files

**To create**:
- `personal-statement/Makefile` — copy and adapt from [research-proposal/Makefile](research-proposal/Makefile)
- `personal-statement/main.md` — new
- `personal-statement/style.css` — copy from [research-proposal/style.css](research-proposal/style.css)
- `personal-statement/.gitignore` — copy from [research-proposal/.gitignore](research-proposal/.gitignore)
- `personal-statement/ieee.csl` — copy or symlink from [research-proposal/ieee.csl](research-proposal/ieee.csl) (PS may not need citations; if not, drop)

**To rewrite**:
- [research-proposal/main.md](research-proposal/main.md) — full rewrite per Section 2 structure above
- [research-proposal/refs.bib](research-proposal/refs.bib) — extend with env-monitoring references

**To use as source material (do not modify)**:
- [ucl_cs_personal_statement.md](ucl_cs_personal_statement.md) — quarry for PS prose only (PS context, not RP)
- [why_phd.md](why_phd.md), [why_program.md](why_program.md), [why_this_project.md](why_this_project.md) — motivation source for PS only
- [personal_skills.md](personal_skills.md) — credentials source for PS only
- [other_circumstances.md](other_circumstances.md) — emotional anchor (not for direct reuse — too lyrical)

**Explicitly NOT a reference**:
- [research-proposal/main.md](research-proposal/main.md) (current contents) — old framing including the sim-to-real objective is discarded; the file is rewritten from scratch.
- [ucl_cs_research_proposal.md](ucl_cs_research_proposal.md) and [ucl_cs_research_proposal.pdf](ucl_cs_research_proposal.pdf) — superseded.

## Iterative working order

The user wants section-by-section iteration. Two orderings are sensible — the **document order** (what the reader sees) and the **spine-first order** (what produces the most coherent text). Recommendation is spine-first, because Lit Review and Introduction are easier to write once we know exactly what the Methodology will claim.

**Recommended sequence (spine-first)**:

1. **Anchor**: lock the unifying thesis and the three system-level questions in §3.2 — short user-review checkpoint. This is the research backbone; everything else is exposition. (Timeline/Gantt is the user's section and is not part of this checkpoint.)
2. **Set up** `personal-statement/` folder (Makefile adapted with new output filename, copied style.css, frontmatter in main.md, empty section skeleton).
3. **RP § 2 Literature Review**, one sub-section at a time (2.1 → 2.4). Each sub-section ends by motivating the corresponding methodology choice so the reader sees the gap before they see the system.
4. **RP § 1 Introduction**: distill the locked thesis and the gap into ~1 page.
5. **RP § 3 Methodology prose**: anchor on the three system-level questions and the layered system description (hardware, software stack, evaluation, env-monitoring discussion).
6. **RP § 4 Contributions**: short, derivative of what came before. (§ 5 Timeline/Gantt is left to the user; the assistant only inserts a placeholder heading.)
7. **RP § 6 References**: verify every `[@key]` in `main.md` resolves in [refs.bib](research-proposal/refs.bib); add missing ones via Zotero.
8. **PS** sections 1 → 5, drafted once the RP narrative spine is fully locked so PS-RP overlap can be policed against the table in the PS section.
9. **Final pass**: forbidden-character scan; compile both PDFs via Make; visual proofread; length check. Timeline/Gantt is excluded from the assistant's compile pass — the user adds it before final submission.

**Alternative (document order)**: if the user prefers, we can write strictly in document order (Intro → Lit Review → Methodology → Contributions → [Gantt placeholder] → References → PS). It produces a less optimal first draft but matches the user's stated outline order. To be confirmed at execution time.

## Risks and mitigations (acknowledged, not solved)

These are scope/feasibility risks that we will not surface in the RP itself but should keep in mind when sizing the methodology:

- **Hardware availability and capability mismatch**: the primary candidates (A2 / B2) and backups (Go2 / Go2-W) all carry weaker embodied sensor suites than ANYmal, and at least one of them must be in hand for the cross-platform work. The candidate has flagged the worry that the assumed perception stack may not transfer cleanly. Mitigation: existing RoboHike infrastructure; explicit acknowledgement in §3.2 that re-tuning the perception stack to weaker sensor coverage is itself part of the research; willingness to revise platform choice based on what the hardware actually supports.
- **Field site access**: grassland and vineyard are accessible via existing RoboHike sites; light-forest and mountain-trail sites may require new partnerships. Mitigation: progressive complexity year over year, with site partnerships being a Year-2 task.
- **Network reliability for cloud VLM**: the cognition layer depends on a cloud-hosted VLM accessed over network. Wild deployment locations may have intermittent or no connectivity. Mitigation: graceful degradation when the VLM call is unavailable; cache-and-replay during outages; this constraint is explicitly part of the long-term-stability evaluation in §3.3 (we measure cloud-VLM availability over the deployment).
- **Env-monitoring scope creep — *clarification***: this risk is **not** a signal that the env-monitoring topic is unimportant or should be redirected. It is the opposite — the topic is meaningful enough that, if framed as a *hardware-build* sub-project (designing onboard sample collectors, writing dedicated firmware, running multi-site collection campaigns), it becomes a second multi-year PhD competing for time with the navigation work. The user's chosen framing (§3.4 as a comprehensive review-and-synthesis written contribution, with the practical equipment-and-data questions nested inside the bigger-picture review) resolves this risk. Mitigation: hold to the review-paper framing; do not let reviewer feedback escalate it back into a hardware-build commitment.

## Verification

- `cd research-proposal && make pdf` produces `output/proposal.pdf` cleanly.
- `cd personal-statement && make pdf` produces `output/personal_statement.pdf` cleanly (after Makefile adaptation).
- Run a forbidden-character scan on both source files (`grep -nE '["&]' main.md` and a non-ASCII scan): zero matches for `"`, `&`; em-dashes and en-dashes are acceptable as they are standard typography but should be reviewed; any accented or curly characters get replaced with ASCII equivalents per UCL guidance.
- Visual proofread both PDFs: layout, citation rendering, table formatting. (The Gantt chart appendix will be added by the user; the assistant only verifies its placeholder section heading renders cleanly.)
- Citation completeness check: every `[@key]` in `main.md` resolves to an entry in [refs.bib](research-proposal/refs.bib).
- Final length check on PS (target 6000-7500 chars including spaces, ~2 pages) and RP (target 8-10 pages compiled).
