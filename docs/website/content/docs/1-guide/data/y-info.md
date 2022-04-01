---
title: Response data
bookCollapseSection: true
weight: 1
---

# Response data

The response data include the observations we are trying to model, as well as columns with identifiers (indices, IDs, datetime strings) for all relevant design information. Elements of the sampling design often seen in long-term monitoring data include the following:

| Design element | Examples |
|:------|:------|
|   observational units    |   transect, quadrat, plot   |
|   sampling units   |   plot, site   |
|   stratification   |   stratum   |
|   date / event times   |   `MM/DD/YYYY`, `YYYY`   |

## Format

The response information are stored as flat files, which are typically text files with no special word processing or markup. Each row represents a single observation, while the columns describe the value of the observation and the design features described above. The file can be CSV, XLS, XLSX, GZ, or RDS. For ease of use, readability, and other reasons, we generally recommend CSV.

## Example

<!-- d_raw <- read_csv('assets/uplands-data/ROMN/modified/LIBI_richness_20200212.csv')
d <- d_raw %>% 
  select(-EventName, -OneEventPerYear, -native.rich) %>% 
  arrange(SiteName, Year) %>% 
  mutate(Row = row_number()) %>% 
  relocate(Row, Park)
write_csv(bind_rows(head(d), tail(d)), 
          'docs/website/content/docs/guide/data/richness.csv') -->

The response data below contain species richness observations for forb (`native.forb.rich`) and grass-like (`native.gram.rich`) species from Little Bighorn Battlefield National Monument (LIBI), in Montana. Here, we see the first and last six rows of the data. 

|Row |Park|MDCATY |SiteName|Year|Transect|Plot|native.forb.rich|native.gram.rich|
|:----|:----|:-------|:--------|:----|:--------|:----|:----------------|:----------------|
|1   |LIBI|Gulley1|LIBI_001|2011|1       |A   |6               |5               |
|2   |LIBI|Gulley1|LIBI_001|2011|1       |B   |5               |5               |
|3   |LIBI|Gulley1|LIBI_001|2011|1       |C   |4               |2               |
|4   |LIBI|Gulley1|LIBI_001|2011|1       |D   |6               |8               |
|5   |LIBI|Gulley1|LIBI_001|2011|2       |A   |6               |7               |
|6   |LIBI|Gulley1|LIBI_001|2011|2       |B   |4               |6               |
|... |... |...    |...     |... |...     |... |...             |...             |
|1105|LIBI|Upland |LIBI_050|2019|2       |A   |5               |2               |
|1106|LIBI|Upland |LIBI_050|2019|2       |B   |4               |6               |
|1107|LIBI|Upland |LIBI_050|2019|2       |C   |3               |3               |
|1108|LIBI|Upland |LIBI_050|2019|3       |A   |2               |1               |
|1109|LIBI|Upland |LIBI_050|2019|3       |B   |2               |1               |
|1110|LIBI|Upland |LIBI_050|2019|3       |C   |3               |2               |

Although they may go by different names, we see many of the design elements appearing in columns. Our sampling units are sites (`SiteName`) within strata (`MDCATY`). Individual observations are indexed by the unique combinations of `Transect` and `Plot` within each site. All of the sites in this dataset come from a single park unit (`LIBI`). The calendar year in which the observations were made is given in the column `Year`.

## From data to model

We'll see how to declare various aspects of the response information in the [data block]({{< ref "/docs/1-guide/config-files/block-data/response-info.md" >}}) of the analysis config files in another section of this guide. For now, we will leave things as they stand, with two quick notes / caveats:
    
- Unlike many design based approaches, which aggregate observations within or across sampling units (using a mean, for instance), we work with the raw observations themselves. As we begin to develop models for the data, it will be important to know what [type of data]({{< ref "/docs/1-guide/data/types-of-random-variables/_index.md" >}}) your observations represent. 
- If you are expecting to use covariates in your model, the names of each design element _must_ be consistent across response and [covariate data]({{< ref "/docs/1-guide/data/x-info.md" >}}) files. The reason for this requirement is that the analysis pipeline performs auto joins. If the column containing site information in the response data is called `SiteName`, but `Site` in the covariate data, the program won't know they're intended to be the same. Additionally, even the entries within a column must be the same. Thus, if a site is called `LIBI_001` in the response info it must be given the same name in the covariate info. If, in the covariate info, the sites appear without the prefix for unit code (e.g., `001`), the join will fail. 