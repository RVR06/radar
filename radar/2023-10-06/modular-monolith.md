---
title: Modular Monolith
ring: adopt
quadrant: staples
---

[![](https://img.shields.io/badge/blog%20post-0c7cba?logo=gitbook&logoColor=000&style=flat)](https://archicionado.com/p/modular-monolith/)
[![](https://img.shields.io/badge/google%20service%20weaver-ef8d22?logo=hackthebox&logoColor=000&style=flat)](https://opensource.googleblog.com/2023/03/introducing-service-weaver-framework-for-writing-distributed-applications.html)
[![](https://img.shields.io/badge/microsoft%20orleans-ef8d22?logo=hackthebox&logoColor=000&style=flat)](https://learn.microsoft.com/en-us/dotnet/orleans/overview)

Underlying idea is to operate a clear split between the way software is composed, from the way it is deployed. The way we chunk software into modules, fragment, staples, whatever the taxonomy we pick should not be correlated to the way those chunks will be assembled or deployed downstream. We should not make upstream assumptions regarding those aspects, because they may introduce more issues or biases than they planned to solve at the beginning. At this stage, you should think that it looks - a lot - like micro-services pattern. And you are right. But where the approaches differ is regarding the fact that the weaving stage is considered not only as a first-class citizen here but as a building block. Therefore, it implies you will have to leverage a structuring backbone to build upon and offload assembly and deployment facilities to. It is no more only standards (REST, gRPC, …) to obey and later figuring out how to efficiently assemble them.
