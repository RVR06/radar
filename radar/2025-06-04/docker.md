---
title: Docker
ring: adopt
quadrant: platforms-and-operations
---

[![](https://img.shields.io/badge/weave_at_the_compose_stage-0c7cba?logo=gitbook&logoColor=000&style=flat)](https://archicionado.com/p/weave-at-the-compose-stage/)

Docker compose is an efficient way to locally assemble - or compose hence da name - a bunch of Docker containers. You usually end up with a single file that spawns and stitches the different actors, dealing with network and environment configuration. But this raw setup does not scale very well as the ecosystem expands. Not only the number of services grows but the inherent coupling is likely to become more complex, increasing the declarative syntax and noising the overall intent. Each service may end up with a bunch of heterogenous environment variables to cope with, such as those specific to observability (o11y) or Identity Access Management (IAM), or be adorned with an ever growing depends_on section to materialize dependencies. It becomes both hard to read and hard to maintain. Moreover, it becomes harder to operate. Sometimes we would like to work on a subset of the whole ecosystem. One may rely on profile facility to do so but it is not that straightforward, as it complicates both the Docker compose file structure while noising the downstream command line. And imagine we need a couple of satellite containers to ease development. They will in turn grow Docker compose file content. And be instantiated every time unless you also provide dedicated policy and thus burden the whole thing.