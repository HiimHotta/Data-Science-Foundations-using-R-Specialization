
# Notes of lectures from Lesson 2

## How to use Base Plotting System

OBS: remember to import `library (datasets)`

### Base Plot with Anotation

```
with (airquality, plot (Wind, Ozone))
title (main = "Ozone and Wind in NY City") # Add a title
```

```
with (airquality, plot (Wind, Ozone, main = "Ozone and Wind in NY City"))
with (subset (airquality, Month == 5), points (Wind, Ozone, col = "blue")
```

```
with (airquality, plot (Wind, Ozone, main = "Ozone and Wind in NY City", type = "n"))

with (subset (airquality, Month == 5), points (Wind, Ozone, col = "blue"))

with (subset (airquality, Month != 5), points (Wind, Ozone, col = "red"))

legend ("topright", pch = 1, col = c ("blue", "red"), legend = c ("May", "Other Months"))
```

### Base Plot with Regression Line

```
with (airquality, plot (Wind, Ozone, main = "Ozone and Wind in NY City"), pch = 20)

model <- lm (Ozone ~ Wind, airquality) # lm () -> linear model

abline (model, lwd = 2)
```

### Multiple Base Plots 
```
par (mfrow = c (1, 2))

with (airquality, {plot (Wind   , Ozone, main = "Ozone and Wind")
                   plot (Solar.R, Ozone, main = "Ozone and Solar Radiation")})
```

Another example using mtext to introduce a title

```
par (mfrow = c (1, 3), mar = c (4, 4, 2, 1), oma = c (0, 0, 2, 0))

with (airquality, {plot (Wind   , Ozone, main = "Ozone and Wind")
                   plot (Solar.R, Ozone, main = "Ozone and Solar Radiation")
                   plot (Temp   , Ozone, main = "Ozone and Temperature")
                   mtext ("Ozone and Weather in NY City", outer = TRUE)})
```

### Examples to use in R Console

```
x <- rnorm (100)
hist (x)
```

```
y <- rnorm (100)
plot (x, y)
```

```
z <- rnorm (100)
plot (x, z)
```

```
# change margin size
par (mar = c (2, 2, 2, 2))
plot (x, y)
```

```
# change plotting symbol
plot (x, y, pch = 4)
```

```
# helpful tool
example (points)
```

```
x <- rnorm (100)
y <- rnorm (100)
plot (x, y, pch = 20)
title ("Scatterplot")
text (-2, -2, "Label")
legend ("topleft", legend = "Data")
legend ("topleft", legend = "Data", pch = 20)
```

```
# add a line
fit <- lm (y ~ x)
abline (fit)
abline (fit, lwd = 3)
abline (fit, lwd = 3, color = "blue")
```

```
plot (x, y, xlab = "Weight", ylab = "Height", main = "Scatterplot", pch = 20)
legend ("topright", legend = "Data", pch = 20)
```

```
# two plots one on top

z <- rpois (100, 2)
par (mfrow = c (2, 1))
plot (x, y, pch = 20)

# Press Enter

plot (x, z, pch = 19)

# margin is a little bit large
# let's resize
par ("mar")
par (mar = c (2, 2, 1, 1))

plot (x, y, pch = 20)
plot (x, z, pch = 19)

# or we could put them side by side
par (mfrow = c (1, 2))

plot (x, y, pch = 20)

# Press Enter

plot (x, z, pch = 19)

# missed the y-axis, let's resize again

par (mar = c (4, 4, 2, 2))

plot (x, y, pch = 20)
plot (x, z, pch = 19)
```

```
# difference between mfrow and mf col

par (mfrow = c (2, 2))
# plot order
# 1 2
# 3 4
plot (x, y, pch = 20)
plot (x, z, pch = 19)
plot (x, y, pch = 20)
plot (x, z, pch = 19)

par (mfcol = c (2, 2))
# plot order
# 1 3
# 2 4
plot (x, y, pch = 20)
plot (x, z, pch = 19)
plot (x, y, pch = 20)
plot (x, z, pch = 19)
```

```
# "reset" mfrow 
par (mfrow = c (1, 1))

x <- rnorm (100)
y <- x + rnorm (100)

g <- gl (2, 50, labels = c ("Male", "Female"))

# create the plot, but don't add data yet
plot (x, y, type = "n")

points (x [g ==   "Male"], y [g ==   "Male"], col = "green")
points (x [g == "Female"], y [g == "Female"], col = "pink", pch = 19)
```