---
title: Unit Testing
ring: adopt
quadrant: staples
tags: [PRACTITIONER]
---

[![](https://img.shields.io/badge/TDD-0c7cba?logo=gitbook&logoColor=000&style=flat)](https://en.wikipedia.org/wiki/Test-driven_development)

Testing provides several key benefits:
- **Fail-fast strategy** by exercising small units of code
- **Easier integration** by building on validated blocks
- **Regression protection** through guard clauses
- **Living documentation** that evolves with the code

```cs
[Theory]
[InlineData(4, 2, 2)]
[InlineData(15, 3, 5)]
public void DivideWorks(int a, int b, int expected)
{
   var calculator = new Calculator();
   Assert.Equal(expected, sut.Divide(a, b)); 
}


[Fact]
public void DivideByZeroThrows() 
{
   var calculator = new Calculator();
   Assert.Throws<DivideByZeroException>(() => sut.Divide(5, 0));
}
```