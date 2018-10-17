library(readr)

#Task 8, Part a)
getwd()
setwd("C:/Users/Jan/Documents/Data Science/3.Semester/TopicsDataScience")

college_wd = read.csv("College.csv")
college_link = read.csv("http://www-bcf.usc.edu/~gareth/ISL/College.csv")
rm(college_wd, college_link)

college = read.csv("C:/Users/Jan/Documents/Data Science/3.Semester/TopicsDataScience/College.csv")

#Part b)
fix(college)

rownames(college) = college[,1]
fix(college)

college = college[,-1]
#head(college)

#Part c)
summary(college)
pairs(college[,1:10])
plot(as.factor(college$Private), college$Outstate, xlab = "Private University", ylab = "Out-of-state tuition")

Elite = rep("No", nrow(college))
Elite[college$Top10perc > 50] = "Yes"
Elite = as.factor(Elite)
college = data.frame(college, Elite)

summary(college$Elite)
plot(college$Elite, college$Outstate, xlab = "Elite University", ylab = "Out-of-state tuition")

hist(college$PhD, main = "Summary: Number of PhD students", xlab = "Number of students", ylab = "Frequency")

par(mfrow=c(2,2))
hist(college$Apps)
hist(college$Accept)
hist(college$Enroll)
hist(college$Top25perc)


cor(college$Apps, college$Accept)

par(mfrow=c(1,1))
plot(college$Apps, college$Accept, ylab = "Applications", xlab = "Accepted students")

rm(list = ls())

##############################################################################################################################

#Task 9
Auto = read.csv("http://www-bcf.usc.edu/~gareth/ISL/Auto.csv", header = T, na.strings ="?") #na.strings: a character vector of strings which are to be interpreted as NA values
Auto = na.omit(Auto)

#Part a)
str(Auto)
#all, except "name", are quantitative.

factor = c()
for(i in 1:ncol(Auto)){
  factor = c(factor, is.factor(Auto[,i]))
}

#Part b)
ind = which(factor == F)
apply(Auto[,ind], 2, range)

#Part c)
apply(Auto[,ind], 2, mean)
apply(Auto[,ind], 2, sd)

#Part d)
Auto_sub = Auto[-(10:85),]
apply(Auto_sub[,ind], 2, range)
apply(Auto_sub[,ind], 2, mean)
apply(Auto_sub[,ind], 2, sd)

#Part e)
hist(Auto$cylinders, main = "Frequency per cylinder", xlab = "Cylinder") #Number of cylinders in a car

hist(Auto$year, main = "New cars per year", xlab = "Year")  #New cars per year

plot(Auto$weight, Auto$acceleration)  #graphical correlation between car weight and acceleration
#cor(Auto$weight, Auto$acceleration)  #heavy cars accelerate faster

plot(Auto$horsepower, Auto$acceleration)  #graphical correlation between horsepower and acceleration
#cor(Auto$horsepower, Auto$acceleration)  #stronger cars accelerate faster

plot(Auto$horsepower, Auto$mpg) #graphical correlation between horsepower and Miles/gallon
#cor(Auto$horsepower, Auto$mpg) #stronger cars need more fuel

#Part d)
install.packages("corrplot")
library(corrplot)

#car name is arbitrary (no correlation with other variables)
Auto_cor = cor(Auto[,ind])
corrplot(Auto_cor, method = "circle")
#cylinders, displacement, horsepower and weight correlate negative with mpg
#year and origin correlate positive and less
#acceleration has the smallest correlation (positive)

#all could be used for prediction, but we need to make sure that predictors don´t correlate (like cylinders and weight or horsepower)

rm(list = ls())

##############################################################################################################################

#Task 10, Part a)
#install.packages(MASS)
library (MASS)
Boston = Boston

dim(Boston)
#str(Boston)
#rows are observations, columns are variables (predictors)

#Part b)
plot(Boston$lstat, Boston$crim) #the higher the percentage of lower status, the higher the crime rate

attach(Boston)#can use Boston variables without calling Boston everytime
plot(rm, lstat) #the less lower status ratio, the more rooms per dwelling
plot(dis, age)  #the higher the proportion of owner occupied units, the closer the employment centres

#Part c)
Boston_cor = cor(Boston)
crim_cor = Boston_cor[,1]
corrplot(Boston_cor, method = "circle")
#rad(index of accessibility to radial highways) has a correlation of r = 0.63, which is quite high. If there is access, then the crime is high
#tax(full-value property-tax rate per \$10,000.) correlates with r = 0.58, which is also high.
#all other variables (except chas), have a small or medium correlation

#Part d)
plot(crim)
plot(tax)
plot(ptratio)

#made plot() instead of range(), visually clear where outliers could be
#between Index ~360 and ~490 it looks like the ratio (in all variables) are higher as usual

#Part e)
table(chas)
#35 suburbs bound the Charles river

#Part f)
median(ptratio)

#Part g)
#calculate the median
Boston1 = Boston[order(age),] 
ind1 = Boston1$age[(nrow(Boston1)/2)]

#filter the right suburb and show the values of the other predictors
subset(Boston, age == ind1)
summary(Boston) #compare with Quartiles of other predictors

#Part h)
room7 = subset(Boston, rm > 7)
nrow(room7)
room8 = subset(Boston, rm > 8)  #filter variable "rm" more than eight
nrow(room8) #number of observations with filter = TRUE

detach(Boston)

