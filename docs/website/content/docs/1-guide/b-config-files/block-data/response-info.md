---
title: Response info
weight: 1
---

# Response information

## The usual case
In the usual case, we are working with a single vector of observations (a single column of data in a flat file). Below, we see the first few lines of the data block for an analysis of count-type data from Little Bighorn Battlefield National Monument (LIBI), in Montana (a park within the Rocky Mountain Network). The file, `rich.yml`, lives in the directory `assets/uplands-config/ROMN/LIBI`.

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

The `response info` section of the data block specifies the `file` (see the [response data]({{< ref "/docs/1-guide/a-data/i-y-info.md" >}})) for more detail on the contents of this file), the name of the column containing the response variable of interest (`response column`), a corresponding human-readable description for each response variable (`description`), and the names of the columns required to identify individual observations (`sample id column(s)`). In some cases, `sample id column(s)` is a single column, while in others it's multiple. 