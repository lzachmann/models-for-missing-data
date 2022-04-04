---
title: Posterior predictive checks
weight: 4
---

# Posterior predictive checks
By default, the posterior predictive checks produced by the model API include `stratum_id` and `unit_code`. We include these elements by default because they correspond directly to subscripts in the model. You can specify additional variables for post-hoc model checking via `ppc facets`.

## Syntax
```yml
ppc facets:
  - cal_year
```

## Usage
Values under `ppc facets` correspond to columns from the original response or covariate data. When supplied, the [output directory]({{< ref "/docs/1-guide/c-outputs/output-dir/02-checking/_index.md" >}}) will include additional checks. In the example above, you would see a folder named "ppc/cal_year" appear beneath "02-checking" with -- in this case -- test statistics for each calendar year.

