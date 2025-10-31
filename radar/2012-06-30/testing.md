---
title: Unit Testing
ring: assess
quadrant: staples
tags: [NOVICE]
---

[![](https://img.shields.io/badge/xunit-0c7cba?logo=gitbook&logoColor=000&style=flat)](https://xunit.net/?tabs=cs)

Discover the joy of testing! Testing is not just a practice; it's a mindset that transforms how we build software. By embracing testing, we ensure our code is reliable, maintainable, and robust.

```cs
public void DivideWorks()
{     
   var calculator = new Calculator();
   Assert.Equal(5, sut.Divide(15, 3)); 
}
```