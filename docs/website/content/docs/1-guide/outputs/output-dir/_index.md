---
title: The output directory
bookCollapseSection: true
weight: 2
---

# The output directory

All outputs / logs are sent to the "assets" folder. Its contents mirror -- _almost_ exactly -- the directory structure of the "config" folder. The only difference is that the results of analyses for each state variable are stored in separate directories, whereas the configuration of analyses for like-variables (related count or cover variables, for example) can be specified simultaneously in the same YAML file. In other words, there can be many more output directories than analysis config files!

At a high level, the directory structure associated with the output of a given model looks like the following:

    . # output root
    ├── 00-input/
    ├── 01-diagnostics/
    ├── 02-checking/
    ├── 03-inference/
    ├── 99-misc/
    ├── calling-script.R   
    ├── inits-needed.txt   
    ├── mod-summary.csv    
    ├── model.jags         
    ├── output-metadata.md 
    └── system-time.txt

From the output root (`.`), there are an ordered / numbered set of directories and several files. The numeric prefix assigned to each directory is intended to provide some indication of the intended sequence by which an analyst would inspect model outputs.

| __File__ | __Description__ |
|:---|:---|
| calling-script.R | Reproducible calling script |
| inits-needed.txt | List of the parameters for which initial values (`inits`) are required |
| mod-summary.csv | Test statistics (`p_sd`, `p_mean`), posterior predictive loss (`ppl`), deviance information criterion (`dic`), and {{< katex >}}\hat{R}{{< /katex >}} (`gelman_diag`) |
| model.jags | Model file |
| output-metadata.md | Basic metadata for files included in the output folder |
| system-time.txt | Time required to fit the model |

We will work through the contents of each of the directories in turn.