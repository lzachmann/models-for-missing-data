---
title: Object types
bookCollapseSection: false
weight: 1
---

# Object types
There are two fundamental types of objects created by the model API. The objects are distinguished by their prefix -- either `hat` or `pred`. `hat`-type objects involve an evaluation of the mean over time, but holding any other covariates at their mean (or at zero, in the case of indicators / dummy variables). `pred`-type objects use the known values of each covariate, at each site and timestep, while evaluating the mean. This critical difference between object types produces outputs that we have colloquially referred to as "smooth" (`hat`) vs. "bumpy" (`pred`) results. The `hat` results are smooth because the only terms in play are the intercept and time slope. The `pred` results _can_ be bumpy _if_: 1) the covariates included are influential, and 2) they vary from year-to-year.

## Site, stratum, and park level inference
At the site-scale, we make predictions -- whether `hat` or `pred` -- only to sites that were sampled. At a stratum scale, things work a bit differently.

## Modifying the default behavior of `pred`-type means
Recall that `pred`-type means include _all_ of the covariates used in a model. There are times when some of our covariates might produce results that are less-than-interesting from an ecological perspective. This is often the case for a nuisance variable. Let's say we have two botanists, one of which was less experienced than the other, and tended to identify fewer species on average than the more experienced botanist. In a model of species richness, the default behavior of `pred`-type objects would produce means that "jump" up at sites / times in which the more experienced botanist was making observations, and down otherwise. These changes in the mean aren't being caused by ecological factors, they're entirely a result of the observer. We can change the way `pred`-type means are evaluated using the `trend conditions` block, described [here]({{< ref "/docs/1-guide/b-config-files/block-extras/conditions.md" >}}). This block of the analysis config file can also be used to "fix" continuous variables at a specific value.
