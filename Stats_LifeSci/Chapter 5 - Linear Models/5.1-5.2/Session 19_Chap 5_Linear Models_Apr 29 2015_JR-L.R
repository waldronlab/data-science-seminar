###title: "Linar Models, Section 4.1 and 4.2"
###author: "Jesica S. Rodriguez-Lopez"
###date: "Friday, April 29, 2016"

###INTRODUCTION
##eCERSICES
#1.wHICH IS THE LSE ESTIMATE OF G, BASED ON
g = 9.8
h0 = 56.67
v0 = 0
n = 25
tt = seq(0,3.4,len=n)
y = h0 + v0 *tt - 0.5* g*tt^2 + rnorm(n,sd=1)
X = cbind(1,tt,tt^2)
A = solve(crossprod(X))%*%t(X)
print(X)
print(A)
dim(A)
beta=A%*%y
print(beta)
ghat=-2*beta[3]
print(ghat)


#2.wHICH IS THE STANDARD ERROR OF THE ESTIAMTE OF G?

g = 9.8
h0 = 56.67
v0 = 0
n = 25
tt = seq(0,3.4,len=n)
X = cbind(1,tt,tt^2)
A = solve(crossprod(X))%*%t(X)

#solution
betahat=replicate(100000,{
    y = h0 + v0 *tt - 0.5* g*tt^2 + rnorm(n,sd=1)
    betahats <- A%*%y
    return(betahats[3])
})
SE=sd(betahat)
print(SE)


#3. In the father and son height examples,  What is the SE fo the slope
library(UsingR)
x = father.son$fheight
y = father.son$sheight
n = length(y)


N = 50
index = sample(n,N)
sampledat = father.son[index,]
x = sampledat$fheight
y = sampledat$sheight
betahat = lm(y~x)$coef
print(betahat)

#solution
#Monte Carlo simulation:
N = 50
B = 10000 
betahat<-replicate(B,{
    index = sample(n,N)
    sampledat = father.son[index,]
    x = sampledat$fheight
    y = sampledat$sheight
    betahats = lm(y~x)$coef
    return(betahats[2])
})
SE=sd(betahat)
print(SE)

#Which of the following is closest to the covariance between father heights and son heights?
n <- 100
Y <- rnorm(n)
X <- rnorm(n)
mean( (Y - mean(Y))*(X-mean(X) ) )

#solution

x = father.son$fheight
y = father.son$sheight
mean( (x - mean(x))*(y-mean(y)))

###DESIGN MATRIX

#Suppose we have two groups, control and high fat diet, with two samples each.
#For illustrative purposes, we will code these with 1 and 2 respectively. We should first tell R that
#these values should not be interpreted numerically, but as different levels of a factor. We can then
#use the paradigm  group to, say, model on the variable group.

group <- factor( c(1,1,2,2) )
model.matrix(~ group)
#or use the model.matrix function
#What about the formula function? We don't have to include this. By starting an expression with ,
#it is equivalent to telling R that the expression is a formula:

model.matrix(formula(~ group))

#What happens if we don't tell R that group should be interpreted as a factor?
group <- c(1,1,2,2)
model.matrix(~ group)

#A note about factors: the names of the levels are irrelevant to model.matrix and lm. All that matters
#is the order. For example:
group <- factor(c("control","control","highfat","highfat"))
model.matrix(~ group)

#More groups
#Using the same formula, we can accommodate modeling more groups. Suppose we have a third diet:
group <- factor(c(1,1,2,2,3,3))
model.matrix(~ group)

#An alternate formulation of design matrix is possible by specifying + 0 in the formula:
group <- factor(c(1,1,2,2,3,3))
model.matrix(~ group + 0)


#More variables
#using table function
diet <- factor(c(1,1,1,1,2,2,2,2))
sex <- factor(c("f","f","m","m","f","f","m","m"))
table(diet,sex)

#using model.matrix funtion
diet <- factor(c(1,1,1,1,2,2,2,2))
sex <- factor(c("f","f","m","m","f","f","m","m"))
model.matrix(~ diet + sex)

#interaction between factors:
model.matrix(~ diet + sex + diet:sex)
#or
model.matrix(~ diet*sex)

#Releveling: Defining different reference category, by default the first in alphabetical order
group <- factor(c(1,1,2,2))
group <- relevel(group, "2")
model.matrix(~ group)

#or by providing the levels explicitly in the factor call:
group <- factor(group, levels=c("1","2"))
model.matrix(~ group)

