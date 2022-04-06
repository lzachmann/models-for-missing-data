---
title: Best practices
bookCollapseSection: false
weight: 3
---

# Best practices
Below, we present a generalized workflow for using this model API. Ideally, you've got some expertise or experience working with the data you're interested in modeling. Perhaps you know the ecological system, and may even have some sense for what the likely drivers of change or trend might be. 

## Exploratory data analysis

### The response data
We recommend taking a look at basic histograms of your response variable. If you don't know already, this is a great time to think about why [_type_ of data]({{< ref "/docs/1-guide/a-data/iii-types-of-random-variables/_index.md" >}}) you're working with. Is it a count, a proportion, or some other quantity? Look for signs of skewness or zero-inflation.

### The covariates
It may be helpful to evaluate the correlation between covariates and your response variable, and among covariates. Scatterplots of the response variable vs. each covariate can sometimes be illuminating.

## Existing analysis config files as templates
If your data type is similar to one of the demo datasets, it may make sense to create a copy of that analysis config file and modify it according to your needs.

## Model checking and evaluation
We recommend checking model convergence before doing anything else. 

### Failure to converge
If a model is failing to converge, it can be for all sorts of reasons. Sometimes there simply weren't enough MCMC iterations, or your inits were out of left field. If convergence issues affect specific parameters, it can be helpful to play around with different model parameterizations. Sometimes there's not enough trend of any sort to permit a random intercept / random slopes (`b0-b1`) model, for instance. (This can be verified by plotting the empirical means at each site over time, for example.) If you're seeing extreme "funnel" shapes in the funnel diagnostics, it may be helpful to try a non-centered parameterization. In yet other cases, it might be the prior(s). You can check if it's the priors by rerunning specific models ("model.jags" with modified priors) using the output directory and associated "calling-script.R".