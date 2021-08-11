---
author: Luke Zachmann
title: Non-ignorable missingness
weight: 1
image: /images/3D98AD77-CBC4-0963-8EFBF00EA361C5DDOriginal.jpg
categories: background
tags:
  - statistics
  - ignorability
  - missing data
---

> Statistics is basically a missing data problem!

-- Little 2013

Nearly all samples -- whether by design or by accident -- are incomplete. We very rarely make a complete census of all individuals in a population or all sites on a landscape. Sometimes we don't collect, or can't collect, complete information for individual samples or measures. For instance, we might know an animal was alive when it was last seen, so we know it survived _at least_ that long, but know nothing about its current status. Or we might have information on the coverage of an invasive species down to a certain patch size, beyond which patches are too small or numerous to survey.

All of these examples involve missing data. It probably goes without saying that estimating population level parameters in light of such "missingness" is a challenge. We cannot compute a population mean if one or more values are missing.

     6 NA  9 NA  9 NA  5  6  9  7  2

The mean for such a string of numbers is undefined.[^1] In some settings these missing data can be safely ignored, but these circumstances are rarely met in ecological studies. One helpful "trick" is to consider how the problem would be solved had the data been complete, and to consider what we might do to arrive at complete data. An incomplete data perspective provides a general framework for resolving this sampling problem and making inference.

[^1]: If you're an R person and you thought, "why not just include an `na.rm = TRUE` in the call to `mean()`", kudos! You would indeed obtain a real number, but we don't yet whether we can safely ignore these `NA` values. 
