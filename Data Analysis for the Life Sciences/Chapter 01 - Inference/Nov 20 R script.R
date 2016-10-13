library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- read.csv(filename)
dat <- na.omit(dat)

install.packages("dplyr")
library("dplyr")
mchow <- filter(dat, Diet=="chow", Sex=="M")
mean(mchow$Bodyweight)
summary(mchow)

install.packages("rafalib")
library("rafalib")
popsd(mchow$Bodyweight)
sd(mchow$Bodyweight, na.rm=TRUE)

set.seed(1)
sample_n(mchow, 25, replace = FALSE)
y <- sample_n(mchow, 25, replace = FALSE)
mean(y$Bodyweight)

library("dplyr")
mhighfat <- filter(dat, Diet=="hf", Sex=="M")
mhighfat <- na.omit(mhighfat)
mean(mhighfat$Bodyweight)
summary(mhighfat)



library("rafalib")
popsd(mhighfat$Bodyweight)
                 
sd(mhighfat$Bodyweight)

set.seed(1)
sample_n(mhighfat, 25, replace = FALSE)
x <- sample_n(mhighfat, 25, replace = FALSE)
mean(x$Bodyweight)

abs(mean(mhighfat$Bodyweight) - mean(mchow$Bodyweight))
abs(mean(y$Bodyweight) - mean(x$Bodyweight))


library("dplyr")
fchow <- filter(dat, Diet=="chow", Sex=="F")
mean(fchow$Bodyweight)
summary(fchow)

library("rafalib")
popsd(fchow$Bodyweight)
                 
sd(fchow$Bodyweight)

set.seed(1)
sample_n(fchow, 25)
a <- sample_n(fchow, 25)
mean(a$Bodyweight)

library("dplyr")
fhighfat <- filter(dat, Diet=="hf", Sex=="F")
fhighfat <- na.omit(fhighfat)
mean(fhighfat$Bodyweight)
summary(fhighfat)


library("rafalib")
popsd(fhighfat$Bodyweight)
                 
sd(fhighfat$Bodyweight)

set.seed(1)
sample_n(fhighfat, 25)
b <- sample_n(fhighfat, 25)
mean(b$Bodyweight)

abs(mean(fhighfat$Bodyweight) - mean(fchow$Bodyweight))
abs(mean(a$Bodyweight) - mean(b$Bodyweight))

                 
                 
                 
                 
                 