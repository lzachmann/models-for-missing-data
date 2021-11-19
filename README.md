[![GitHub Pages](https://github.com/lzachmann/models-for-missing-data/actions/workflows/gh-pages.yml/badge.svg?branch=main)](https://github.com/lzachmann/models-for-missing-data/actions/workflows/gh-pages.yml)
[![Docker](https://github.com/lzachmann/models-for-missing-data/actions/workflows/docker.yml/badge.svg?branch=main)](https://github.com/lzachmann/models-for-missing-data/actions/workflows/docker.yml)
[![Model CI](https://github.com/lzachmann/models-for-missing-data/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/lzachmann/models-for-missing-data/actions/workflows/main.yml)

# models-for-missing-data

## model-api

R library for calling the model building / model fitting API. Technical documentation can be found in the [Developer's Guide](https://lzachmann.github.io/models-for-missing-data/docs/guide/).

## data-api

A placeholder for R and Python libraries to call external services (Google Earth Engine, Microsoft's Planetary Computer, and USGS APIs) to link field-based observations with gridded datasets, which can be used as covariates in models, or to provide other contextual information at sites or park units.

## Usage

### Downloading the project for the first time
To clone the entire repository (including submodules) run the following at the command line _from_ the directory into which you'd like to place the project.
```sh
git clone --recurse-submodules --remote-submodules https://github.com/lzachmann/models-for-missing-data.git
```
If the above doesn't work, try updating Git (`--remote-submodules` is only available in newer versions of Git). Alternatively, try removing `--remote-submodules` from the `clone` command.

### Syncing an existing project to get the latest updates
To get the latest updates for each of the submodules, run:
```sh
git submodule update --recursive --remote
```
If you see error, likely you've made changes locally that you've not yet saved (staged and commited using `git add` and `git commit`). Git won't replace changes in unsaved files with changes on the remote by default. This is desireable behavior. Try commiting your changes locally _before_ syncing with the remote.

<!-- ### Checking out a specific ref / branch as opposed to a specific commit
```sh
git fetch --all
git checkout gh-submodule
```

### R and R packages
```R
update.packages(ask = FALSE)
``` -->
