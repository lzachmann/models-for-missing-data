---
title: Covariate data
weight: 2
---

# Covariate data

Covariates are variables that are expected to change with the response variable -- they _covary_ in some way with the observations we seek to model. The definition of covariates varies widely online and in the literature. For our purposes, we use the term _covariate_ to describe any variable (whether continuous or discrete) that might influence the mean of the response variable we are interested in. In many cases their effects are of direct interest in the analysis (weather or terrain, for instance). In other cases, a covariate might be "nuisance variable" -- a fact or feature that is of no particular interest in itself, but nonetheless might be necessary to build a proper model and develop robust inference. Examples of nuisances include sudden changes in protocol or observers.

Covariates can be static or dynamic. A variable like the elevation of site varies from site to site, but not in time (at least on the time scales we are interested in). Variables involving weather, such as precipitation, are more interesting. A long-run summary (e.g., 30-year average rainfall), like our static terrain variable, might only vary in space. However, an annualized metric will vary in time and space.

The _granularity_ of information can also vary. Sometimes the information we have is rather coarse, so many sites have the same value. Gridded climate data are an excellent example of relatively coarse (e.g., 1km gridcell) data. Adjacent sites falling into the same gridcell will have the same value. 

## Format
As with the [response data]({{< ref "/docs/1-guide/a-data/i-y-info.md" >}}), covariates are typically stored as flat files.

## Example

<!-- d_raw <- read_csv('assets/uplands-data/ROMN/modified/LIBI_Covariates_WB_20210204.csv')
d <- d_raw %>% 
  select(MDCATY, SiteName, Year, Botanist, deficit.pregr) %>% 
  arrange(SiteName, Year) %>% 
  mutate(Row = row_number()) %>% 
  relocate(Row)
write_csv(bind_rows(head(d), tail(d)), 
          'docs/website/content/docs/guide/data/richness-covariates.csv') -->

The data below contain site (`SiteName`), stratum (`MDCATY`), time (`Year`), and covariate information (`Botanist` and `deficit.pregr`) for sites from Little Bighorn Battlefield National Monument (LIBI), in Montana. Here, we see the first and last six rows of the data.

|Row |MDCATY |SiteName|Year|Botanist|deficit.pregr|
|:----|:-------|:--------|:----|:--------|:-------------|
|1   |Gulley1|Grid_100|2009|DS      |418.7766661  |
|2   |Gulley1|Grid_100|2010|DS      |434.9612421  |
|3   |Gulley1|Grid_100|2011|JA      |408.9919742  |
|4   |Gulley1|Grid_100|2012|JA      |450.2639661  |
|5   |Gulley1|Grid_100|2013|JA      |532.0683071  |
|6   |Gulley1|Grid_100|2014|JA      |437.0008004  |
|...   |...|...|...|...      |...  |
|3240|Upland |LIBI_050|2014|JA      |381.9736062  |
|3241|Upland |LIBI_050|2015|JA      |328.6534898  |
|3242|Upland |LIBI_050|2016|JA      |431.6948948  |
|3243|Upland |LIBI_050|2017|JA      |402.8102409  |
|3244|Upland |LIBI_050|2018|JA      |393.2275301  |
|3245|Upland |LIBI_050|2019|JA      |247.7891026  |

It's worth pointing out a few things. First, we see two different types of variables --- a categorical variable containing the initials of the observing botanist (`Botanist`), and a continuous variable for pre growing season water deficit (`deficit.pregr`). Second, the spatial granularity of the covariates is limited to the site, but both variables appear to vary in time. Finally, we see more rows than we might expect based on the example data seen in the [response data]({{< ref "/docs/1-guide/a-data/i-y-info.md" >}}) section. The reason for this is two-fold:
1. The covariate data at a site include values for all years over the duration of the study, whether that site was sampled or not. In general, sites are visited on a rotating basis, meaning they're not sampled every year.
2. There are sites (e.g., `Grid_100`) that were _never_ sampled. We include this information because it's needed to make inference at the park scale, and because we're interested in making predictions of our focal response variables at every site on the landscape, whether it was visited by field crews or not. 

## From data to model

We'll see how to include covariates in models using the XX and YY blocks of the analysis config files in other sections of this guide. 