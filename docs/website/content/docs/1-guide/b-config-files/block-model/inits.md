---
title: Initial values
weight: 6
---

# Initial values
Initial values determine the starting point of the sampler, and can play a large
role in ensuring efficient sampling and convergence. Implementing some degree of
randomness is also important when defining initial values to ensure that a model
is able to converge properly for a range of initial values. Providing initial 
values that are within or near the posterior distribution of 
the parameter of interest serves not only to speed up convergence, but also
to optimize the efficiency of the sampler (i.e. make it more random and less
autocorrelated) in cases when the sampling algorithm is doing hyperparameter 
tuning during the early phases of sampling.

## Syntax
```yml
# Initial values (one of: 'none', 'default', or 'inherited')
initial values: inherited
```

## Usage
