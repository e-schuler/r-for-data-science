box::use(
  ggplot2[...],
  palmerpenguins[...],
  dplyr[...],
  tidyverse[...]
)

### First steps:

## Scratch
ggplot(
  data = penguins,
  aes(x = flipper_length_mm, y = body_mass_g) #, color = species)
  ) +
  geom_point(aes(color = species, shape = species)) +
  geom_smooth(method = "lm") +
  labs(title = "Plot", subtitle = "Subplot",
        x="flipper length",
       color = "Species",
       shape = "Species"
      )

### Exercises
# 1. How many rows are in penguins? How many columns
count(penguins) #counts rows
length(penguins) #counts columns

# 3.
ggplot(
  data = penguins,
  aes(x = bill_length_mm, y = bill_depth_mm)
) + geom_point(aes(color = island))

# 4. what is better a scatter for this comparison? Answer: boxplot
ggplot(
  penguins,
  aes(x = species,
  y = bill_depth_mm)
) + geom_boxplot()

# 7. Add caption
ggplot(
  penguins,
  aes(x = species,
      y = bill_depth_mm)
) + geom_boxplot() +
  labs(caption = "Data come from palmerpenguins package.")

# 8.
ggplot(
  penguins,
  aes(x = flipper_length_mm,
  y = body_mass_g
  #,color = bill_depth_mm
  )
) + geom_point(aes(color = bill_depth_mm)) +
  geom_smooth()

# 9.
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
) +
  geom_point() +
  geom_smooth(se = FALSE)

# 10. No because the aes() definitions are the same at the global and geom level
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point() +
  geom_smooth()

ggplot() +
  geom_point(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  ) +
  geom_smooth(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  )


### Distributions

## Exercises
# 1
penguins |> ggplot() + geom_bar(aes(y = species))

# 2 - difference b/w color and fill
ggplot(penguins, aes(x = species)) +
  geom_bar(color = "red")

ggplot(penguins, aes(x = species)) +
  geom_bar(fill = "red")

# 3
penguins |> ggplot() + 
  geom_histogram(
    aes(x = bill_length_mm),
  #binwidth = 5,
    bins = 10
  )

# 4
diamonds |> ggplot() +
  geom_histogram(aes(x = carat), binwidth = 0.05)