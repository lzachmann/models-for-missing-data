[![GitHub Pages](https://github.com/lzachmann/models-for-missing-data/actions/workflows/gh-pages.yml/badge.svg?branch=main)](https://github.com/lzachmann/models-for-missing-data/actions/workflows/gh-pages.yml)
[![Docker](https://github.com/lzachmann/models-for-missing-data/actions/workflows/docker.yml/badge.svg?branch=main)](https://github.com/lzachmann/models-for-missing-data/actions/workflows/docker.yml)
[![Model CI](https://github.com/lzachmann/models-for-missing-data/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/lzachmann/models-for-missing-data/actions/workflows/main.yml)

# models-for-missing-data

The "models-for-missing-data" toolkit contains code used to specify and fit Bayesian models to monitoring data. Models are declared usign YAML configuration files. Complete technical documentation can be found in the [Developer's Guide](https://lzachmann.github.io/models-for-missing-data/docs/guide/).

## assets

## model-api

R library for calling the model building / model fitting API.

## data-api

R and Python utilities used to call external services (e.g., Google Earth Engine, Microsoft's Planetary Computer, and USGS APIs) to link field-based observations with gridded datasets, which can be used as covariates in models, or to provide other contextual information at sites or park units.
