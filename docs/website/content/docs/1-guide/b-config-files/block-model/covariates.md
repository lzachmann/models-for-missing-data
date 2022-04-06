---
title: Covariates
weight: 5
---

# Covariates
The predictors to use for modeling the mean of the response variable.

## Syntax

```yml
additional covariates:
    - Botanist (JA)
    - Botanist (JA), deficit.pregr
```

## Usage
For categorical variables (e.g., `Botanist`), the optional parenthetical declaration can do one of two things.
1. It sets the reference level for dummy-coded variables. In the case of `Botanist (JA)`, the reference level becomes the botanist with initials `JA`. If not specified, the reference level will be set using R's default handling for factors (using the first level of the factor sorted in ascending alphabetical o.rder as the reference level)
2. It can also be used to implement sum-to-zero effect coding, which we call deflections. For instance `MgmtZone (deflections)`. In the case of deflections, the coefficients for each level of the categorical variable sum to zero. By default the model returns only the first {{< katex >}}k-1{{< /katex >}} coefficients, but the {{< katex >}}k^{\mathrm{th}}{{< /katex >}} coefficient can be computed as a derived quantity. See [this StackExchange post](https://stats.stackexchange.com/a/163148) for more on this calculation.

See [this resource](https://stats.oarc.ucla.edu/spss/faq/coding-systems-for-categorical-variables-in-regression-analysis) for additional background on dummy vs effect coding.

Interaction terms can be specified using "star" notation. So a `Botanist (JA), deficit.pregr` specification would produce a botanist-by-deficit interaction term. Note that there is no automatic expansion for the main effects, so a more complete specification would entail something like the following:

```yml
additional covariates:
    - Botanist (JA), deficit.pregr, Botanist (JA) * deficit.pregr
```