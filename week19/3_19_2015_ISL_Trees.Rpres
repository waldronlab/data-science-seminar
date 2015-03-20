Making Descisions with Trees
========================================================
author: Timothy Tickle
date: 3-20-2015

---
 
![tree_vs_linear](3_19_2015_ISL_Trees-figure/Bonsai-trees.jpg)

The General Intuition
====

![tree_vs_linear](3_19_2015_ISL_Trees-figure/Intuition.png)

Trees Divide and Estimate
====

1. Break up the complicated predictor space into a number of simple regions.

2. Make predictions within those regions.

A Tree Visually
====

The term "Tree" comes from the fact that splitting the space can be done with a descision tree.

---

![anatomy1](3_19_2015_ISL_Trees-figure/azalea.jpg)

The Anatomy of a Tree
====
class:midcenter

![anatomy1](3_19_2015_ISL_Trees-figure/Tree_8_1.png)

The Anatomy of a Tree
====

![anatomy2](3_19_2015_ISL_Trees-figure/Tree_8_1.png)

---

![anatomy3](3_19_2015_ISL_Trees-figure/Tree_8_2.png)

Regression Trees
====

- Response is continuous.
- 3 regions in this example.
  - R1={X|Years<4.5}
  - R2={X|Years>=4.5,Hits<117.5}
  - R3={X|Years>=4.5,HIts>=117.5}
- Years is most important in predicting salary. Among players who are experience, the number of hits in previous year affects salary.

How to Stratify the Feature Space
====

- How do we break up the predictors?
- Recursive binary splitting.
![tree_vs_linear](3_19_2015_ISL_Trees-figure/Intuition.png)
  - Top-down, greedy, exhaustive.
  
How to Stratify the Feature Space
====

- Minimize the Residual Sum of Squares (RSS).
- $\sum_{j=1}^{J} \sum_{i\in R_{j}} ( y_{n} - \hat{y}_{R_{j}} )^2$
- $\sum_{i: x_{i} \in R_{1(j,s)}}(y_{i} - \hat{y}_{R_{1}})^2 + \sum_{i: x_{i} \in R_{2(j,s)}} (y_{i} - \hat{y}_{R_{2}})^2$
- j = predictor, s = cut point
- $R_{1}$ Region 1, $R_{2}$ = Region 2.
- $\hat{y}_{R_{1}}$ = mean response for training observations in $R_{1}(J,S)$.
- $\hat{y}_{R_{2}}$ = mean response for training observations in $R_{2}(J,S)$.

How to Stratify the Feature Space
====

- Continue by repeating.
  - Instead of stratifying the full range of the response we have 2 regions to stratify.
  - Keep going until a stopping criteria.
    - Often a terminal node must have a minimum number of observations.

Stratified Feature Space Visually
====
class:midcenter

![tree_vs_linear](3_19_2015_ISL_Trees-figure/Tree_8_3.png)

Tree Complexity: Bias/Variance Trade Off
====

- If we keep stratifying we can have very small nodes that have low variance in the response and predict well.
  - The predictions will be overly biased to the training data.
  - Overfitting the data / poor test performance.
  - Tree is overly complex.
  
---

![anatomy6](3_19_2015_ISL_Trees-figure/tree-1.jpg)

Bonsai Trees!
====

How do we reduce complexity?

1. Only allow a new split to occur if a certain reduction is RSS is met (some given threshold).
  - Short sighted. What happens when a split producing small change in RSS is followed by a split creating a large change in RSS?
2. Grow out a large tree and prune it back.
  - We can not cross-validate all subtrees (often a large number).
  - Cost complexity pruning (weakest link pruning).

Cost Complexity Pruning
====

Sorta like lasso's lambda

$\sum_{m=1}^{|T|} \sum_{x_{i} \in R_{m}} ( y_{i} - \hat{y}_{R_{m}})^2 + \alpha|T|$

- m = interates through terminal nodes
- |T| = the number of terminal nodes of the tree T
- $R_{m}$ = region in predictor space
- $\alpha$ = nonegative tuning parameter
  - The higher the amount the more penality for having more nodes.

Building Regression Trees: Roots to leaves
====

1. Recursive binary splitting to build a large tree on TRAINING data.
  - Stopping criteria = min number observations.
2. Create a sequence of subtrees by varying the $\alpha$ during cost. complexity pruning.
3. Use K-fold cross validation to choose $\alpha$.
4. Select an $\alpha$.
5. Select the subtree corresponing to the selected $\alpha$.

Building a Regression Tree
====
class:midcenter

![tree_vs_linear](3_19_2015_ISL_Trees-figure/Tree_8_4.png)

Building a Regression Tree
====
class:midcenter

![tree_vs_linear](3_19_2015_ISL_Trees-figure/Tree_8_5.png)

Classification Trees
====

Predicts qualitative response not a quantitative one.
- Instead of using mean of the observations in a node to predict use Mode.
  - Error ends up being how many of the observations in a node are the mode.
  - Classification error rate not RSS.
  - $E = 1 - max_{k}( \hat{p}_{mk})$
    - m = region, k = class

Building Classification Trees
====

Often the Gini index or Cross-entrophy is used when building a classification tree.
 - Gini Index (G) = $\sum_{k=1}^{K} \hat{p}_{mk}( 1 - \hat{p}_{mk} )$
 - Cross-entrophy (D) = - $\sum_{k=1}^{K} \hat{p}_{mk} log \hat{p}_{mk}$
 
When pruning trees use:
- Classification error rate
- Gini index
- Cross-entrophy

Building Classification Trees
====
class:midcenter

![tree_vs_linear](3_19_2015_ISL_Trees-figure/Tree_8_6.png)

Trees vs Linear Models
====

- Which is better
  - It depends on the question...

---
  
![anatomy1](3_19_2015_ISL_Trees-figure/linear.jpg)

Trees vs Linear Models
====
class:midcenter

![tree_vs_linear](3_19_2015_ISL_Trees-figure/Tree_8_7.png)

Advantages of Trees
====

- Easy to explain.
- May more closely mirror human descision making.
- Intuitive graphically.
- Quantitative or qualitative predictors.
  - No dummy variables!

Disadvantages
====

- Generally do not have the same level of predictive accuracy as other approach presented.
  - Bagging, random forests, bootstrapping can improve performance.
  
Questions?
====
class:midcenter

![tree_vs_linear](3_19_2015_ISL_Trees-figure/kunio-kobayashi-bonsai.JPG)
