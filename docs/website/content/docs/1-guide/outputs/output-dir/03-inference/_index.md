---
title: 03-inference
bookCollapseSection: false
weight: 3
---

# 03-inference | model inference

## Overview

Tabular and graphical summaries of Markov chain Monte Carlo (MCMC) draws from the posterior distribution of the parameters of a Bayesian model. The asterisk corresponds to the coefficients.  

| __File__ | __Description__ |
|:---|:---|
|  |  |
|  |  |
|  |  |
|  |  |
|  |  |
|  |  |
| coda-samples-quantiles.csv | Quantiles of the coda samples, by variable  |
| coda-samples-summary.txt | Descriptive statistics and quantiles of the coda samples, vy variable |
| hypers-hist-*.png | what is this?  |
| pairs-*.png | what is this?  |

## Subdirectories

### op/ | observed vs. predicted plots

| __File__ | __Description__ |
|:---|:---|
| op-y-rep.jpg | A scatterplot of observed ({{< katex >}}y{{< /katex >}}-axis) vs. the median predicted ({{< katex >}}x{{< /katex >}}) values. The horizontal lines / whiskers around each point correspond to the 95% HDI for the {{< katex >}}y^{rep}{{< /katex >}}'s associated with each observation. |

### ppc/ | posterior predictive checks
Graphical displays comparing the observed data to data simulated from the posterior predictive distribution. For mixed models, there will be files for each of the distributions. If the model fits well, we should be able to use it to generate data that looks a lot like the data we have in-hand.
Subfolders for outputs by stratum and unit.
| __File__ | __Description__ |
|:---|:---|
| y-rep-bayes-p-by-stratum_id[unit_code].csv |  Bayesian p values for mu and sigma by stratum or unit code|
| y-rep-by-stratum_id[unit_code]-9-draws.jpg | Separate histograms of {{< katex >}}y{{< /katex >}} and some ({{< katex >}}n=9{{< /katex >}}) of the {{< katex >}}y^{rep}{{< /katex >}} datasets |
| y-rep- by-stratum_id[unit_code]-stats.jpg | The distribution of test statistics. The solid, vertical line is the value of the test statistic computed from the observed data, {{< katex >}}y{{< /katex >}}, while the underlying bars represents the distribution of the test statistic in the {{< katex >}}y^{rep}{{< /katex >}} simulations. |

### variography/ | Spatial autocorrelation
 
| __File__ | __Description__ |
|:---|:---|
| residuals-df.rds | Residuals (for each transect?) for each sampling event. Used as input to variograms. |
| variograms.png | Figure shows degree of spatial autocorrelation in data, semi-variance by distance by direction or by any direction. Note that the default is to evaluate up to 1/3 of the total distance represented in the data.  |
