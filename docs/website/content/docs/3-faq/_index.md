---
title: "FAQ"
bookFlatSection: false
bookHidden: true
weight: 4
---

<link rel="stylesheet" type="text/css" href="{{ "/hugo-cite.css" | relURL }}" />

# Frequently asked questions

**Q**: Which type of data am I working with?  
**A**: Let's talk about it!

**Q**: Do we use stratum weights when we do the finite population correction?
**A**: Yes.

**Q**: Should the locations I supply be for sites or samples within sites?
**A**: For now, just the site centroids.

**Q**: Why do my variography plots show only a fraction of the largest distance between sites?  
**A**: The R functions we are using to develop these plots only show semivariance for distances up to 1/3 of the maximum observed distance.
