---
title: Functional Programming
ring: adopt
quadrant: staples
---

[![](https://img.shields.io/badge/101-0c7cba?logo=gitbook&logoColor=000&style=flat)](https://github.com/readme/guides/functional-programming-basics)

There are two main things you need to know to understand the concept:
- Data is immutable: If you want to change data, such as an array, you return a new array with the changes, not the original.
- Functions are stateless: Functions act as if for the first time, every single time! In other words, the function always gives the same return value for the same arguments.

There are three best practices that you should generally follow:
1. Your functions should accept at least one argument.
1. Your functions should return data, or another function.
1. Don’t use loops!