---
title: Likelihood function
weight: 1
---

# Likelihood function

The likelihood statement specifies the probability distribution that will be used to describe the response variable. The available options depend on your data, so knowing what [type of variable]({{< ref "/docs/guide/data/types-of-random-variables/_index.md" >}}) you're working with is essential.

## Syntax

```yml
# Likelihood. For counts, one or both of: poisson, negative-binomial.
likelihood:
    - poisson
    - negative-binomial
```

## Usage

In some cases -- a model for soil stability observations -- there is only one plausible, implemented likelihood function (`ordinal-latent-normal`). In other cases -- species richness -- there might be several available options (`poisson`, `negative-binomial`, and their zero-inflated counterparts). In cases where you specify multiple likelihoods, the model API will create a separate analysis for each, and the relative performance of each can be evaluated using model diagnostics, posterior predictive checks, and information criteria.

## Options
| Option  | Description  | Example  |
|:--------|:-------------|:---------|
| `beta`  | Continuous variables with values between 0 and 1  | Ocular cover  |
| `beta-binomial`[^1]  | [Overdispersed binomial data](https://en.wikipedia.org/wiki/Overdispersion#Binomial)  |   |
| `binomial`  | "Successes" in a given number of trails  | The number of "hits" of invasive species in {{< katex >}}n{{< /katex >}} point intercepts along a transect  |
| `gamma`[^2]  | Continuous, non-negative quantities  |   |
| `gen-pois`  | Underdispersed count data  |   |
| `hurdle-ordinal-latent-beta`  | Ordinal data arising from a beta distributed latent variable  | Plant cover measured using Daubenmire cover classes  |
| `lognormal`[^3]  | Continuous, non-negative quantities  |   |
| `negative-binomial`  | Overdispersed counts (with support for either fixed stratum-level or hierarchical site-level variances modeled using a moment match for {{< katex >}}\kappa{{< /katex >}}) |   |
| `negative-binomial-simple`  | Overdispersed counts (with fixed stratum-level dispersion modeled directly using {{< katex >}}\kappa{{< /katex >}})  |   |
| `ordinal-latent-normal`  | Ordinal data arising from a normally distributed latent variable  | Soil stability  |
| `poisson`  | Counts  | Richness or shrub density  |
| `zero-inflated-beta-binomial`  | Binomial data that exhibit overdispersion _and_ excess zeros  |   |
| `zero-inflated-binomial`  | Binomial data with an excess of zero counts  |   |
| `zero-inflated-negative-binomial`  | Count data that exhibit overdispersion _and_ excess zeros  |   |
| `zero-inflated-poisson`  | Count data with an excess of zero counts  |   |

[^1]: A misnomer. We don't use the canonical beta-binomial parameterization. It was too slow / unwieldy. Instead, we use a binomial model with an extra epsilon term in the model for the mean.
[^2]: "The log of a lognormal random variable is... normal. It's symmetric." See Glen_b's answer [here](https://stats.stackexchange.com/a/72399).
[^3]: "The log of a gamma distributed random variable is left-skew. Depending on the value of the shape parameter, it may be quite skew or nearly symmetric." See again Glen_b's answer [here](https://stats.stackexchange.com/a/72399).
