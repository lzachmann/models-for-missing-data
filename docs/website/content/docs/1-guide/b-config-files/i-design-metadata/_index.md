---
title: Design metadata
weight: 1
---

# Design metadata

Two high-level "attributes" files are required for all analyses. So long as the basic details of the sampling design they describe do not vary for different measures within a park, or different park units within a network, they only need to be specified once.

## The config file tree

The file tree structure needed to configure analysis of data from a given park unit (`<unit code>`) in a given network (`<network code>`) must look like the following

    . # project root
    └── assets
        └── <config dir>/
            └── <network code>/
                ├── <unit code>/
                │   ├── _park-level-attributes.yml
                │   └── <analysis file>.yml
                └── _network-level-attributes.yml

The name of `<config dir>` is arbitrary. For the demo analyses it's `_config`, while for the "uplands" status and trends work we've used `uplands-config`.

The directory structure, as shown, is relative to the root of the project on your file system. The contents of `<analysis file>.yml` are described in the ensuing sections of the guide. To take a real-world example from an analysis of species richness data at Little Bighorn Battlefield National Monument (LIBI), in Montana -- a park within Rocky Mountain Network (ROMN) -- the complete file tree might look like the following:

    .
    └── assets
        └── uplands-config/
            └── ROMN/
                ├── LIBI/
                │   ├── _park-level-attributes.yml
                │   └── richness.yml
                └── _network-level-attributes.yml

### Network-level attributes
These attributes, which appear in the file `_network-level-attributes.yml`, consist of several key-value pairs used to define the park unit code (`unit code column`) by whatever name it goes by in the raw data, the name of the column containing the site ID (`site id column`), and a nested set of key-value pairs used to describe the date associated with each observation.
```YAML
unit code column: Park
site id column: SiteName
event date info:
    date-time column: Year
    date-time format: Y!  # see lubridate::parse_date_time() for details
```

You can also specify multiple date-time formatting options if individual data files for a network use different datetime standards. Here's another example of a `_network-level-attributes.yml` file for analyses from Northern Colorado Plateau Network:
```YAML
unit code column: Unit_Code
site id column: Plot_ID
event date info:
    date-time column: Start_Date
    date-time format:
        - Y!-m!*-d! I!:M!:S!  # see lubridate::parse_date_time() for details
        - Y!-m!*-d!
```

### Park-level attributes
Park-level metadata, stored in `_park-level-attributes.yml`, cannot be defined at a higher level because most, if not all, of this information applies only to an individual park, and not to other park units in the network. Specifically, we use this file to describe the name of the column in the raw data that defines the strata (`stratum id column`) and the associated stratum areas (`stratum area info`).

These areas, in turn, are used internally to compute a weighted mean at the park scale. Each entry beneath `stratum area info` must correspond to the actual stratum IDs in the column indicated by `stratum id column`. If there are no strata, then you can supply the same column used by `_network-level-attributes.yml` to indicate the unit code, and supply a single stratum area for the park.
```YAML
stratum id column: MDCATY
stratum area info:
    Gulley1: 684731
    Gulley2: 138247
    Upland: 1063552
```

{{< notice note >}}
Only the `stratum id`'s appearing beneath `stratum area info` are included in analysis. If your original response data contain strata A, B, and C, but `_park-level-attributes.yml` includes just A and C, then records associated with stratum B are automatically removed prior to analysis.
{{< /notice >}}

The number assigned to each stratum under `stratum area info` corresponds to the total number of sites -- regardless of the actual units -- that _could_ have been sampled in that stratum. In this example there were `684731` potentially sampleable sites in `Gulley1`. The proportion of the park represented by `Gulley1` is `684731 / (684731 + 138247 + 1063552) = 0.3629579`.[^1] 

In most cases, the sites actually sampled in any given stratum represents a tiny fraction of that stratum's area (e.g., <1%). In cases where sampled sites represent a larger proportion of the total stratum area, we may need to apply finite population correction, which we'll describe in another section of this guide.

[^1]: Does the unit of the stratum areas matter so long as they are in the same unit? No, not yet, because these are only used to create the (normalized) stratum weights.
