[![GitHub Pages](https://github.com/lzachmann/models-for-missing-data/actions/workflows/gh-pages.yml/badge.svg?branch=main)](https://github.com/lzachmann/models-for-missing-data/actions/workflows/gh-pages.yml)
[![Docker](https://github.com/lzachmann/models-for-missing-data/actions/workflows/docker.yml/badge.svg?branch=main)](https://github.com/lzachmann/models-for-missing-data/actions/workflows/docker.yml)
[![Model CI](https://github.com/lzachmann/models-for-missing-data/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/lzachmann/models-for-missing-data/actions/workflows/main.yml)

# models-for-missing-data

## model-api

R library for calling the model building / model fitting API. Technical documentation can be found in the [Developer's Guide](https://lzachmann.github.io/models-for-missing-data/docs/guide/).

## data-api

A placeholder for R and Python libraries to call external services (Google Earth Engine, Microsoft's Planetary Computer, and USGS APIs) to link field-based observations with gridded datasets, which can be used as covariates in models, or to provide other contextual information at sites or park units.

<!-- ## Usage
To clone the entire repo:
```sh
git clone --recurse-submodules --remote-submodules https://github.com/lzachmann/models-for-missing-data.git.
```
To get the latest updates for each of the submodule, run:
```sh
git submodule update --recursive --remote
```
If you see error, likely you've made changes, they're not commited yet, so when you try to pull, Git says 'hey I can't do that'. Before you save your changes...
```
git fetch --all
git checkout gh-submodule
``` -->
<!-- update.packages(ask = FALSE) -->
