---
author: Luke Zachmann
title: Stratum-varying fixed effects
weight: 7
categories: background
tags:
  - statistics
  - parameterizations
---

Assume we have three strata, {{< katex >}}s_0{{< /katex >}}, {{< katex >}}s_1{{< /katex >}}, and {{< katex >}}s_2{{< /katex >}}, where {{< katex >}}s_0{{< /katex >}} is the "reference" stratum – in other words, {{< katex >}}s_0{{< /katex >}} is the stratum for which the 0/1 indicator is 0 across the board in the indicator matrix below (the first row):

{{< katex display >}}
\begin{bmatrix}
1 & 0 & 0 \\
1 & 1 & 0 \\
1 & 0 & 1
\end{bmatrix}
{{< /katex >}}

```R
B_0 + (B_1 + B_1_s1_offset * s1 + B_1_s2_offset * s2) * x_1  

# in stratum s0
B_0 + (B_1) * x_1  

# in stratum s1
B_0 + (B_1 + B_1_s1_offset * s1) * x_1  

# in stratum s2
B_0 + (B_1 + B_1_s2_offset * s2) * x_1  

# lm(y~x1*x2)
model.matrix(~x1*x2, tibble(x1 = runif(5), x2 = runif(5)))
```
