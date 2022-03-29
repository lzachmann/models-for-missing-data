---
title: Quickstart
weight: 3
bookToc: true
---

# Quickstart

Assuming you've got the __models-for-missing-data__ project code (see [Installation]({{< ref "/docs/getting-started/installation.md" >}})) and have all of the dependencies (see [Requirements]({{< ref "/docs/getting-started/requirements.md" >}})), the last remaining pieces you'll need to begin running models are the data and analysis config files. We've included examples of each in the 'assets/' directory. See the guide for more information about each of these components of the __models-for-missing-data__ workflow.

## Components

### Data

### Config files

## Usage

There are two basic ways to call __models-for-missing-data__ for analyses: interactively using RStudio or non-interactively via the command line.

### Graphical user interface (RStudio)

Start RStudio and set your working directory to the project directory. In 'model-api/' create a copy of 'analysis-pipeline.R', perhaps by appending 'local' or your initials as a suffix. E.g., 'analysis-pipeline-local.R'.

### Command line interface (CLI)

Run an analysis utilizing 2 CPUs with, for example:
```
./model-api/analysis-pipeline.R \
    assets/_config/M4MD/ELDO/counts.yml \
    --n-adapt 5000 --n-update 50000 --n-iter 15000 \
    --n-cores 2
```

See `./model-api/analysis-pipeline.R --help` for more details on all CLI arguments, options, and flags.
