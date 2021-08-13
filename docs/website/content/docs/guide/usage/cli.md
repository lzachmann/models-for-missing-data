---
title: Command line interface
weight: 2
bookToc: true
---

# Command line interface

Run an analysis utilizing 3 CPUs with, for example
```
# ./analysis-pipeline.r \
    -f ./config/ROMN/GRKO/veg-categories-rel-cover.yml \
    -a 5000 -u 50000 -n 15000 \
    -c 3
```

The (optional) `-a`, `-u`, `-n`, and `-p` flags control the number of
iterations for adaptation, 'burnin', and sampling, and whether or not the
pipeline is executed in parallel, respectively. The defaults are 3K, 15K, and
5K iterations, and FALSE, respectively.

All outputs (including logs) are stored in the 'output' directory, which
mirrors -- _almost_ exactly -- the structure of the 'config'
directory. The only difference is that the results of analyses for each state
variable are stored separately, whereas the configuration of analyses for
like-variables (related count or cover variables, for example) can be specified
simultaneously in the same YAML file.
