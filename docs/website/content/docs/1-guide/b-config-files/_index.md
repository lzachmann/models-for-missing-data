---
title: Config files
bookCollapseSection: true
weight: 2
---

# Config files

We use YAML to create analysis configuration files. These files are intended to be human-readable, and they describe how a model relates to the data, including nonignorable aspects of the sampling design. We organize information about the sampling design, the data, and the model in this way:

1. Design metadata
2. The analysis config file, which in turn consists of:
    - The data (response, site location, and covariate information)
    - The model (likelihood, link function(s), group-level effects, predictor variables, etc.)
    - Other conditions or quantities (posterior predictive checks, etc.)

We call these subcomponents of the analysis config file "blocks". The blocks provide sensible organization to the specifications of an analysis.

For more background on YAML files, see [this helpful tutorial](https://www.cloudbees.com/blog/yaml-tutorial-everything-you-need-get-started).
