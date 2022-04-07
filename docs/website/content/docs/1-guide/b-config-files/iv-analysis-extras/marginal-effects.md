---
title: Marginal effects
weight: 3
---

# Marginal effects
Summaries of the association between a change in a regressor and a change in the response variable.

## Syntax
```yml
drivers: true
```

## Usage
When `drivers: true`, the model API creates additional JAGS objects, which are used to evaluate the marginal effects of explanatory variables in the model. By default, it shows the effect of each variable over its empirical range, holding all other variables at zero (the mean of scaled continuous variables or the reference level of categorical variables).

{{< notice note >}}
The behavior of `drivers: true` depends on the type of variable. The effects of continuous variables are shown on their original scale. The effect of indicator variables is shown on a 0-1 scale. Interaction terms are (perhaps unhelpfully) left in scaled form, and require additional work to plot properly. See [this write-up](https://cran.r-project.org/web/packages/sjPlot/vignettes/plot_interactions.html) for more!
{{< /notice >}}

There is an additional, optional statement called `crossings` that can be called alongside `drivers` to evaluate different combinations of explanatory variables. For instance, if we are interested in the effect of {{< katex >}}x_1{{< /katex >}} not just at the mean of {{< katex >}}x_2{{< /katex >}} (i.e., when {{< katex >}}x_2=0{{< /katex >}}), but when {{< katex >}}x_2=\mathrm{min}(x_2){{< /katex >}} or {{< katex >}}x_2=\mathrm{max}(x_2){{< /katex >}}, we would specify:

```yml
drivers: true
crossings:
    - min_seen
    - zero
    - max_seen
```

{{< notice warning >}}
We do not recommend using `crossings` unless that specific line of inference is needed, as it can drastically increase model run times and the size of the model object.
{{< /notice >}}
