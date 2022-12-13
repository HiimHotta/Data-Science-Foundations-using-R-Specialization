# Notes of lectures from Lesson 3

## Graphic Devices

OBS: remember to import `library (datasets)`

### Usual way to plot (Shows on screen)

```
library (datasets)
with (faithful, plot (eruptions, waiting))
title (main = "Old Faithful Geyser Data")
```

### Save on pdf file

```
# open pdf device and create a file on current working directory
pdf (file = "myplot.pdf")

# create a plot and send to file (no plot appears on screen)
with (faithful, plot (eruptions, waiting))
title (main = "Old Faithful Geyser Data")

# close the pdf device
dev.off ()
```

### Copy plot on screen to png file

```
library (datasets)
with (faithful, plot (eruptions, waiting))
title (main = "Old Faithful Geyser Data")

# copy to a png file
dev.copy (png, file = "geiserplot.png")

# don't forget to close png file
dev.off ()
```