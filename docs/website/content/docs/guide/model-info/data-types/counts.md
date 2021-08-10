# Counts

Counts of things are modeled using the Poisson or negative binomial distributions. The latter is typically required with the data are [overdispersed](https://en.wikipedia.org/wiki/Overdispersion). Underdispersed data can be modeled using the generalized Poisson distribution. We also support zero-inflated version of each.

## Poisson
Discrete random variables that occur randomly over time or space.

{{< tabs "poisson" >}}
{{< tab "Math" >}}

# Likelihood

{{< katex display >}}
y \sim \text{Poisson}(\lambda)
{{< /katex >}}

where {{< katex >}}\lambda{{< /katex >}} is the mean.

{{< /tab >}}

{{< tab "Code" >}}

# JAGS code

    y[n] ~ dpois(mu[n])

{{< /tab >}}
