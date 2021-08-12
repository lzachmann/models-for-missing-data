---
author: Luke Zachmann
title: Sampling and populations
weight: 4
categories: background
tags:
  - statistics
  - sample
  - population
---

We sample for practical reasons. It's usually impossible to get information on the whole population, so we use the sample to make inferences about the population. In our case, the population is typically all sites in a stratum or all sites -- in all strata -- in a park unit. What do we mean by inferences? Once we have a sample, typically we have three questions.

1. What's the best estimate of the population mean?  
> We can generate a sample mean, {{< katex >}}\bar{x}{{< /katex >}}, from our sample. This is the best estimate of the population mean.  

{{< katex display >}}
\bar{x}=\frac{\sum{x}}{n}
{{< /katex >}}

2. How confident are we about that estimate?  
> Because we have a small sample, we can't be sure the sample mean is exactly the population mean. There's uncertainty around that estimate. The standard error of the sample mean, {{< katex >}}\text{SE}(\bar{x}){{< /katex >}}, relates to how uncertain we are about our estimate. The higher it is, the more uncertain we are that our sample mean reflects the true population mean. Small samples generally yield larger standard errors.  

{{< katex display >}}
\text{SE}(\bar{x})=\frac{s}{\sqrt{n}}
{{< /katex >}}

3. What is our best estimate of the population standard deviation?[^1]  
> The sample standard deviation, {{< katex >}}s{{< /katex >}}, can give us information about the possible population standard deviation -- how spread the population is likely to be.

{{< katex display >}}
s=\sqrt{\frac{\sum{(x - \bar{x})^2}}{n-1}}
{{< /katex >}}

Although it may be entirely self-evident to some, it's worth taking a moment to consider why these are the sorts of inferences we actually want. Blah blah.

Below, we consider three scenarios, sampling from...

# An infinite population
At least a theoretically infinite population. This is a very typical scenario. Of course, I'm not aware of any truly infinite populations. What we mean, instead, is that our sample of the population, {{< katex >}}n{{< /katex >}}, is small enough that...

{{< details title="Example" open=false >}}
## Estimate the average number of trees in sites
Given a sample of {{< katex >}}n=5{{< /katex >}} sites with observations..., the sample mean is XX. This our best estimate of the true population mean. But what is the population we are referring to? Well, it's all possible sites. Of course, there's not an infinite number of sites, but it's large enough that we can treat it as though it is infinite. How confident are we in this estimate? If we took a different sample, the sample mean would be different, but how different? This is where the standard error of the sample mean comes in...
{{< /details >}}

# A finite population[^2]
Not particularly common, but it's useful to look at because it ties together both the infinite population situation and the final example.

# The full population

[^1]: Note that part of the {{< katex >}}\text{SE}(\bar{x}){{< /katex >}} is in fact {{< katex >}}s{{< /katex >}}.
[^2]: Sometimes called "sampling without replacement"
