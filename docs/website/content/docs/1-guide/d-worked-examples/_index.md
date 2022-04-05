---
title: Worked examples
bookCollapseSection: false
weight: 4
---

# Worked examples
In all cases below we will work with the demo data included with __models-for-missing-data__, which has the following directory structure:

    .
    └── assets
        └── _config/
            └── M4MD/
                ├── ELDO/
                │   ├── _park-level-attributes.yml
                │   ├── counts.yml
                │   └── hits-vs-trials.yml
                └── _network-level-attributes.yml

## A minimal example for count data
The following example comes from "assets/_config/M4MD/ELDO/counts.yml".

### The analysis config file

{{< code file="content/docs/1-guide/d-worked-examples/example-analysis-configs/M4MD/ELDO/counts.yml" language="yml" >}}

### The model call
You can run this model interactively from RStudio using "model-api/analysis-pipeline.R", or at the command line with: 
```sh
./model-api/analysis-pipeline.R \
    assets/_config/M4MD/ELDO/counts.yml \
    --n-adapt 5000 --n-update 10000 --n-iter 8000 \
    --n-cores 2 \
    --excl-null
```
Note that we exclude the "null" (time-only) model with the flag `--excl-null`. 

### Selected outputs

#### Convergence diagnostics
{{< code file="content/docs/1-guide/d-worked-examples/example-analysis-outputs/M4MD/ELDO/counts/y_sim/pois_exp_b0_hier-site/w1/convergence-diagnostics.txt" language="txt" >}}

#### 
#### Model checking and evaluation
| __Posterior predictive checks__  | __Observed vs. predicted plots__ |
|--|--|
| {{< figure src="example-analysis-outputs/M4MD/ELDO/counts/y_sim/pois_exp_b0_hier-site/w1/y-rep-by-unit_code-stats.jpg" >}} | {{< figure src="example-analysis-outputs/M4MD/ELDO/counts/y_sim/pois_exp_b0_hier-site/w1/op-y-rep.jpg" >}} |

#### Inference
| __Intercept and time slope terms__  | __Fixed effects__ |
|--|--|
| {{< figure src="example-analysis-outputs/M4MD/ELDO/counts/y_sim/pois_exp_b0_hier-site/w1/beta-coef-estimates-untransformed.png" >}} | {{< figure src="example-analysis-outputs/M4MD/ELDO/counts/y_sim/pois_exp_b0_hier-site/w1/additional-coef-estimates-Beta-untransformed.png" >}} |

## A minimal example for binomial data
The following example comes from "assets/_config/M4MD/ELDO/hits-vs-trials.yml".

### The analysis config file
{{< code file="content/docs/1-guide/d-worked-examples/example-analysis-configs/M4MD/ELDO/hits-vs-trials.yml" language="yml" >}}