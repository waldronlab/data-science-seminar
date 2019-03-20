
## ------------------------------------------------------------------------
library(ISLR)
data(College)


## ------------------------------------------------------------------------
summary(College)


## ------------------------------------------------------------------------
pairs(College[, 1:10])


## ------------------------------------------------------------------------
par(mfrow=c(4,4), mar=c(2, 2, 1, 0))
for (i in 2:17)
  boxplot(College[, i] ~ College[, 1], xlab="", main=colnames(College)[i])


## ------------------------------------------------------------------------
College$Elite <- College$Top10perc > 50
summary(College[, c("Top10perc", "Elite")])


## ------------------------------------------------------------------------
boxplot(Outstate ~ Elite, data=College)


## ------------------------------------------------------------------------
par(mfrow=c(2,2))
hist(College$Top10perc, breaks=5)
hist(College$Top10perc, breaks=10)
hist(College$Top10perc, breaks=20)
hist(College$Top10perc, breaks=40)


## ------------------------------------------------------------------------
library(pheatmap)
pheatmap(t(as.matrix(scale(College[, 2:18]))),
         annotation=College[1],
         show_colnames=FALSE)


## ------------------------------------------------------------------------
summary(complete.cases(Auto))


## ------------------------------------------------------------------------
sapply(Auto, class)


## ------------------------------------------------------------------------
summary(Auto)


## ------------------------------------------------------------------------
head(unique(Auto$name[Auto$origin==1]), 10)
head(unique(Auto$name[Auto$origin==2]), 10)
head(unique(Auto$name[Auto$origin==3]), 10)


## ------------------------------------------------------------------------
Auto$origin <- factor(Auto$origin, levels=1:3, labels=c("U.S.", "Europe", "Japan"))


## ------------------------------------------------------------------------
sapply(Auto, class)


## ------------------------------------------------------------------------
quant <- sapply(Auto, is.numeric)
quant


## ------------------------------------------------------------------------
sapply(Auto[, quant], range)


## ------------------------------------------------------------------------
sapply(Auto[, quant], function(x) signif(c(mean(x), sd(x)), 2))


## ------------------------------------------------------------------------
output <- sapply(Auto[-10:-85, quant], function(x) round(c(range(x), mean(x), sd(x)), 2))
rownames(output) <- c("min", "max", "mean", "sd")
output


## ------------------------------------------------------------------------
library(pheatmap)
pheatmap(t(scale(as.matrix(Auto[, quant]))), 
         annotation=Auto["origin"],
         show_colnames=FALSE)


## ------------------------------------------------------------------------
library(MASS)


## ----, eval=FALSE--------------------------------------------------------
## ?Boston


## ------------------------------------------------------------------------
dim(Boston)


## ------------------------------------------------------------------------
summary(Boston)


## ------------------------------------------------------------------------
pairs(Boston)


## ------------------------------------------------------------------------
pheatmap(t(scale(as.matrix(Boston))), 
         show_colnames=FALSE)


## ------------------------------------------------------------------------
summary(Boston$rad)
table(Boston$rad)


## ------------------------------------------------------------------------
Boston$rad[Boston$rad==24] <- NA


## ------------------------------------------------------------------------
table(Boston$tax)


## ------------------------------------------------------------------------
Boston$tax[Boston$tax==666] <- NA


## ------------------------------------------------------------------------
pheatmap(cor(Boston, use="pairwise.complete.obs"))


## ------------------------------------------------------------------------
par(mfrow=c(2,2))
hist(Boston$crim, main="Crime Rates\n (note the long tail)",breaks="FD")
hist(Boston$crim, main="Crime Rates with y-axis limited", 
     ylim=c(0, 40), breaks="FD")
hist(Boston$tax, main="Tax rates\n (note some high-tax outliers)", breaks="FD")
hist(Boston$ptratio, main="Pupil-teacher ratio\n (no real outliers)", breaks="FD")


## ------------------------------------------------------------------------
summary(Boston$chas==1) ## (=1 if tract bounds river; 0 otherwise)


## ------------------------------------------------------------------------
median(Boston$ptratio)


## ------------------------------------------------------------------------
which.min(Boston$medv)


## ------------------------------------------------------------------------
par(mfrow=c(5,3), mar=c(2, 2, 1, 0))
for (i in 1:ncol(Boston)){
  hist(Boston[, i], main=colnames(Boston)[i], breaks="FD")
  abline(v=Boston[399, i], col="red", lw=3)
}


## ------------------------------------------------------------------------
summary(Boston$rm > 7)


## ------------------------------------------------------------------------
summary(Boston$rm > 8)


## ------------------------------------------------------------------------
idx <- Boston$rm > 8
summary(idx)


## ------------------------------------------------------------------------
par(mfrow=c(5,3), mar=c(2, 2, 1, 0))
for (i in 1:ncol(Boston)){
  hist(Boston[, i], main=colnames(Boston)[i], breaks="FD")
  abline(v=Boston[idx, i], col="red", lw=1)
}

