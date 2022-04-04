---
title: Trend step size
weight: 5
---

# Trend step size
The increment (in units of years) by which the `hat`-type means are evaluated.

## Syntax
```yml
trend step size: 1 # (0, 1]
```

## Usage
The default `trend step size` is 0.2 years, which means we get five predictions in every calendar year. For instance, between years 0 and 1, this equates to predictions at

    0.0 0.2 0.4 0.6 0.8 1.0

This yields `hat`-type means that appear very smooth, especially when the trend is curvilinear. Increasing the step size saves computation time (and the size of in-memory JAGS objects), but at the cost of a smooth trend line. Consider the following:

{{< figure src="trend-step-size.png" width=560 height=400 >}}

The teal line corresponds to a `trend step size` of 1, while the salmon-colored line corresponds to the default `trend step size`. The larger `trend step size` gives the false impression that the change in the mean is stepwise linear, when in fact it is not. If using a larger `trend step size` to fit "lighter" models more quickly, this is worth bearing in mind.

<!-- library(tidyverse)
library(hrbrthemes)

increment <- 0.2
d_raw <- tibble(x = seq(0, 5, increment)) %>% 
  mutate(mu = boot::inv.logit(-0.5 + -1 * x),
         `trend step size` = increment)
d <- d_raw %>% 
  bind_rows(d_raw %>% filter(x %% 1 == 0) %>% mutate(`trend step size` = 1))

ggplot(d) +
  geom_line(aes(x = x, y = mu, color = factor(`trend step size`)), size = 0.8) +
  theme_ipsum_rc(
    grid = "Y", base_size = 16, axis_title_size = 18, strip_text_size = 18
  ) +
  labs(x = expression(x), y = expression(italic(mu))) +
  theme(axis.title.y = element_text(angle = 0)) +
  guides(color = "none")
ggsave('docs/website/content/docs/1-guide/b-config-files/block-extras/trend-step-size.png',
       width = 7, height = 5) -->
