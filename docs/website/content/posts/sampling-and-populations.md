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

We sample for a very practical reason. It's usually impossible to get information on the whole population, so we use a sample to make inferences about the population. In our case, the population is typically all sites in a stratum or all sites -- in all strata -- at the scale of an entire park. Typically, the inference we seek entails three questions.

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
> The sample standard deviation, {{< katex >}}s{{< /katex >}}, can give us information about the possible population standard deviation -- how spread the population is likely to be with respect to the measure of interest.

{{< katex display >}}
s=\sqrt{\frac{\sum{(x - \bar{x})^2}}{n-1}}
{{< /katex >}}

These three measures form the basic substrate of our understanding of the populations we are sampling, and are all essential to decision making.

Below, we consider three scenarios, sampling from an infinite population, a finite population, and the full population. The goal of the examples below is to show what sampling is all about. As we shall see, the finite population case is the bridge between the other two edge cases -- the infinite and full population instances.

# An infinite population
This is a very typical scenario. Of course, I'm not aware of any truly infinite populations. What we mean, instead, is that our sample of the population, {{< katex >}}n{{< /katex >}}, is small enough that... blah blah blah. As such, we can think of the population as at least _theoretically_ infinite.

{{< details title="Example" open=false >}}
## Estimate the average number of trees in sites
Given a sample of {{< katex >}}n=5{{< /katex >}} sites with observations..., the sample mean is XX. This our best estimate of the true population mean. But what is the population we are referring to? Well, it's all possible sites. Of course, there's not an infinite number of sites, but it's large enough that we can treat it as though it is infinite. How confident are we in this estimate? If we took a different sample, the sample mean would be different, but how different? This is where the standard error of the sample mean comes in...
{{< /details >}}

# A finite population[^2]
Not particularly common, but it's useful to look at because it ties together both the infinite population situation and the final example.

{{< katex display >}}
\text{SE}(\bar{x})=\frac{s}{\sqrt{n}}\sqrt{\frac{N - n}{N - 1}}
{{< /katex >}}

The standard error of the mean in this case will be less than in the infinite population case, because we have proportionately more information about the population that we do in the first example.

# The full population

Technically no longer a sample. We have the full population in hand. There's no observations that site outside of the sample that we care about.

{{< katex display >}}
\mu=\frac{\sum{x}}{N}
{{< /katex >}}

How confident are we in this estimate? Perfectly confident: {{< katex >}}\text{SE}(\mu)=0{{< /katex >}}! Why? We can still think of this as a sample from a finite population, but the number of observations in the sample _equals_ the number of observations in the population. The formula for the standard error of the mean for a finite population still applies. The numerator in the second term {{< katex >}}N-n{{< /katex >}} becomes zero, and the whole thing collapses to zero.[^3]

We can find the population standard deviation.

{{< katex display >}}
\sigma=\sqrt{\frac{\sum{(x - \mu)^2}}{N}}
{{< /katex >}}

[^1]: Note that part of the {{< katex >}}\text{SE}(\bar{x}){{< /katex >}} is in fact {{< katex >}}s{{< /katex >}}.
[^2]: Sometimes called "sampling without replacement".
[^3]: Note that the same basic reasoning can be applied to the first example, as well. If we were to look at an infinite population and sub in Inf for the capital Ns. The second term resolves to 1. Inf on inf is going to be 1, the sqrt of which is also 1, so the second term dissapears and you're left with the original formula for the standard error.
