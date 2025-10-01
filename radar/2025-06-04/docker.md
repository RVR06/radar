---
title: Docker
ring: adopt
quadrant: platforms-and-operations
---

[![](https://img.shields.io/badge/weave_at_the_compose_stage-0c7cba?logo=gitbook&logoColor=000&style=flat)](https://archicionado.com/p/weave-at-the-compose-stage/)

Docker compose is an efficient way to locally assemble - or compose hence da name - a bunch of Docker containers. You usually end up with a single file that spawns and stitches the different actors, dealing with network and environment configuration. But this raw setup does not scale very well as the ecosystem expands. Not only the number of services grows but the inherent coupling is likely to become more complex, increasing the declarative syntax and noising the overall intent.