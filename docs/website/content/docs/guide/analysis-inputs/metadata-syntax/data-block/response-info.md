---
title: Response info
weight: 1
bookToc: true
---

# Response information

Here is the first few lines of the data block for a model of count-type data at Rocky Mountain Network called `rich.yml`, which lives in the directory `config/ROMN/LIBI`

```YAML
# ==== DATA ===================================================================

response info:
    file: data/ROMN/LIBI_richness_20171208_r.csv
    state variable:
        response column:
            - native.rich
            - native.forb.rich
        description:
            - Native species richness
            - Native forb species richness
    sampling method: plot
    sample id column(s):
        - Transect
        - Plot
```
