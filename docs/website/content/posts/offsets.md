---
author: Luke Zachmann
title: The offset term
weight: 7
categories: background
bookHidden: true
tags:
  - statistics
bibFile: content/posts/bib.json
---

Counts of things naturally scale with the length or duration of observation, the area sampled, and sampling intensity {{< cite "mcelreath2018statistical" >}}. For instance, the longer the river stretch we survey, the more fish we'll tend to find.  


Offset terms are used to model rates -- e.g., counts per unit area or time. In the context of the model, the offset term transforms the response variable from a rate to a count.

## Why do we need an offset?

Why can't we simply derive a new response variable by normalizing the original counts by the relevant sampling unit? The distributions we use to model counts have support for discrete-valued variables. Transformations of the counts can violate that requirement. For instance, say we counts signs of human disturbance in 20m-by-50m plots. If we see 60 signs, that's 60 / (20 * 50) = 0.06.  Although the mean of a Poisson distributed variable can be continuous, observations cannot be. Thus, transforming the response variable from counts to a rate is incorrect.

{{< hint [warning] >}}
The offset needs to be on the same scale as the linear predictor. In the case of a log link model, this requires the offset variable to be logged before inclusion in the model
{{< /hint >}}

poi_r <- glm(numclaims ~ x1+x2+x3,data=train, family = "poisson", offset=log(exposure))

Typically we use offsets when the sampling unit (time, area, exposure) varies across observations. For example, species richness in riparian areas in arid ecosystems is often evaluated for the entire riparian area, which tend to be quite small. But the actual extent of each riparian area might differ.

---

## References

{{< bibliography cited >}}
