# RO1 Gap Stress Test: Wild Legged Navigation

This note stress-tests the RO1 claim against a bounded 2021-2026 corpus, using the framing already present in [main_2.md](/home/data/projects/phd-writing-template/research-proposal/main_2.md:42) and the current bibliography in [refs.bib](/home/data/projects/phd-writing-template/research-proposal/assets/refs.bib:1).

## Target Claim

> Locomotion and traversability for quadrupeds have matured substantially, but repeated long-duration autonomous navigation in wild unstructured environments remains sparsely demonstrated on cost-controlled quadrupeds.

Working interpretation:

- `locomotion solved` is too strong.
- Safer reading: mobility has matured enough that the main bottlenecks shift toward autonomy integration, perception robustness, deployment methodology, and evaluation.

## Target Criteria

For the exact gap under test, a paper is strongest if it demonstrates all five:

1. Legged platform
2. Wild natural environment
3. Repeated or long-duration autonomy
4. Cost-controlled quadruped
5. System-level evaluation or reproducible deployment evidence

Verdict tags:

- `Supports gap`: misses enough of the target corner that it does not close the claimed gap
- `Partial counterexample`: hits 3-4 target criteria
- `Full counterexample`: hits all 5 target criteria

Cost classes used here:

- `High-cost legged`: ANYmal / Spot class
- `Cost-controlled target`: non-ANYmal / non-Spot quadrupeds such as Unitree B2 / A2 class
- `Non-target platform`: wheeled or mixed system, included only as contrast

## Evidence Table

| Paper | Bucket | Venue/status | Platform | Environment | Autonomy regime | Duration/scale | Repeated deployment? | Cost class | What it actually demonstrates | Effect on gap |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| [Miki et al. 2022, "Learning robust perceptive locomotion for quadrupedal robots in the wild"](https://arxiv.org/abs/2201.08117) | Enabling tech | Science Robotics 2022 | ANYmal | Natural and urban outdoor terrain; Alps hike | Autonomous locomotion controller, not a full navigation stack | Multi-season deployments; hour-long alpine hike | Yes, repeated field deployments across varied terrain | High-cost legged | Strong evidence that perceptive locomotion is mature enough to survive difficult terrain with little or no human help at the locomotion layer | `Partial counterexample` - strongly weakens any claim that basic quadruped mobility is still the main unsolved problem, but it is not a long-duration wild navigation system on a cost-controlled platform |
| [Mattamala et al. 2024, "Wild Visual Navigation"](https://arxiv.org/abs/2404.07110) | Enabling tech | Autonomous Robots 2025; arXiv preprint 2024 | ANYmal C / D | Forests, parks, grasslands, woodland | Online self-supervised traversability learning integrated into closed-loop local navigation | Minutes-to-kilometer scale; fast in-field adaptation in under 5 min | Yes, multiple real-world deployments, but not long-duration autonomy | High-cost legged | Strong evidence that traversability learning and semantic priors have moved beyond purely geometric local planning in wild terrain | `Partial counterexample` - substantially narrows any "perception for wild legged navigation is missing" claim, but does not show repeated long-duration autonomy on a cost-controlled quadruped |
| [Chirici et al. 2023, "Robotics in Forest Inventories: SPOT's First Steps"](https://www.mdpi.com/1999-4907/14/11/2170) | Direct legged wild deployments | Forests 2023 | Spot with default EAP LiDAR | Forest inventory in Vallombrosa forest | Mainly teleoperated data collection; exploratory first test, not robust autonomy | Single-site first-use study | No sustained repeated-autonomy result | High-cost legged | Useful as a baseline showing that forest use was being explored, but autonomy, sensing quality, and data quality were still limited | `Supports gap` - wild legged deployment exists, but it is early-stage, high-cost, and not a repeated long-duration autonomous system |
| [Mattamala et al. 2025, "Building Forest Inventories with Autonomous Legged Robots"](https://arxiv.org/abs/2506.20315) | Direct legged wild deployments | arXiv preprint 2025 | ANYmal C / D | Under-canopy forests across the UK, Finland, and Switzerland | Full autonomy stack for forest inventory: planning, state estimation, local navigation, inventory pipeline | Five field campaigns, 16 missions, 1.5 years; up to 1 ha in under 30 min | Yes | High-cost legged | The strongest direct counter-pressure on the gap: repeated autonomous forest deployments, explicit lessons learned, and direct discussion of hardware maturity, dense undergrowth, cost, and open evaluation questions | `Partial counterexample` - closes much of the "nobody has done repeated wild legged deployments" claim, but remains on ANYmal rather than a cost-controlled quadruped and still frames the area as under-explored |
| [Richter et al. 2026, "Large-Scale Autonomous Gas Monitoring for Volcanic Environments"](https://arxiv.org/abs/2601.07362) | Direct legged wild deployments | arXiv preprint 2026 | ANYmal with custom mass-spectrometer payload | Volcanic terrain on Mount Etna | Modular autonomy stack with mission planning, global planning, localization, local navigation | Three autonomous missions plus one teleoperated fumarole mission; autonomy rate 93-100% | Yes, but mission count remains small | High-cost legged | Strong proof that integrated legged field autonomy can support scientific sensing in harsh natural terrain, while still exposing global-local alignment and traversability limits | `Partial counterexample` - shows autonomous wild missions beyond forests, but still on a high-cost customized ANYmal stack rather than a cost-controlled platform |
| [De Benedittis et al. 2025, "Botany Meets Robotics in Alpine Scree Monitoring"](https://arxiv.org/abs/2511.12526) | Direct legged wild deployments | IEEE Transactions on Field Robotics early access 2025 | ANYmal C | Alpine scree habitat monitoring | Robot-assisted habitat survey with autonomous mission structure and offline habitat analysis | Two field campaigns spanning two years | Yes | High-cost legged | Evidence that legged robots are reaching real biodiversity-monitoring use cases in harsh natural terrain, not just mobility demos | `Partial counterexample` - strengthens the case that wild legged monitoring is no longer hypothetical, but still sits in the high-cost ANYmal regime rather than the cost-controlled corner |
| [Tranzatto et al. 2022, "Team CERBERUS Wins the DARPA Subterranean Challenge"](https://arxiv.org/abs/2207.04914) | Adjacent long-term systems | arXiv 2022 | ANYmal plus heterogeneous flying/ground system-of-systems | Subterranean tunnel, urban, and cave environments | Supervised autonomy with resilient exploration, multi-modal perception, and high operator abstraction | Three-year program with monthly field tests and repeated competition-style deployments | Yes | High-cost legged | Strongest evidence that systems engineering, integration, field testing cadence, and failure-recovery design can produce resilient autonomy at scale | `Partial counterexample` - proves long-horizon legged autonomy can be engineered, but in a competition-specific, heterogeneous, non-natural, non-cost-controlled setting |
| [Staniaszek et al. 2025, "AutoInspect"](https://doi.org/10.1109/TFR.2025.3586831) | Adjacent long-term systems | IEEE Transactions on Field Robotics 2025 | Spot plus custom Frontier payload; also other platforms | Mostly controlled industrial sites; fusion facility; some forest integration examples | Long-term mission-level autonomy with topological maps, scheduling, docking, and operator-light execution | 49-day and 35-day deployments; 14 and 15 uninterrupted autonomous days | Yes | High-cost legged | Best direct evidence for long-term autonomy maturity, but in mapped, structured, operator-prepared environments rather than wild unstructured natural terrain | `Partial counterexample` - shows long-term autonomy exists, but mostly outside the exact wild-natural-cost-controlled corner |
| [Gadd et al. 2024, "Watching Grass Grow"](https://arxiv.org/abs/2404.10446) | Adjacent long-term systems | arXiv preprint 2024 | Clearpath Husky base platform | Dynamic grassland ecosystem at Wytham | Long-term visual teach-and-repeat navigation and mission planning for biodiversity monitoring | 6-week deployment | Yes | Non-target platform | Strong evidence that repeated autonomous ecological monitoring is feasible in a real ecosystem, but it relies on a wheeled platform and route teaching/retaught paths rather than legged wild autonomy | `Partial counterexample` - closes part of the monitoring and long-term deployment story, but not the legged cost-controlled corner |
| [Baril et al. 2022, "Kilometer-scale autonomous navigation in subarctic forests"](https://arxiv.org/abs/2111.13981) | Adjacent long-term systems | Field Robotics 2022 | Clearpath Warthog | Boreal/subarctic forest in winter conditions | Teach-and-repeat autonomous navigation with point-cloud registration | 18.8 km over 14 repeat runs | Yes | Non-target platform | Very strong evidence that repeated forest autonomy and deployment lessons can be produced in harsh wild conditions, but on a wheeled platform | `Partial counterexample` - closes part of the "wild repeated autonomy" story, but not on a quadruped, and not on the specific low-cost legged target |

## Answers to the Three Test Questions

### 1. Has locomotion/perception matured enough that they are no longer the main claimed novelty?

Yes, substantially.

- `Miki 2022` makes it hard to argue that basic wild quadruped mobility is still the central missing capability.
- `WVN 2024` makes it hard to argue that semantic/traversability-aware wild local navigation is still missing in a zero-to-one sense.
- The stronger field papers now treat locomotion and traversability less as the headline novelty and more as ingredients inside a larger systems problem.

The safe conclusion is not `solved`, but `mature enough that the bottleneck has shifted upward`.

### 2. Do the strongest long-term autonomy results mostly sit outside the exact target corner of the space?

Yes.

- `AutoInspect` is the clearest long-term autonomy success, but in structured, mapped, operator-prepared industrial sites.
- `CERBERUS` is the clearest high-end resilient autonomy success, but in subterranean challenge conditions, with heterogeneous robots and a large, highly engineered system-of-systems.
- `Watching Grass Grow` and `Baril 2022` show repeated autonomy in real ecosystems, but not on quadrupeds.
- The direct wild legged monitoring papers that do hit the natural-environment corner mostly use `ANYmal`, often with heavy custom payloads and high-end sensing.

### 3. Are cost-controlled quadruped demonstrations still missing repeated long-duration wild deployments?

Yes, based on this corpus.

- None of the strongest direct examples demonstrates repeated or genuinely long-duration wild autonomy on a `cost-controlled` Unitree-class quadruped.
- The closest direct papers are still concentrated around `ANYmal` and sometimes `Spot`.
- The literature now contains real wild legged deployments, but not yet a convincing repeated long-duration autonomous wild-navigation story on the specific lower-cost quadruped class targeted by RO1.

## Final Verdict

`gap stands but narrower`

Safer replacement gap sentence:

> Recent work has substantially advanced legged mobility, traversability learning, and several high-end field deployments in forests and other natural environments, but repeated, long-duration autonomous navigation in wild unstructured terrain remains weakly evidenced on cost-controlled quadrupeds, with deployment methodology and evaluation practice still underdeveloped.
