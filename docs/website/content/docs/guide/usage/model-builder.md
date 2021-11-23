---
title: Model builder
weight: 4
bookToc: true
---

# Model builder

The shell script `compile-jags-file.sh` builds JAGS model files using several
arguments. The arguments -- which correspond to the likelihood, the
deterministic function, group-level effects parameterization (random intercepts
and slopes vs. random intercepts only), the presence or absence of additional
covariates and, finally, the path to write to -- are supplied via the
'MODEL' block in the YAML file for an analysis. For purposes of development or
debugging, `compile-jags-file.sh` can be sourced from the command line with an
optional output directory as such:
```
./src/model-builder/compile-jags-file.sh \
    <likelihood> <deterministic-function> <group-level-effects> <covariates> \
    <write-path>
```
For example:
```
./src/model-builder/compile-jags-file.sh \
    poisson exponential b0-b1 w1 \
    assets
```

The model compiler supports both random intercepts (`b0`) or random intercepts / random slopes (`b0-b1`) models with and without covariates.
