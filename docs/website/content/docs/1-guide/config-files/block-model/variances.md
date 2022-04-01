---
title: Variances
weight: 4
---

# Variances
As with group-level effects for the intercept or time slope terms, each site can also have its own variance. 

## Syntax

```yml
variances:
    stratum-level fixed:
      level: stratum
      type: fixed
      response column(s):
          - native.rich
          - native.forb.rich
    site-level hierarchical:
      level: site
      type: hier
      response column(s):
          - native.rich
          - native.forb.rich
```

## Usage
The entries beneath `response column(s)` _have_ to be column names, not variable descriptions. The model API will create all combinations of models specified in these blocks. Thus, in the example above, we would obtain four distinct models.

If the `variances` statement is omitted altogether, the default behavior of the model API is to fit a model with fixed stratum-level variances. In other words, observations from all sites within a stratum are assumed to have the same variance.

Note that the parameterization for the variances of observations depends on the probability distribution being used. In the Poisson, for instance, the mean equals the variance. If there are hierarchical terms in the model for the mean, then in some sense the variance is also hierarchical, but there is no option to model the variances independently of mean.

