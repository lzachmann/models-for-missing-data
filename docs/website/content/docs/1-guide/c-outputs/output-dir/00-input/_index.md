---
title: 00-input
bookCollapseSection: false
weight: 1
---

# 00-input | model inputs

R objects required to recreate analyses (JAGS inputs) and lookup tables.

| __File__ | __Description__ |
|---|---|
| calendar-and-relative-years.csv | Mappings of calendar year to (zero-indexed) relative year of the study |
|coda-vars.rds | A list of the variables for which coda samples are drawn |
|complete-covariates-data.csv | What is this file? |
|covariate-moments.rds | What is this file? |
| eval-mean-for-tv-covariates.rds | What is this file? |
| jags-data.rds | A list containing the data |
| jags-info.rds | Data frame containing the JAGS and CODA variables to be monitored, in addition to several other 'environment' settings/variables used during the original pass through the analysis pipeline |
| jags-inits.rds | A list containing initial values |
| jags-n-iters.rds | The number of iterations used for adaptation, burn-in, and subsequent sampling |
|jags-vars.rds | What is this file? |
| site-ids-and-indices.csv | Mappings of site IDs (typically character or non-sequential numeric IDs) to sequential indices |
| site-in-stratum-info.csv | Complete mappings of site IDs to indices, stratum IDs to stratum indices, and (most importantly, for our purposes) indices for sites within each stratum |
| state-variable-data-summary.txt | Used as a straight-face test for number of records, data types, etc. |
| state-variable-data.csv | The complete, pre-processed dataset used to construct many of the objects described above |
| stratum-ids-and-indices.csv | Mappings of stratum IDs (stratum names) to their corresponding sequential indices |
| vars-to-watch.txt | The names of variables to be monitored (and saved) by JAGS |
