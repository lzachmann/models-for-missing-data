---
title: Covariate data
weight: 2
---

# Covariate data

Covariates are variables that are expected to change with the response variable -- they _covary_ with in some way with the observations we seek to model. The definition of a covariates varies widely online and in the literature. For our purposes, we use the term _covariate_ to describe any variable (whether continuous or discrete) that might influence the mean of the response variable we are interested in. In many cases their effects are of direct interest in the analysis (weather or terrain, for instance). In other cases, a covariate might be "nuisance variable" -- a fact or feature that is of no particular interest in itself, but nonetheless might be necessary to build a proper model and develop robust inference. Examples of nuisances include sudden changes in protocol or observers.

Covariates can be static or dynamic. A variable like the elevation of site varies from site to site, but not in time (at least on the time scales we are interested in). Variables involving weather, such as precipitation, are more interesting. A long-run summary (e.g., 30-year average rainfall), like our static terrain variable, might only vary in space. However, an annualized metric will vary in time and space.

The _granularity_ of information can also vary. Sometimes the information we have is rather coarse, so many sites have the same value. Gridded climate data are an excellent example of relatively coarse (e.g., 1km gridcell) data. Adjacent sites falling into the same gridcell will have the same value. 

## Format
As with the [response data]({{< ref "/docs/guide/data/y-info.md" >}}), covariates are typically stored as flat files.

## Example