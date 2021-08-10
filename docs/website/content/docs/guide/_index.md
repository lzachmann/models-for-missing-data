---
weight: 1
bookFlatSection: false
title: "Guide"
---

# Guide

We describe analysis inputs, model parameterization options, and outputs.

## A sampling design ontology

All networks tend to use different language to refer to the same basic observational and sampling units. In one network, the fundamental sampling unit, in which replicated observations are made, might be called `SiteName`, while in others it is `Plot_ID` or `Plot` or `Loc_Name`. As we shall see in the [sampling design documentation]({{< ref "/docs/guide/analysis-inputs/sampling-design.md#network-level-attributes" >}}), the name given by a network to these common samplign units does not matter, so long as it is defined in the network-level attributes file. The same reasoning applies to other features of the design, such as the name of columns used to indicate the park unit and stratum to which an observation belongs. Even datetime information is allowed to assume different formats, so long as the format of the date field is clearly specified.

## The project file tree

When downloading the repository containing all of the code, you will see several directories. Notably, the config/, data/, and src/ directories, as well as the main calling script `analysis-pipeline.r`.

```sh
git clone --recurse-submodules git@github.com:lzachmann/models-for-missing-data.git
```

You'll see several additional files and directories that are oriented at documentation and reporting (docs/) and the maintanence of the software (docker/).
