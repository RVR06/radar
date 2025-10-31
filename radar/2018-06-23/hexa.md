---
title: Hexagonal Architecture
ring: adopt
quadrant: staples
tags: [EXPERT]
---

[![](https://img.shields.io/badge/blog%20series-0c7cba?logo=gitbook&logoColor=000&style=flat)](https://archicionado.com/p/hexagonal-architecture/)

A well-known anti-pattern is the blob one ie a workspace - or more accurately a space - where everything is mixed up together, ending up with tight coupling, blurred boundaries, high maintenance cost, low ability to evolve, and more…

- No structure. No discipline.
- No relationship pattern eg random dependencies.
- N-flavor projects… Like candies, we cannot be sure of what we get & it does not necessarily taste good.
- Unpredictable behavior ie what happen if… or could I add/remove/swap/…

To tackle this, most of the architecture patterns introduce layers.
Layer is a common way to:
- Define scope by gathering stuff that shares same semantic/trait/… together.
- Define boundary and act as bulkhead partitioning, guarding one bunch to be noised/modified/broken by other ones.
- Define coupling and communication rules between those bunches  

Hexagonal architecture is one of those particular layered patterns that gains some exposure in the past 2 decades and that deserves attention as it structures the way we think about crafting modern software.

![](/img/2018-06-23/hexa.svg)