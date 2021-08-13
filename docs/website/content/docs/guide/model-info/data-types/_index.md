# Data types

| __Type of data__ | __Example__ | __Probability distribution(s)__ | __Deterministic model(s)__
| :-- | :-- | :-- | :-- |
| [Counts]({{< ref "/docs/guide/model-info/data-types/counts.md" >}}) | The number of native species on a 1 m^2 quadrat | `poisson`, `negative-binomial`, or `gen-pois`[^1] | `exponential`, `linear`, or `monomolecular` |
| Continuous and non-negative | Basal gap sizes along a transect | `lognormal` or `gamma` | `exponential` or `linear` |
| Presence-absence (zero _or_ one) | The occurrence (or not) of signs of human disturbance in a plot | `bernoulli` | `inverse-logit` |
| Counts in two categories | The number of point intercepts (_n_ = 100) at which non-native forbs are encountered along a transect | `binomial` or `beta-binomial` | `inverse-logit` |
| Proportion | A visual estimate of bare ground cover on a 1 m^2 quadrat | `beta` | `inverse-logit` |
| Ordinal | The cover class of forbs | `hurdle-ordinal-latent-beta` | `inverse-logit` |

[^1]: Or their zero-inflated counterparts -- `zero-inflated-poisson` or `zero-inflated-negative-binomial`
