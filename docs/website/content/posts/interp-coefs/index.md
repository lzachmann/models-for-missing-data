---
author: Luke Zachmann
title: Interpreting coefficients
weight: 6
categories: applications
tags:
  - inference
bibFile: content/posts/bib.json
---

## Making sense of the effects of variables included as predictors

Some aspects of covariate effects are readily apparent -- for instance, the sign of a coefficient in a model says at least something about the general directionality of the effect, positive or negative. However, a deeper understanding of a model typically requires inferences that go well beyond simple measures of the _directionality_ or _significance_ of effects -- it requires understanding the _size_ of effects.

What do we mean by effect size, and how is it measured? In order to offer a working definition of effect size, we need to use a bit of math. The size of an effect can be approximated as the average change in the response variable being modeled, per unit change in some predictor variable, which we'll call {{< katex >}}x_1{{< /katex >}}

{{< katex display >}}
\mu_i = g(\beta_0 + \beta_1 x_{1i}).
{{< /katex >}}

The parameter {{< katex >}}\beta_0{{< /katex >}} is the intercept and {{< katex >}}\beta_1{{< /katex >}} is the slope associated with covariate {{< katex >}}x_1{{< /katex >}} in a generalized linear model (linear, exponential, or inverse logit), which we represent using the link function {{< katex >}}g(){{< /katex >}}. The effect of {{< katex >}}x_1{{< /katex >}} translates into changes in the mean of the response variable through {{< katex >}}\beta_1{{< /katex >}} and link function {{< katex >}}g(){{< /katex >}}. To understand the effect that {{< katex >}}x_1{{< /katex >}} will have on the mean on the scale of the actual data, we first have to take note of the function for which {{< katex >}}g(){{< /katex >}} is a placeholder, as well as any transformations (e.g., scaling) that may have been applied to the data.

## Example | the response of plant cover to rainfall

Let's consider a covariate that we might expect to have a mechanistic influence on plant cover, such as accumulated spring precipitation. Thus, {{< katex >}}x_1{{< /katex >}} is a measure of rainfall.  The plant cover observations were collected at point intercepts along a transects at a site, indexed by subscript {{< katex >}}i{{< /katex >}}. At any given point intercept, plants are either present or absent. {{< katex >}}y_i{{< /katex >}}, then, is the sum of the number of times plants were detected (the total number of "hits") at any point intercept along a transect. The observations are modeled as

{{< katex display >}}
\begin{align*}
p_i &= \text{logit}^{-1}(\beta_0 + \beta_1 x_{1i}) \\
y_i &\sim \text{binomial}(n, p_i)
\end{align*}
{{< /katex >}}

where {{< katex >}}n{{< /katex >}} is the total number of point intercepts evaluated along each transect (the number of "trials"). {{< katex >}}x_1{{< /katex >}} is scaled from its original units (cm) to zero mean and unit variance prior to fitting the model.

Let's also take as a given that the estimated median value of the coefficients is as follows: {{< katex >}}\beta_0=0.12{{< /katex >}} and {{< katex >}}\beta_1=0.22{{< /katex >}}. Prior to scaling, {{< katex >}}x_1{{< /katex >}} had mean 20.4, standard deviation 15.3, and range [0.4, 70.9]. To better understand the influence of {{< katex >}}x_1{{< /katex >}} on the mean plant cover, we will create a new vector called {{< katex >}}x_1^{\text{pred}}{{< /katex >}}, which consists of scaled rainfall values at equally spaced intervals over the range of {{< katex >}}x_1{{< /katex >}}. Here is the basic setup, in {{< katex >}}\textsf{R}{{< /katex >}}:

```R
b0 <- 0.12 # the intercept
b1 <- 0.22 # the effect of spring precipitation

x1_mean <- 20.4; x1_sd <- 15.3; x1_range <- c(0.4, 70.9)
x1_pred_raw <- seq(x1_range[1], x1_range[2], length.out = 100)
x1_pred <- (x1_pred_raw - x1_mean) / x1_sd
```

Let's plot mean plant cover, `p`, over the range of `x1_pred`:

```R
p <- boot::inv.logit(b0 + b1 * x1_pred)
p_x1_mean <- boot::inv.logit(b0) # p at average precip
plot(x1_pred_raw, p, ylim = c(0, 1), type = 'l', col = 'red')
abline(v = x1_mean, lty = 2, col = 'gray')
abline(h = boot::inv.logit(b0), lty = 2, col = 'gray')
```

Mean plant cover increases as a function of spring rainfall, from a value of approximately 0.46 at its minimum (next to zero precipitation) to 0.70 at its maximum (~71 cm of rainfall). We can interpret the quantity {{< katex >}}\text{logit}^{-1}(\beta_0)=\text{logit}^{-1}(0.12)=0.53{{< /katex >}} (the horizontal dashed gray line) as the mean site-level cover of plants in a year with average spring rainfall (vertical dashed gray line).[^1]

{{< figure src="ex1-p1.png" >}}

This being an inverse logit model, we are somewhat obligated to talk about odds, which are given by the quantity {{< katex >}}\frac{p}{(1-p)}{{< /katex >}}. In this example, it's the ratio of the probability of a plant being present at a given point intercept to the probability of a point intercept _not_ touching a plant. In a year with average spring rainfall, you are ~1.13X more likely to see it than not (`0.53 / (1 - 0.53)`).[^2]

{{< katex >}}\beta_1{{< /katex >}} is the multiplicative change in odds per standard deviation spring precipitation.[^3] To compute the odds of seeing plant cover if spring rainfall is one standard deviation higher than average we would use
```R
(odds_x1_mean  <- p_x1_mean / (1 - p_x1_mean))
exp(b1) * odds_x1_mean # 1.4
```
At 1.4X, the odds of encountering plants has gone up. Basically, when rainfall is one standard deviation over the mean, you're now 1.4X more likely to see it than not. Thus, the odds of seeing plants increases with increasing precipitation. We can show the same thing using slightly different math.

```R
p_x1_sd1 <- boot::inv.logit(b0 + b1 * 1) # let's make sure we can recover the same odds using different math
p_x1_sd1 / (1 - p_x1_sd1) # again, 1.4!
```

Let's show the odds at progressively more extreme values of rainfall ({{< katex >}}1\sigma, 2\sigma, 3\sigma{{< /katex >}}):

```R
plot(x1_pred_raw, p, ylim = c(0, 1), type = 'l', col = 'red')
abline(v = x1_mean, lty = 2, col = 'gray')
abline(h = p_x1_mean, lty = 2, col = 'gray')
# at 1 sd
lines(x = rep(x1_mean + x1_sd, 2), y = c(0, boot::inv.logit(b0 + b1 * 1)),
      lty = 2, col = 'orange')
points(x = x1_mean + x1_sd, y = boot::inv.logit(b0 + b1 * 1))
# at 2 sd
lines(x = rep(x1_mean + 2*x1_sd, 2), y = c(0, boot::inv.logit(b0 + b1 * 2)),
      lty = 2, col = 'green')
points(x = x1_mean + 2*x1_sd, y = boot::inv.logit(b0 + b1 * 2))
# at 3 sd
lines(x = rep(x1_mean + 3*x1_sd, 2), y = c(0, boot::inv.logit(b0 + b1 * 3)),
      lty = 2, col = 'blue')
points(x = x1_mean + 3*x1_sd, y = boot::inv.logit(b0 + b1 * 3))
```

When rainfall is near it's observed maximum value (at 3 standard deviations higher than the mean), you are now `exp(b1)^3` or ~2.2X more likely to see plants than not.

{{< figure src="ex1-p2.png" >}}

### Effect size inference using another scale
Let's say the manager isn't thrilled about using standard deviations in rainfall as the unit of measure. Instead, they're focused on _inches_ of precipitation. How do we cast these effect size calculations in terms of inches and not standard deviations? First we need to recover the unstandardized slope term, which we'll notate as {{< katex >}}\beta_1^{\prime}{{< /katex >}} using {{< katex >}}\beta_1^{\prime}=\frac{\beta_{1}}{\text{sd}(\mathbf{x}_{1})}{{< /katex >}}.

```R
b1_unscaled <- b1 / x1_sd
exp(b1_unscaled) # per cm
exp(b1_unscaled * 2.54) # per inch
```

`exp(b1_unscaled)` is the multiplicative change in odds per cm spring rainfall. It's much smaller than `exp(b1)` because `x1_sd` is ~15cm of precip!). We now want inches. So it's `b1_unscaled * 2.54`.

[^1]: After scaling, the value of {{< katex >}}x_1{{< /katex >}} in an average rainfall year is simply zero. The term involving rainfall in the model drops out because {{< katex >}}\beta_1 \times 0 = 0{{< /katex >}} and {{< katex >}}\text{logit}^{-1}(0.12 + 0){{< /katex >}} simplifies to {{< katex >}}\text{logit}^{-1}(0.12){{< /katex >}}.
[^2]: The odds here make at least some intuitive sense. At `p = 0.53` you're just slightly more likely than not to encounter plants at a given point at this site.
[^3]: Why is this the case? Inverse logit models have the form
{{< katex display >}}
\begin{align*}
p_{i} &= \frac{e^{\beta_{0}+\beta_1x_{1i}}}{1+e^{\beta_{0}+\beta_1x_{1i}}} \\
      &= \text{logit}^{-1}(\beta_0 + \beta_1 x_{1i})
\end{align*}
{{< /katex >}}
Rearranging the equation above, we obtain
{{< katex display >}}
\text{logit}(p_{i})=\text{log}\left(\frac{p_{i}}{1-p_{i}}\right)=\beta_{0}+\beta_1x_{1i}
{{< /katex >}}
{{< katex >}}\beta_1{{< /katex >}} can be understood somewhat more intuitively by exponentiating both sides of the equation above
{{< katex display >}}
\begin{align*}
\frac{p_{i}}{1-p_{i}} &= e^{\beta_{0}+\beta_1x_{1i}}\\
  &= e^{\beta_{0}} \times e^{\beta_1x_{1i}}
\end{align*}
{{< /katex >}}
