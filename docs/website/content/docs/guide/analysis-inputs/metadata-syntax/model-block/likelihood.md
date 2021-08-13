---
title: Likelihood
weight: 1
bookToc: true
---

Likelihood

# Likelihood (data model)

    likelihood:
        - binomial
        - beta-binomial

Options:  

**Discrete random variables**

_Counts_ (see [counts]({{< ref "/docs/guide/model-info/data-types/counts.md" >}}))
- `poisson`
- `negative-binomial`
- `gen-pois`
- `zero-inflated-poisson`
- `zero-inflated-negative-binomial`

_The number of successes in a fixed number of trials_
Each trial has one of two possible outcomes: success (1) or failure (0). In this case we model the probability of success {{< katex >}}p{{< /katex >}} on any given trial. Examples include point intercept data, etc.
- `binomial`
