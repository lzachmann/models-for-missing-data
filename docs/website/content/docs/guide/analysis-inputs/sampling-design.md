---
title: Sampling design
weight: 1
bookToc: true
---

# Sampling design

Two high-level "attributes" files are required for all analyses. So long as the basic details of the sampling design they describe do not vary for different measures within a park, or different park units within a network, they only need to be specified once.

## The config directory

The file tree needed to configure analysis of data from a given park unit (`<unit code>`) in a given network (`<network code>`) looks like the following

    .
    └── config/
        └── <network code>/
            ├── <unit code>/
            │   ├── _park-level-attributes.yml
            │   └── <analysis file>.yml
            └── _network-level-attributes.yml

where `.` is the root directory. The contents of `<analysis file>.yml` are described in the [model metadata]({{< ref "/docs/guide/analysis-inputs/model-metadata.md" >}}) section. To take a real-world example from an analysis of richness data at Little Bighorn Battlefield National Monument (LIBI) Rocky Mountain Network (ROMN), this might look like

    .
    └── config/
        └── ROMN/
            ├── LIBI/
            │   ├── _park-level-attributes.yml
            │   └── richness.yml
            └── _network-level-attributes.yml

### Network level attributes
These attributes typically consist of
`_network-level-attributes.yml`
```YAML
unit code column: Park
site id column: SiteName
event date info:
    date-time column: Year
    date-time format: Y!  # see lubridate::parse_date_time() for details
```

### Park level attributes
`_park-level-attributes.yml`
```YAML
stratum id column: MDCATY
stratum area info:
    Gulley1: 684731
    Gulley2: 138247
    Upland: 1063552
```
