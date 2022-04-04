---
title: Finite population correction
weight: 2
---

# Finite population correction
When the size of the sample collected is a significant proportion of the overall population, then we must use a finite population correction, a topic we introduce briefly in [another post]({{< ref "/posts/sampling-and-populations.md" >}}).

## Syntax
```yml
finite population correction: true
finite population info:
    file: assets/uplands-data/ROMN/LIBI_SampledUnsampled_Ratio.csv
    columns with the number of sampled and unsampled sites:
       - '# sampled sites'
       - '# unsampled sites'
    covariate info includes unsampled sites: true
```

## Usage
