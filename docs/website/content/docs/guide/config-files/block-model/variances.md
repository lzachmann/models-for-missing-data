---
title: Variances
weight: 4
---

# Variances
Variance structures...

## Syntax

```yml
variances:
    stratum-level fixed:
      level: stratum
      type: fixed
      response column(s):
          - native.rich
          - native.forb.rich
    site-level hierarchical:
      level: site
      type: hier
      response column(s):
          - native.rich
          - native.forb.rich
```

## Usage
These _have_ to be column names, not variable descriptions.