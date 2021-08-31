library(tidyverse)

stk_hist <- function(x, var = NULL, theme = NULL, n_sig_figs = 2, facets = NULL,
                     ...) {

  obj <- deparse(substitute(x))
  if (inherits(x, 'numeric') | inherits(x, 'integer')) {
    x_lab <- obj
    d <- tibble(.x = x, .grp = 'pooled')
    facets_raw <- '.grp'
  } else if (inherits(x, 'data.frame')) {
    if (is.null(var)) {
      stop(sprintf(
        "Please use argument `var` to supply the name of the column in %s for 
        which a distribution is sought.", obj
      ))
    }
    x_lab <- var
    d <- x %>% rename(.x = !!var) %>% mutate(.grp = 'pooled')
    facets_raw <- if (is.null(facets)) '.grp' else facets
  } else {
    stop("Unrecognized class. Unable to create histogram.")
  }
  
  rnd <- function(x, digits = n_sig_figs) {
    format(round(x, digits), nsmall = digits)
  }

  moments <- d %>% 
    group_by(across(all_of(facets_raw))) %>% 
    summarise(across('.x', list(mean = mean, sd = sd), na.rm = TRUE),
              .x_dens = list(density(.x)),
              .x_dens_min = min(.x_dens[[1]]$y),
              .x_dens_span = diff(range(.x_dens[[1]]$y)),
              .x_dens_mid = .x_dens_min + .x_dens_span / 2,
              .x_n = n(),
              # .x_dens_span2 = diff(range(density(.x)$y)),
              .groups = 'drop')# dens = density(.)$y[1]

  anno_size <-  max(11.5, theme$axis.text$size - 4) * 0.36

  if (length(facets_raw) == 1) facets <- c('.', facets_raw)
  p <- ggplot(d) +
    # facet_wrap(
    #   formula(paste("~", paste(facets, collapse = '+'))), labeller = label_both
    # ) +
    facet_grid(
      formula(paste(facets, collapse = '~')), labeller = label_both
    ) +
    geom_histogram(
      aes(x = .x, y = ..density..),
      color = 'black', fill = 'black', alpha = 0.25, ...
    ) +
    geom_vline( # vertical line corresponding to the mean
      data = moments, aes(xintercept = .x_mean), size = 0.8, color = 'orange'
    ) +
    geom_vline( # vertical line corresponding to 1 std. dev. from the mean
      data = moments, aes(xintercept = .x_mean + .x_sd), 
      size = 0.5, color = 'red', linetype = 'dashed'
    ) +
    geom_segment(
      data = moments,
      aes(x = .x_mean, xend = .x_mean + .x_sd,
          y = .x_dens_mid, yend = .x_dens_mid),
      color = 'black', size = 0.8,
      arrow = arrow(length = unit(0.02, "npc"), ends = 'both')
    ) +
    geom_label( # annotation for the mean
      data = moments,
      aes(x = .x_mean, y = -Inf, label = sprintf('mu == %s', rnd(.x_mean))),
      vjust = 'inward', parse = TRUE, size = anno_size
    ) +
    geom_label( # annotation for the standard deviation
      data = moments,
      aes(x = .x_mean + .x_sd / 2, y = .x_dens_mid + .x_dens_span / 8,
          label = sprintf('sigma == %s', rnd(.x_sd))),
      parse = TRUE, size = anno_size
    ) +
    geom_text( # annotation for the sample size
      data = moments,
      aes(x = -Inf, y = Inf, label = sprintf("italic(n) == %s", .x_n)),
      vjust = 'inward', hjust = 'inward', parse = TRUE, size = anno_size
    ) +
    geom_text( # annotation for the variance
      data = moments,
      aes(x = Inf, y = Inf, label = sprintf("sigma^2 == %s", rnd(.x_sd^2))),
      vjust = 'inward', hjust = 'inward', parse = TRUE, size = anno_size
    ) +
    labs(
      x = x_lab, y = "Density"
    ) +
    theme
  
  if (length(facets_raw) == 1) { # was: any(grepl('^\\.$', facets))
    return(
      p + 
        theme(strip.background = element_blank(), strip.text = element_blank())
    )
  }
  
  p
  
}

# Example usage.
# stk_hist(rnorm(1000))
stk_hist(
  x = rpois(1E4, 5), #rnorm(1000),
  theme = get_theme("sim_theme", y_lab_angle = 90)(),
  bins = 30
)
stk_hist(
  x = d_in_sample %>% filter(x %in% range(x)), var = 'y', 
  theme = get_theme("sim_theme", y_lab_angle = 90)(),
  bins = 30
)
stk_hist(
  x = d_in_sample %>% filter(x %in% range(x)), var = 'y', 
  facets = c('x', 'stratum'),
  theme = get_theme("sim_theme", y_lab_angle = 90)(),
  bins = 30
)
