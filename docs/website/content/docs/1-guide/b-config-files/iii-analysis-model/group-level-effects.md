---
title: Group-level effects
weight: 3
---

# Group-level effects

The basic motivation for random group-level effects is that sites matter. They are an essential feature of the sampling design. Having no such random effects would imply that sites don't matter and observations can be pooled (as if they were collected from a completely random sample).[^1] 

Group-level effects incorporate differences among sites (that may be impossible to model with covariates) to inform park-level trends. They allow each site to have its intercept (and potentially, its slope) drawn from a common / underlying distribution of intercepts (and slopes). We make inference at the park scale using the parameters of the distribution from which the individual site intercepts and slopes are drawn.

## Syntax

```yml
group-level effects:
    - b0
    - b0-b1
```

## Usage

In cases where you specify multiple group-level effects, the model API will create a separate analysis for each, and the relative performance of each can be evaluated using model diagnostics, posterior predictive checks, and information criteria.

## Options

### The usual case

| Option  | Description  | Use case  |
|:--------|:-------------|:---------|
| `b0`  | Random intercept |   |
| `b0-b1`  | Correlated random intercept _and_ random time slope  |   |
| `none`  | No random effects, intercept and time slope terms are fixed | Used only when a model includes terms (e.g., for management zone) that create strong, irresolvable identifiability problems for the default group-level effect terms  |

### For `hurdle-ordinal-latent-beta` models

The beta-hurdle model adds an additional `group-level effects` statement called `group-level effects (zeros)`. This statement controls group-level effects on the occurrence process (the hurdle).

| Option  | Description  | Use case  |
|:--------|:-------------|:---------|
| `g0`  | Random intercept for occurrence |   |
| `g0-g1`  | Correlated random intercept _and_ random time slope for occurrence  |   |

[^1]: Although the mean over time predicted by a pooled and a hierarchical model may not differ substantially, the pooled model fails to properly represent uncertainty. This problem is espcially pronounced when there are conflicting trends among sites, which a pooled model inappropriately ignores.