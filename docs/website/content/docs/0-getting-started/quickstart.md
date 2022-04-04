---
title: Quickstart
weight: 3
bookToc: true
---

# Quickstart

Assuming you've got the __models-for-missing-data__ project code (see [Installation]({{< ref "/docs/0-getting-started/installation.md" >}})) and have all of the dependencies (see [Requirements]({{< ref "/docs/0-getting-started/requirements.md" >}})), the last remaining pieces you'll need to begin running models are the data and analysis config files. We've included examples of each in the "assets/" directory. See the guide for more information about each of these components of the __models-for-missing-data__ workflow. You can find an example of the data [here](https://raw.githubusercontent.com/lzachmann/models-for-missing-data/main/assets/_data/count-data.csv), and an analysis config file for these data [here](https://raw.githubusercontent.com/lzachmann/models-for-missing-data/main/assets/_config/M4MD/ELDO/counts.yml).

## Usage

There are two basic ways to call __models-for-missing-data__ for analyses: interactively using RStudio or non-interactively via the command line.

### Graphical user interface (RStudio)

Start RStudio and set your working directory to the project directory. Open the template "analysis-pipeline.R", which lives in "model-api/". If you'd like to make changes to "analysis-pipeline.R", or begin running models with your own data, create a copy of "analysis-pipeline.R" by appending "local" or your initials as a suffix. E.g., "analysis-pipeline-local.R".

### Command line interface (CLI)

Run an analysis utilizing 2 CPUs with, for example:
```sh
./model-api/analysis-pipeline.R \
    assets/_config/M4MD/ELDO/counts.yml \
    --n-adapt 5000 --n-update 50000 --n-iter 15000 \
    --n-cores 2
```

See `./model-api/analysis-pipeline.R --help` for more details on all CLI arguments, options, and flags.
