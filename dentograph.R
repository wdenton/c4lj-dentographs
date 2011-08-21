#!/usr/bin/env Rscript

# Usage: dentograph.R mountain-data.txt filename.png "Library Name"

args         <- commandArgs(TRUE)
datafile     <- args[1]
output       <- args[2]
library_name <- args[3]

png(filename=output, height=1600, width=1600, units="px")

d <- read.table(datafile)
table <- table(d)
x <- 1:nrow(table)
y <- 1:ncol(table)
res <- persp(x, y, table,
        zlim = c(0,20000), # Change as necessary, or comment out
        theta = -5, phi = 20,
        scale = TRUE,
        border = NA,
        axes = F,
        box = F,
        col = "cyan",
        shade = 0.5,
        main = library_name, cex.main = 5)

xpoints = read.csv("x-axis-labels.csv")

for (i in 1:nrow(xpoints)) {
  points(trans3d(xpoints$Point[i], 5, 0, pmat = res), col = "#000000", pch = xpoints$Label[i], cex = 2)
}

# for (i in 1:nrow(xpoints)) {
#   lines(trans3d(x=xpoints$Point[i], y, z=0, pmat = res), col = "#00ffff")
# }
