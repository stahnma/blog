---
title: "The COGS Problem"
date: 2023-02-20
draft: false
tags: ["engineering", "leadership", "cloud", "finance", "cogs"]
categories: ["Leadership"]
subtitle: "A pragmatic framework for reducing cloud spend through cost discipline, unit economics, and architecture choices."
---

Originally published on [LinkedIn](https://www.linkedin.com/pulse/cogs-problem-michael-stahnke/).

This post is for engineering leaders specifically, but anybody looking for tactics and strategies to reduce their cloud spend should be able to pull out some nuggets from here.

Run an engineering department for a while, and it is a bit astounding what becomes interesting. While I was once fascinated by new technologies and software, eventually my interests moved more into making sure the technology we were building was meshing and fitting with the rest of the goals of the company. I still love to hack on tech and still write lots of POCs or fun side projects, but for the day job, I spend the time on the intersection of business and technology, and it can actually be quite enjoyable.

People outside of engineering generally care about your technology implementation to a very small degree, like almost none. Customers do not buy your programming language choice, your platform choice, or even your org chart makeup. In the end somebody is measuring the return on investment (ROI) for engineering, and ideally the first person doing that is the engineering leader.

A key metric that contributes to ROI is Cost of Goods Sold (COGS). COGS is the cost component of Gross Margin (GM), which also can be manipulated by pricing and packaging, and even by the way revenue is recognized. So while total GM is a collaboration between Finance and Engineering, COGS can usually stay a little more within just the realm of engineering. However, there are certainly some rules around support staff costs, tooling budgets, and some miscellaneous items that need to be accounted for (and will not be covered here).

For an online business, the biggest component of COGS is likely cloud costs. At AWS re:Invent this year, that was a hot topic. The market was certainly beginning to change and the methods of measuring and benchmarking companies (particularly those in the tech sector) transitioned from growth at all costs to efficient growth, meaning costs need to be in control. The expo floor had around a dozen vendors who promised to save me huge amounts on cloud costs.

Before you jump into spending money on cost control, take a step back. It is not often that spending money to save money is the best first step. Here are some thoughts to effectively review and improve your cloud expenditures.

![Gold bars and savings outcomes](/img/blog/the-cogs-problem/gold_bars.jpeg)

## Stop Dumb Spending

First, stop with dumb spending. This may seem obvious, but for many organizations I have talked with, it is just not being done. It can come off like "eat your vegetables," but in reality you may have some really easy things to clean up to save a bunch. Even if it is not too sizable of savings, good hygiene in these areas will improve discipline for further steps.

Dumb spending includes things like:

- Data lifecycle: data that is saved with no retention or lifecycle. How many S3 buckets just grow and grow? Do you prune old DB data?
- Forgotten resources: do you have resources, systems, or machines that are running and not used? Implement a reaper to kill resources that are not tagged properly or are older than a certain date. Did you leave up a snapshot of an old RDS instance? Do you have an extra replica still running?
- Overprovisioning: what utilization are you getting on your resources? If you are running a 32-core, 1 TB RAM node, do you need to?
- Provider recommendations: your cloud provider likely has tools such as Cost Explorer that can recommend reserved purchases or better sizing.

Yeah, that stuff seems easy. Cool. Just do it. Maybe you will see some impact.

![Money and cost controls](/img/blog/the-cogs-problem/money1.jpg)

## Unit Costs

Next is where the real work starts. You need to know what your unit cost is. It could be what it costs to host a customer, what it costs per mobile app user, per transaction on the platform, per minute spent on the software, and so on.

At my last role, we knew the unit cost for a credit, a job, a build, and several other dimensions. At another company, the VP of Product knew the cost per agent deployed and knew that if sales sold something below that cost, there was no way to make up that delta, even at high volume.

To illustrate this:

Let us say an agent costs $76 a year for a customer. This would likely be on average, and some may be higher or lower depending on region, usage, complexity, and other factors. But if that $76 is agreed upon by finance, accounting, engineering, and product, now you can compare it against GM goals.

If you are out of line with GM goals, you have two options:

- Make the per-unit cost cheaper.
- Price high enough to hit GM targets with this unit cost (including discounting).

In reality, you will probably do both.

Moving from $76 per agent to $71 might be simple. Ideas from "Stop Dumb Spending" could plausibly get you there. Maybe even $70 or $69 annually.

If finance says the goal needs to be about $55 annually per agent, you have serious work to do.

When working on unit cost, you must know how you scale:

- Do you get cheaper when you add more units of work?
- Is it cheaper per unit to run 300 than 50?

If yes, getting more customers is a win-win and should be prioritized. If costs scale linearly, you have no real economies of scale and need to improve per-unit efficiency or redesign architecture.

Unit cost should be measured and tracked over time. This shows progress on the savings mission. Also, do not forget static costs in your unit cost model (shared Kubernetes clusters, shared DBs, backups, baseline network costs, and more).

## Infrastructure Optimization

Once you have your unit costs, look at infrastructure first. It is often faster to move or change infrastructure than redesign an entire application (or dozens or hundreds of microservices).

Things that can be advantageous:

- Right-size systems. Commercial tools help, but load graphs can get you started.
- Consider moving to AMD or ARM if you are still on Intel. ARM is often cheaper and can outperform alternatives.
- Optimize network flow. Network transfer can be a surprisingly large part of cloud bills.
- Implement continuous capacity monitoring. Optimized setups can drift as user behavior changes.
- Use spot instances (or interruptible instances on GCP) where appropriate.
- Add safeguards for runaway spend (infinite Lambda loops, oversized replicas, logging/trace features you enabled but do not use).

Sidebar: do not go multi-cloud as a savings strategy. Multiple clouds add overhead across security and operations. Consolidation can improve discount leverage and simplify execution.

![Cloud infrastructure review](/img/blog/the-cogs-problem/finance_review.jpg)

## Architectural Changes

You can absolutely make architecture changes earlier or in parallel. Depending on product maturity and market fit, this can be a bigger or smaller win. Often these trade-offs compete with roadmap priorities.

Common spend drivers include:

- Software/runtime versions: new versions can be materially more efficient (for example, Java LTS upgrades reducing CPU use).
- Data design: inconsistent data models across services drive ETL, exception handling, and operational overhead.
- Algorithm efficiency: better algorithms beat better hardware over time.
- Redundancy strategy: storing data many times can be wasteful, but storing once can also introduce expensive complexity.
- Spot instances: again, useful when architecture and operations can support interruption.

![Stocks and market chart](/img/blog/the-cogs-problem/stock_.jpg)

## Conclusion

Tools for cloud cost management are useful. Many start by optimizing reserved instances, savings plans, or committed-use discounts. You should do those things, but they are only the start.

The COGS mindset is important for software leaders, and also for engineers. If engineers can show measurable savings in 24 to 48 hours, that is strong feedback and reinforces good behavior.

As a leader, understand your costs and how they flow into broader business benchmarks and measurements. The rest of your executive team will thank you.
