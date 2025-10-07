---
title: Docker
ring: adopt
quadrant: platforms-and-operations
tags: [EXPERT]
---

[![](https://img.shields.io/badge/weave_at_the_compose_stage-0c7cba?logo=gitbook&logoColor=000&style=flat)](https://archicionado.com/p/weave-at-the-compose-stage/)

Docker Compose is an efficient way to locally assemble—or compose, hence the name—a collection of Docker containers. You typically end up with a single file that spawns and connects the different components, handling network and environment configuration. However, this basic setup doesn't scale well as the ecosystem expands. Not only does the number of services grow, but the inherent coupling becomes increasingly complex, expanding the declarative syntax and obscuring the overall intent.