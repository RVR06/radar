---
title: Unit Testing
ring: adopt
quadrant: staples
tags: [EXPERT]
---

[![](https://img.shields.io/badge/AAA-0c7cba?logo=gitbook&logoColor=000&style=flat)](https://blog.ploeh.dk/2013/06/24/a-heuristic-for-formatting-code-according-to-the-aaa-pattern/) 
[![](https://img.shields.io/badge/DDT-0c7cba?logo=gitbook&logoColor=000&style=flat)](https://en.wikipedia.org/wiki/Data-driven_testing)
[![](https://img.shields.io/badge/moq-ef8d22?logo=hackthebox&logoColor=000&style=flat)](https://github.com/devlooped/moq)
[![](https://img.shields.io/badge/AutoFixture-ef8d22?logo=hackthebox&logoColor=000&style=flat)](https://github.com/AutoFixture/AutoFixture) 

Streamline test cases by following the F.I.R.S.T principle (Fast, Isolated, Repeatable, Self-validating, Timely) and proper taxonomy such as System Under Test (SUT) and the Arrange-Act-Assert (AAA) pattern. Train teams on advanced mocking frameworks like Moq to create flexible and maintainable tests. Leverage AutoFixture to automate test data generation, reducing boilerplate code and enhancing test readability. Adopt Data-Driven Testing (DDT) to efficiently validate multiple input scenarios, ensuring comprehensive coverage with minimal effort. 

```cs
[Theory]
[InlineData(194, 107, 37, "#C26B25")]
[InlineData(66, 138, 245, "#428AF5")]
public void Mapper(int r, int g, int b, string hex)
{
    var (sut, source, expected) = Arrange();    // ARRANGE
    var res = sut.Convert(source);              // ACT
    Assert.Equal(expected, res);                // ASSERT

    (Sut sut, Color1 color, Color2 color) Arrange()
    {
        // Do complex or verbose stuff eg:
        // Create SUT
        // Create C1 from hex
        // Create C2 from {r,g,b}
        return (s, c1, c2);
    }
}
```