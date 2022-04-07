---
title: Non-centered parameterization
weight: 6
bibFile: content/posts/bib.json
---

# Non-centered parameterization

## Syntax
```yml
parameterization info: non-centered
```

## Usage
When you see this sort of funnel-like shape in your funnel plots,
{{< figure src="funnel-plot.png" width=560 height=400 >}}
or the compressions / "squeeze" seen in these funnel traces,
{{< figure src="funnel-traces.png" width=560 height=400 >}}
then it may be time to consider a non-centered parameterization, which you can invoke by including the YAML block above in your analysis config file.

In the lower panel of the funnel traces, you can see that {{< katex >}}\sigma_{\beta_0}{{< /katex >}} drifts into smaller values and gets a bit "stuck". Basically, the sampler can't efficiently explore that parameter space. While stuck, the slopes {{< katex >}}\beta_j{{< /katex >}} compress / squish together, thereby creating the problematic funnel we saw in the first figure.

It's possible to escape this funnel with a small reparameterization, called the "non-centered" parameterization. We won't go into detail here, but the basic problem, and solution, is described by others. The outputs used to find evidence of a funnel (and hence a clue that the non-centered parameterization may be needed), are found [here]({{< ref "/docs/1-guide/c-outputs/output-dir/01-diagnostics/_index.md" >}}).


## Resources

### Approachable, less-technical material
- _Statistical rethinking_ {{< cite "mcelreath2020statistical" >}}
- ["Why hierarchical models are awesome, tricky, and Bayesian"](https://twiecki.io/blog/2017/02/08/bayesian-hierchical-non-centered/)
- This parameterization also appears in discussions by the Stan and greta communities: [here](https://mc-stan.org/docs/2_29/stan-users-guide/reparameterization.html) and [here](https://github.com/greta-dev/greta/issues/44#issuecomment-306783454).

### Technical / mathy material
- A General Framework for the Parametrization of Hierarchical Models by Papaspiliopoulos et al. {{< cite "-papaspiliopoulos2007general" >}}
- Hamiltonian Monte Carlo for Hierarchical Models by Betancourt and Girolami {{< cite "-betancourt2015hamiltonian" >}}
- [Appendix D](https://drive.google.com/file/d/15S2mGHdQuZ7zFBz4bQxScoEgMfS8qRwX/view?usp=sharing) in Monnahan et al. {{< cite "-monnahan2017faster" >}}

## References
{{< bibliography cited >}} 