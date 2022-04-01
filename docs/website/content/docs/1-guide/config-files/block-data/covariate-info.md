---
title: Covariate info
weight: 3
---

# Covariate info
Covariate information (`covariate info`), if provided, is joined to the response information prior to model fitting. It's used only in models for which predictors are specified.

```yml
covariate info:
    file: assets/uplands-data/ROMN/LIBI_Covariates_AllSitesAllYears_20201104_Through2016_with_exotics.csv
    event date info:
        date-time column: Year
        date-time format: Y!
```

As with the other statements in the data block, we point to the name of the covariate file (`file`; see the [covariate data]({{< ref "/docs/1-guide/data/x-info.md" >}}) section for more detail) and, if different from the date attributes in the response data, supply info required to properly parse covariate datetime fields.