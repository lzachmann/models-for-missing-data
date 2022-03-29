---
title: Config files
bookCollapseSection: true
weight: 2
---

# Config files

We use YAML to create analysis configuration files. They are meant to be human-readable, and describe how a model relates to the data. We organize the high-level components into "blocks". The blocks are not in-and-of-themselves useful, but provide sensible organization to a specification of an analysis. They include:

1. The data (response, site location, and covariate information)
2. The model (likelihood, link function(s), group-level effects, predictor variables, etc.)
3. Other quantities (posterior predictive checks, etc.)

For more background on YAML files, see [this helpful tutorial](https://www.cloudbees.com/blog/yaml-tutorial-everything-you-need-get-started).