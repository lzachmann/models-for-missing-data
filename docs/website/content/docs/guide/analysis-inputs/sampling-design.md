---
title: Sampling design
weight: 1
bookToc: true
---

# Sampling design

Two high-level "attributes" files are required for all analyses. So long as the basic details of the sampling design they describe do not vary for different measures within a park, or different park units within a network, they only need to be specified once.

## The config directory

The file tree needed to configure analysis of data from a given park unit (`<unit code>`) in a given network (`<network code>`) looks like the following

    . # project root
    └── config/
        └── <network code>/
            ├── <unit code>/
            │   ├── _park-level-attributes.yml
            │   └── <analysis file>.yml
            └── _network-level-attributes.yml

The directory structure, as shown, is relative to the root of the project on your file system. The contents of `<analysis file>.yml` are described in the [model metadata]({{< ref "/docs/guide/analysis-inputs/metadata-syntax/_index.md" >}}) section. To take a real-world example from an analysis of richness data at Little Bighorn Battlefield National Monument (LIBI) Rocky Mountain Network (ROMN), this might look like

    .
    └── config/
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

You can also specify multiple date-time formatting options if individual data files for a network use different datetime standards.
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
Park-level metadata, stored in `_park-level-attributes.yml`, cannot be defined at a higher level because most, if not all, of this information applies only to an individual park, and not to other park units in the network. Specifically, we use this file to describe the column in the raw data that defines the strata (`stratum id column`), if present and the associated stratum areas (`stratum area info`). These areas, in turn, are used internally to computed a weighted mean at the park scale. Each entry beneath `stratum area info` must correspond to the actual stratum IDs in the column indicated by `stratum id column`. If there are no strata, then you can supply the same column used by `_network-level-attributes.yml` to indicate the unit code, and supply a single stratum area for the park.
```YAML
stratum id column: MDCATY
stratum area info:
    Gulley1: 684731
    Gulley2: 138247
    Upland: 1063552
```

The number assigned to each stratum under `stratum area info` corresponds to the total number of sites -- regardless of the actual units -- that _could_ have been sampled in that stratum. In this example there are `684731` in `Gulley1` Thus, total number of sites sampled is a negligible proportion of the landscape. 684731 / (684731 + 138247 + 1063552) = 0.3629579. Does the unit of the stratum areas matter so long as they are in the same unit? No, not yet, because these are only used to create the (normalized) stratum weights.
