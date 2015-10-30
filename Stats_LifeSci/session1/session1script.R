## Examples for presentation

getwd()
setwd("~/Documents/Present/StatsLifeSci/exData")
dir()

files <- lapply(dir(), function(x) file.info(x)$size/1024^2)
names(files) <- dir()
files

# read_csv(dir()[4])

# Timing the file read in

system.time(read_csv("ss13pusb.csv"))
system.time(read.csv("ss13pusb.csv"))
