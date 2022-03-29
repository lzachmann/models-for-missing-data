---
title: Location info
weight: 2
---

# Location info
Site location information (`site location info`), if provided, is used to evaluate spatial autocorrelation in model residuals.  

```yml
site location info:
    file: assets/uplands-data/ROMN/LIBI_GRKO_metrics_adjwt_20170414_forCSP.csv
    coordinate columns:
        - xcoord
        - ycoord
```

Here again, we point to the name of the file (`file`) and supply the names of the columns containing the spatial coordinates (`coordinate columns`). Note that proper residual analysis requires Cartesian coordinates. If the locations come directly from a geographic coordinate system, they'll need to be transformed to a projected coordinate system.