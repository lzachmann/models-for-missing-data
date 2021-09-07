# `_data/` | demo data files

These data files are generated automagically using R and JAGS code compiled using GitHub Actions. The files are sufficient to show the model API in action. The model used to generate these 'fake' datasets can be found in "challenge.csv".

| **File**   | **Description**  | **Examples**  |
|----|---|---|
| binomial-data.csv   | Discrete. Counts that can be assigned to one of two possible categories (alive or dead, present or absent, etc.).  | Data are the number of successes out of $n$ trials -- e.g., point-intercept data on the presence of exotic species or human disturbance  |
| count-data.csv   | Discrete. The number of "events" in a given unit of time or space.  | Native species richness, shrub density, etc.  |
| nonnegative-continuous-data.csv   | Continuous. Nonnegative (possibly skewed) quantities. | Canopy gap size, tree height, etc.  |
