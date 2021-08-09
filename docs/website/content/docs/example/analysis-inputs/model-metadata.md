---
title: Model metadata
weight: 3
bookToc: true
---

# Metadata syntax for specifying models

Fitting models requires a metadata file that uses YAML syntax.

## YAML syntax

Among a few other arguments, most of which have defaults, the analysis pipeline requires a metadata file. While the filename is arbitrary, the path to the file is not. The information in this file defines inputs, the model(s) being considered, and other actions.

Here is the first few lines of the data block for a model of count-type data at Rocky Mountain Network called `rich.yml`, which lives in the directory `config/ROMN/LIBI`

    # ==== DATA ===================================================================

    response info:
        file: data/ROMN/LIBI_richness_20171208_r.csv
        state variable:
            response column:
                - native.rich
                - native.forb.rich
            description:
                - Native species richness
                - Native forb species richness
        sampling method: plot
        sample id column(s):
            - Transect
            - Plot
