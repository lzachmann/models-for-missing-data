---
title: 01-diagnostics
bookCollapseSection: false
weight: 2
bibFile: content/posts/bib.json
---

# 01-diagnostics | model diagnostics

## Overview

Diagnostics are applied to monitor whether the Markov chains have converged.

| __File__ | __Description__ |
|:---|:---|
| funnel/ | Full plots |
| trace/ | Traceplots |
| convergence-diagnostics.txt | The Gelman and Rubin {{< cite "-gelman1992inference" >}} potential scale reduction statistic, {{< katex >}}\hat{R}{{< /katex >}}, for selected parameters. {{< katex >}}\hat{R}{{< /katex >}} measures the ratio of the average variance of samples within each chain to the variance of samples pooled across all chains. If the chains have converged to a common distribution, {{< katex >}}\hat{R} \simeq 1{{< /katex >}}, otherwise {{< katex >}}\hat{R} > 1{{< /katex >}}. We hope to see {{< katex >}}\hat{R} < 1.1{{< /katex >}}. |

## Subdirectories

### funnel/ | funnel plots
Bivariate scatter plots created by plotting the posterior values of "local" parameters (a group-level effect for site {{< katex >}}j{{< /katex >}}) against a "global" scale parameter on which it depends ({{< katex >}}\sigma_{\beta_0}{{< /katex >}}). The problem that these plots are designed to detect is discussed [here]({{< ref "/docs/1-guide/b-config-files/iv-analysis-extras/nc-param/_index.md" >}}). The issues presented by strong funnel-like shapes in these scatterplots can be resolved with the non-centered parameterization.

### trace/ | traceplots
The traceplot is essentially a time series plot of the Markov chains. It shows the evolution of a parameter vector over the MCMC iterations of each Markov chain. We're hoping to see the chain exploring the same region of parameter values, with good mixing.

## References

{{< bibliography cited >}}
