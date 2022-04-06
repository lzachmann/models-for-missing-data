---
title: Posterior predictive checks
weight: 4
---

# Posterior predictive checks
By default, the posterior predictive checks produced by the model API include `stratum_id` and `unit_code`. We include these elements by default because they correspond directly to subscripts in the model. You can specify additional variables for post-hoc model checking via `ppc facets`.
Performing posterios predictive checks is an essential step in modeling process. These checks essentially allow you to evaluate whether your model
can generate new data that are similar to your observed data. The posterior predictive check process involves generating many new data sets from 
your model from what is called the posterior predictive distribution, and comparing charateristics (e.g. the mean and/or variance of the data set)
of those simulated data sets those same characteristics of data used for model fitting. If you have a very good model that fits your data well,
then in the case of the mean, you should expect the true mean of your data set to fall right around the 50th percentile of the distribution of 
means from the simulated datasets (the same goes for variance or other quantites). A posterior predictive check identifies this quantile (which
is often referred to as a Bayesian p value). A Bayesian p value that is very close to 0 or 1 (a rule of thumb that is often used is greater than 
0.8 or less than 0.2) may suggest a poor model fit.

## Syntax
```yml
ppc facets:
  - cal_year
```

## Usage
Values under `ppc facets` correspond to columns from the original response or covariate data. When supplied, the [output directory]({{< ref "/docs/1-guide/c-outputs/output-dir/02-checking/_index.md" >}}) will include additional checks. In the example above, you would see a folder named "ppc/cal_year" appear beneath "02-checking" with -- in this case -- test statistics for each calendar year.

