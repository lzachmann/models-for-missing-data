---
title: 03-inference
bookCollapseSection: false
weight: 3
bibFile: content/posts/bib.json
---

# 03-inference | model inference

## Overview

Tabular and graphical summaries of Markov chain Monte Carlo (MCMC) draws from the posterior distribution of the parameters of a Bayesian model. The asterisk corresponds to the coefficients.  

| __File__ | __Description__ |
|:---|:---|
| coef/ | Model coefficients |
| me/ | Marginal effects |
| park/ | Park-level inference |
| site/ | Site-level inference |
| strata/ | Stratum-level inference |
| zone/ | Zone-level inference |
| coda-samples-quantiles.csv | Quantiles of the posterior distribution of key variables / parameters  |
| coda-samples-summary.txt | Descriptive statistics and quantiles of the posterior distribution of key variables / parameters |

## Subdirectories

### coef/ | model coefficients

| __File__ | __Description__ |
|:---|:---|
| additional-coef-estimates-Beta-untransformed.png | The posterior distribution of fixed effect (covariate) terms.  |
| beta-coef-estimates-untransformed.png | The median (points) and 95% equal-tailed credible intervals for group-level (random) effects. When the model is `b0` only the intercepts ({{< katex >}}\beta_{0j}{{< /katex >}}) will vary by site within each stratum. When the model is `b0-b1` both intercept ({{< katex >}}\beta_{0j}{{< /katex >}}) and time-slope terms ({{< katex >}}\beta_{1j}{{< /katex >}}) will vary by site (with correlation {{< katex >}}\rho{{< /katex >}}).  |
| hypers-hist-*.png | The hyper-distribution of random intercepts ("hypers-hist-B0.png") or random time-slope terms ("hypers-hist-B1.png") for each stratum  |

### park/ | park-level inference
Park-level mean of the response over time. Subfolders include results for all possible sites ("all") and sampled sites ("sampled"). Unless you have provided covariates for all sites, inference with covariates (the `pred` files) will be limited to sampled sites.

In the file names below, the first asterisk corresponds to either `hat` or `pred`. The `hat` files hold any covariates present at their mean (essentially removing -- or controlling for -- the effect of changes in the covariates over time). The `pred` files (_if_ present) correspond to predictions of park-level means conditional on the actual time-varying values of covariates -- AKA "bumpy plots." The uncertainty intervals, sometimes called "credible intervals", are derived using the 95% [Highest (Posterior) Density Intervals](https://cran.r-project.org/web/packages/HDInterval/index.html), by default (dotted black lines). The median is shown in the solid black line. If "out of sample" (`oos`) JAGS objects, exist, results are provided both for the expected value (i.e., for the mean) of new observations as well as the value of new observations themselves {{< cite "hobbs2015bayesian" 197 >}}.


| __File__ | __Description__ |
|:---|:---|
| *-park-mean-annual-summary-hdi95.csv | Annual estimates of status (median, lower and upper credible intervals).  |
| *-park-mean-plot-hdi95.jpg | Graphical representations of the RDS file. In the figures, the semi-transparent thin lines are draws from the posterior distribution of the park-level mean; the thick, solid dark line is the median of the mean and the thick, dashed lines correspond to the 95% HDIs at each timestep. |
| *-park-mean-plot-objects-hdi95.rds| The data required to reproduce the plot. |

## References

{{< bibliography cited >}}