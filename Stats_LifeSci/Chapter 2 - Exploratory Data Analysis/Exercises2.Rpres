Exploratory Data Analysis Exercises
========================================================
author: Jennifer Brite
date: March 4, 2016
autosize: true
Data Analysis for the Life Sciences


Question 1
========================================================

![](histogram.png)


Given the above histogram, how many people are between the ages of 35 and 45?

Question 1
========================================================

![](histogram.png)


Answer: 6

Question 2
========================================================

The InsectSprays data set is included in R. The dataset reports the counts of insects in agricultural experimental units treated with different insecticides. Make a boxplot and determine which insecticide appears to be most effective.

Question 2
========================================================

```r
boxplot(count~spray, InsectSprays,xlab="spray",ylab="count",cex=0)
```

![plot of chunk unnamed-chunk-1](Exercises-figure/unnamed-chunk-1-1.png)

Question 2
========================================================

Answer: C

Question 3
========================================================

Download and load this dataset into R. Use exploratory data analysis tools to determine which two columns are different from the rest. Which is the column that is positively skewed?

Question 3
========================================================


```r
load('skew.RData')
```

Question 4
========================================================

Which is the column that is negatively skewed?


```r
dat2 <-as.data.frame(dat)
par(mfrow = c(3,3))
hist(dat2$V1)
hist(dat2$V2)
hist(dat2$V3)
hist(dat2$V4)
hist(dat2$V5)
hist(dat2$V6)
hist(dat2$V7)
hist(dat2$V8)
hist(dat2$V9)
dev.off()
```


Question 4
========================================================

Which is the column that is negatively skewed?

![plot of chunk unnamed-chunk-4](Exercises-figure/unnamed-chunk-4-1.png)

```
null device 
          1 
```


Question 4
========================================================

Which is the column that is negatively skewed?

Answer: column 9

Question 5
========================================================

Let's consider a random sample of finishers from the New York City Marathon in 2002. This dataset can be found in the UsingR package. Load the library and then load the nym.2002 dataset.


```r
data(nym.2002, package="UsingR")
```



Use boxplots and histograms to compare the finishing times of males and females. Which of the following best describes the difference?

A) Males and females have the same distribution.
B) Most males are faster than most women.
C) Male and females have similar right skewed distributions with the former, 20 minutes shifted to the left.
D) Both distribution are normally distributed with a difference in mean of about 30 minutes.



Question 5
========================================================


```r
num2 <-as.data.frame(nym.2002)
boxplot(time~gender, num2)
```

![plot of chunk unnamed-chunk-6](Exercises-figure/unnamed-chunk-6-1.png)

Question 5
========================================================


```r
library(lattice)
histogram(~ time | gender, data=num2)
```

![plot of chunk unnamed-chunk-7](Exercises-figure/unnamed-chunk-7-1.png)



Question 5
========================================================


```r
aggregate( time~gender,  mean, data=num2 )
```

```
  gender     time
1 Female 284.9366
2   Male 261.8209
```

  gender     time
1 Female 284.9366
2   Male 261.8209

Question 5
========================================================


```r
aggregate( time~gender,  median, data=num2 )
```

```
  gender     time
1 Female 277.7250
2   Male 256.0167
```

  gender     time
1 Female 277.7250
2   Male 256.0167


Question 6
========================================================

Use dplyr to create two new data frames: males and females, with the data for each gender. For males, what is the Pearson correlation between age and time to finish?



```r
female <- num2[num2$gender == 'Female', ]
male <- num2[num2$gender == 'Male', ]
x=male$age
y=male$time
plot(x,y,xlab="Age",ylab="time",main=paste("correlation =",signif(cor(x,y),2)))
```


Question 6
========================================================

Use dplyr to create two new data frames: males and females, with the data for each gender. For males, what is the Pearson correlation between age and time to finish?


![plot of chunk unnamed-chunk-11](Exercises-figure/unnamed-chunk-11-1.png)


Question 7
========================================================

For females, what is the Pearson correlation between age and time to finish?



```r
x=female$age
y=female$time
plot(x,y,xlab="Age",ylab="time",main=paste("correlation =",signif(cor(x,y),2)))
```


Question 7
========================================================

For females, what is the Pearson correlation between age and time to finish?


![plot of chunk unnamed-chunk-13](Exercises-figure/unnamed-chunk-13-1.png)

Question 8
========================================================
If we interpret these correlations without visualizing the data, we would conclude that the older we get, the slower we run marathons, regardless of gender. Look at scatterplots and boxplots of times stratified by age groups (20-25, 25-30, etc..). 


```r
num2$age_grcut <- cut(num2$age, 
                       breaks = c(5, 25, 30, 35, 40, 50, 60, 70, 81), 
                       labels = c("5-25", "25-30", "30-35", "35-40", "40-50", "50-60", "60-70", "70-81"), right = FALSE)

boxplot(time~age_grcut, num2)
```


Question 8
========================================================


![plot of chunk unnamed-chunk-15](Exercises-figure/unnamed-chunk-15-1.png)

Question 8
========================================================

After examining the data, what is a more reasonable conclusion?
A) Finish times are constant up until about our 40s, then we get slower.
B) On average, finish times go up by about 7 minutes every five years.
C) The optimal age to run a marathon is 20-25.
D) Coding errors never happen: a five year old boy completed the 2012 NY city marathon.

Question 8
========================================================

After examining the data, what is a more reasonable conclusion?
A) Finish times are constant up until about our 40s, then we get slower.

Question 9
========================================================

When is it appropriate to use pie charts or donut charts?
A) When you are hungry.
B) To compare percentages.
C) To compare values that add up to 100%.
D) Never.

Question 9
========================================================

When is it appropriate to use pie charts or donut charts?
D) Never.

Question 10
========================================================

The use of pseudo-3D plots in the literature mostly adds:
A) Pizzazz.
B) The ability to see three dimensional data.
C) Ability to discover.
D) Confusion.

Question 10
========================================================

The use of pseudo-3D plots in the literature mostly adds:
D) Confusion.
