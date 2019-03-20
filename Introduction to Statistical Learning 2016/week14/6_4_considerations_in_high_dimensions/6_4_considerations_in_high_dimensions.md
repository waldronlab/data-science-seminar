6.4 Considerations in High Dimensions
========================================================
author: Timothy Tickle
date: February 6, 2015
css: 6_4_considerations_in_high_dimensions.css


Statistics in the Low-dimensions
========================================================

The low-dimensional setting.

- Simply when the number of observations (n) are greater than the number of features (p).
  - n > p


Example of the Low-dimensional Setting
=====

Predicting blood pressure from age, gender, and BMI.
- Thousands of patients with information available (n)
- 3 predictors (p)
- (1000s) n >> (3) p


Statistics in the High-dimensional Setting
====

- When the number of observations are less than the number of features
  - p > n
  - p >> n
  - p = n


High Dimensional Data is Common
====

Medical Research
- Studying Obesity
  - Age, Sex, BMI, 500,000 SNPs in 1000 patients
  - 500,003 (p) >> 1000 (n)
  
---

<img src="6_4_considerations_in_high_dimensions-figure/big_cat.jpg" width="400">


High Dimensional Data is Common
====

Big Data-
- Many points of data are collected
- Netflix
  - Every movie you watch and rate
  - Is this a high-dimensional or low-dimensional setting?


Low-dimensional Setting Concepts Apply
====

Concepts we have learned still apply
- Bias-variance trade-off
- Danger of overfitting

Some algorithms we have studied are not good choices
- (e.g.) 
  - Least Squares Linear Regression, 
  - Logistic Regression
  - LDA


Least Squares LM: A Cautionary Tale
====

Special care is needed for algorithm selection and interpretation of results.

Least Squares will ALWAYS yield a set of coefficient estimates that result in a perfect fit to the data (residuals = zero). Even if there is NO true relationship.

---

<img src="6_4_considerations_in_high_dimensions-figure/ISLR_6_4_1.png"" width="500">


How Does This Apply to prediction?
====

Least Squares LM is too flexible in the high-dimensional setting.
- You will overfit you data in your training set.
- You will perform poorly in your test.
- Your model will not be useful.


Least Squares LM Performs Worse as Dimensions Increase
====

<img src="6_4_considerations_in_high_dimensions-figure/ISLR_6_4_2.png" width="800">

- All features unrelated to predictor
- Model R^2 increases as predictors are added (Seems good)
- Model MSE decreases as predictors are added (Seems good)
- Prediction MSE gets large as predictors are added (Very bad)


But We Already Learned this, Adjust R^2
====

Nope.


But We Already Learned this, Adjust R^2
====

But to be more specific...

- $\hat{\sigma^2} = 0$
- Cp = $\frac{1}{n}(RSS+2d\hat{\sigma^2})$ = $\frac{0}{n}$
- AIC = $\frac{1}{n\hat{\sigma}^2}(RSS+2d\hat{\sigma^2})$ = $\frac{0}{0}$
- BIC = $\frac{1}{n}(RSS+log(n)d\hat{\sigma^2})$ = $\frac{0}{n}$
- Adj R^2 = $1 - \frac{\frac{RSS}{n-d-1}}{\frac{TSS}{n-1}}$ = $1 - \frac{0}{\frac{TSS}{n-1}}$ = 1

There is Hope!
====

Be less flexible and avoid overfitting!
- Forward stepwise selection
- Ridge regression
- The LASSO
- Principal Components Regression


LASSO in Progressively High Dimensions
====

<img src="6_4_considerations_in_high_dimensions-figure/ISLR_6_4_3.png" width="700">


Reduce Features, Tune, and Know Your Features!
====

1. Regularization / shrinkage is key
2. Tuning parameter selection is crucial for good performance
3. As dimensions increase test error increases
   - Unless the new features are truly associated with the response
   - Curse of dimensionality
   - Adding new features adds noise which may be spuriously associated with the response.
     - And so overfitting.


Food for Thought
====

We see new technologies which are expensive but yield many measurements on individuals. This forces a high dimensional setting. These technologies will only increase predictive power if they provide informative features, otherwise they make the task of prediction worse.

---

<img src="6_4_considerations_in_high_dimensions-figure/professor_cat.jpg" width="300">

Interpreting Results in High Dimensions
====

<img src="6_4_considerations_in_high_dimensions-figure/prediction_cat.jpg" width="300">

---

**Multicollinearity** Variables in a matrix might be correlated with each other.

**Multicollinearity (HD)** Any variable in the model can be written as a linear combination of all the other variables in the model.

We can NEVER know which variable is TRULY predictive.

Interpreting the SNP Study
====

In our previous study we find 17 SNPs lead to a good predictive model on the training data.

What can we conclude?


Interpreting the SNP Study
====

This is one set of 17 SNPs (one model) out of MANY possible models in the data set.

The model is predictive and valuable.

Further validation on independent data sets is needed.


Don't Forget
====

Never use the following measures on **TRAINING** data as evidence of a good model fit in the HD Setting:
- Sum of Squared Errors
- P-values
- R^2 or other traditional measure of model fit

Report these metrics on independent data sets.

Only the beginning...
===================

<img src="6_4_considerations_in_high_dimensions-figure/ninja_cat.jpg" width="300">

You are well on your way to becoming a ninja in high-dimensions!
