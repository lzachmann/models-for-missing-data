---
title: 01-diagnostics
bookCollapseSection: false
weight: 2
---

# 01-diagnostics | model diagnostics

Diagnostics are applied to monitor whether the Markov chains have converged.

| __File__ | __Description__ |
|:---|:---|
| convergence-diagnostics.txt | The Gelman and Rubin (1992) potential scale reduction statistic, {{< katex >}}\hat{R}{{< /katex >}}, for selected parameters. {{< katex >}}\hat{R}{{< /katex >}} measures the ratio of the average variance of samples within each chain to the variance of samples pooled across all chains. If the chains have converged to a common distribution, {{< katex >}}\hat{R} \simeq 1{{< /katex >}}, otherwise {{< katex >}}\hat{R} > 1{{< /katex >}}. We hope to see {{< katex >}}\hat{R} < 1.1{{< /katex >}}. |
| funnel/ |  |
| trace/ | Traceplots of parameter draws (for the parameter named *) |
