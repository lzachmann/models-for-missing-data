---
title: Types of random variables
bookCollapseSection: false
weight: 3
---

# Types of random variables

Understanding the type of data you are working with will be extremely important as we begin to define models. An important term to introduce at this point is variable _support_. The support of a variable describes the types of values that individual observations can assume. When modeling a random variable, you must choose a probability distribution with the same support. Arguably the most prevalent and useful probability distribution is the normal distribution, which has "real" support, meaning that it can take on any value from {{< katex >}}-\infty{{< /katex >}} to {{< katex >}}+\infty{{< /katex >}}. In many cases, variables in the real world can't take on negative values (e.g., tree height), so the researcher must transform them (e.g., by taking the natural log) prior to fitting models if they wish to use a normal distribution. This isn't always necessary, however, as there are some probability distributions, such as the gamma and lognormal, that have support for continuous values greater than 0, so they will work with variables with matching support "out of the box" without any need for transformation prior to model fitting. In ecology, some variables, typically proportions, can have 0-1 support, meaning that they can take on any value between 0 and 1, including 0 and 1. A beta distribution can be used to model this type of variable.

In addition to continuous random variables, there are also discrete random variables, which are typically used to describe counts. Some counts, such as population, can take on any integer greater than or equal to 0. A Poisson or negative binomial distribution can be used to model these variables. Other counts, for example the number of visits out of a total of {{< katex >}}N{{< /katex >}} in which an animal was observed, have a maximum value. In these cases a binomial distribution can be used which can take on any number between and included 0 and {{< katex >}}N{{< /katex >}}. The last common discrete variable in ecology is a binary one, in which the response can be either 0 or 1 (e.g., presence of a species within a plot). For these variables, the Bernoulli distribution can be used.

More details on different probability distributions are shown in the tables below. Click on the images to display an enlarged version in a new tab in your web browser.

## Continuous random variables 

{{< figure src="continuous-distributions.png" link="continuous-distributions.png" target="_blank" >}}

## Discrete random variables 

{{< figure src="discrete-distributions.png" link="discrete-distributions.png" target="_blank" >}}

## True or extra zeros
There are occasions when we need to accommodate "true" zeros or extra zeros. In these cases, we need to use either hurdle or zero-inflated models. From [wikipedia](https://en.wikipedia.org/wiki/Hurdle_model): 
> Hurdle models differ from zero-inflated models in that zero-inflated models model the zeros using a two-component mixture model. With a mixture model, the probability of the variable being zero is determined by both the main distribution and the mixture weight.
We'll see references to these types of models as we begin to talk about specific [likelihood functions]({{< ref "/docs/1-guide/b-config-files/iii-analysis-model/likelihood-function.md" >}}).
