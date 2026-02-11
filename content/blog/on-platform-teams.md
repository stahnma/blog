---
title: "On Platform Teams: Build the Roads, Not the Cars"
date: 2025-06-10
draft: false
tags: ["platform-engineering", "devops", "engineering", "teams"]
categories: ["Engineering"]
subtitle: "Why platform teams fail when they forget who their customer is."
---

Every engineering org of a certain size eventually decides it needs a platform team. And about half of them get it wrong. Here's the pattern I keep seeing.

## The Anti-Pattern

A platform team gets formed. Smart engineers get assigned to it. They look at the mess of scripts, pipelines, and bespoke tooling across the org and think: "We need to build a platform."

So they go heads-down for six months and build... something nobody asked for. It's technically impressive. It solves problems the team imagined other teams had. And it has approximately zero adoption because nobody was consulted during the build.

## The Fix

Platform teams need to operate like internal product teams. Their customers are the other engineering teams. That means:

- **Talk to your users.** Survey teams quarterly. Sit in on their standups. Understand their pain.
- **Ship incrementally.** Don't build the grand unified platform. Build the thing that solves the most painful problem this quarter.
- **Make adoption optional.** If your platform is genuinely better, teams will adopt it. If you have to mandate it, something is wrong.
- **Measure developer experience.** Track deployment frequency, lead time, and developer satisfaction. If these aren't improving, your platform isn't working.

## The Roads Metaphor

Think of it this way: your job is to build roads, not cars. You pave the highway, maintain it, and make sure the on-ramps are clear. But you don't tell teams what car to drive or where to go. You make it so easy and fast to use your roads that nobody would consider going off-road.

The best platform teams I've worked with are the ones where feature teams forget the platform exists — because everything just works.
