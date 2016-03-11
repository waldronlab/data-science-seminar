

Robust Summaries & Rank tests
========================================================
author: Lucas Schiffer
date: March 07, 2016
autosize: true
Data Analysis for the Life Sciences

Topics
========================================================
- Introduction
- Median
- Median Absolute Deviation
- Spearman Correlation
- Symmetry of Log Ratios
- Wilcoxon Rank Sum Test

Introduction
========================================================
<p style="text-align: center">
<img src="pcr.png" style="max-width: 50%; max-height: 50%; box-shadow: none;">
<br>
Thermal Cycler
<a href="https://tinyurl.com/z5meacs" style="display: block; font-size: small">https://tinyurl.com/z5meacs</a>
</p>
<p style="text-align: center">
<img src="cytometer.png" style="max-width: 50%; max-height: 50%; box-shadow: none;">
<br>
Flow Cytometer
<a href="https://tinyurl.com/zfgun7w" style="display: block; font-size: small">https://tinyurl.com/zfgun7w</a>
</p>
***
<p style="text-align: center">
<img src="scintillation.png" style="max-width: 50%; max-height: 50%; box-shadow: none;">
<br>
Liquid Scintillation Counter
<a href="https://tinyurl.com/jerufaq" style="display: block; font-size: small">https://tinyurl.com/jerufaq</a>
</p>
<p style="text-align: center">
<img src="spectrometer.png" style="max-width: 50%; max-height: 50%; box-shadow: none;">
<br>
FTIR Spectrometer
<a href="https://tinyurl.com/hdrzs6x" style="display: block; font-size: small">https://tinyurl.com/hdrzs6x</a>
</p>

Introduction
========================================================
left: 35%
<img src="Robust Summaries & Rank Tests-figure/unnamed-chunk-1-1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" style="display: block; margin: auto;" />

```
Mean =  1.11 
SD = 10.03 
Median = 0.17
```
***
- Expensive Devices Make Mistakes
- Expert Researchers Make Mistakes
- Systematic Errors Occur Often
- Random Errors Occur Often
- Equipment Cost ≠ Error Rate

Median
========================================================
- Robust to Outliers
- For Ordered Data, Given by the Middle Term
- Must Average Two Terms Where n of Terms is Even
- The Smallest Value of i that Satisfies the Inequality

$$\sum_{i=1}^{j} f_i ≥ \frac{n+1}{2}$$

Median
========================================================
<img src="Robust Summaries & Rank Tests-figure/unnamed-chunk-2-1.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" style="display: block; margin: auto;" />

```
Mean =  1.11 
SD = 10.03 
Median = 0.17
```
***
<img src="Robust Summaries & Rank Tests-figure/unnamed-chunk-3-1.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" style="display: block; margin: auto;" />

```
Mean =  0.11 
SD = 0.9 
Median = 0.11
```

Median Absolute Deviation
========================================================
- Robust version of standard deviation
- Compute the Difference Between Each Point and the Median
- Then Take the Median of Their Absolute Values

$$\operatorname{MAD} = \operatorname{median}_{i}\left(\ \left| X_{i} - \operatorname{median}_{j} (X_{j}) \right|\ \right), \$$

Median Absolute Deviation
========================================================
<img src="Robust Summaries & Rank Tests-figure/unnamed-chunk-4-1.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" style="display: block; margin: auto;" />

```
SD = 10.03
```
***
<img src="Robust Summaries & Rank Tests-figure/unnamed-chunk-5-1.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" style="display: block; margin: auto;" />

```
MAD = 0.89
```

Spearman Correlation
========================================================
- Also Known as Spearman's Rho
- Raw Values Are Standardized and Ranked
- Ranked Values Range from 0 to 1
- Robust Because Outliers Rank Lower

$$r_s = \rho_{\operatorname{rg}_X,\operatorname{rg}_Y} = \frac {\operatorname{cov}(\operatorname{rg}_X,\operatorname{rg}_Y)} { \sigma_{\operatorname{rg}_X} \sigma_{\operatorname{rg}_Y} }$$

Spearman Correlation
========================================================
<img src="Robust Summaries & Rank Tests-figure/unnamed-chunk-6-1.png" title="plot of chunk unnamed-chunk-6" alt="plot of chunk unnamed-chunk-6" style="display: block; margin: auto;" />
***
<img src="Robust Summaries & Rank Tests-figure/unnamed-chunk-7-1.png" title="plot of chunk unnamed-chunk-7" alt="plot of chunk unnamed-chunk-7" style="display: block; margin: auto;" />

Symmetry of Log Ratios
========================================================
- Properties of Logarithms Yields Symetric Ratios
- Allows for Normalization of Exponential Data
- Data Becomes Linear, More Amenable to Analysis
- Robust Statistics for Exponential Data 

$$\log(x/y)=\log(x)-\log(y)=-(\log(y)-\log(x))=\log(y/x)$$

Symmetry of Log Ratios
========================================================
<img src="Robust Summaries & Rank Tests-figure/unnamed-chunk-8-1.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" style="display: block; margin: auto;" />
***
<img src="Robust Summaries & Rank Tests-figure/unnamed-chunk-9-1.png" title="plot of chunk unnamed-chunk-9" alt="plot of chunk unnamed-chunk-9" style="display: block; margin: auto;" />

Symmetry of Log Ratios
========================================================
<img src="Robust Summaries & Rank Tests-figure/unnamed-chunk-10-1.png" title="plot of chunk unnamed-chunk-10" alt="plot of chunk unnamed-chunk-10" style="display: block; margin: auto;" />
***
<img src="Robust Summaries & Rank Tests-figure/unnamed-chunk-11-1.png" title="plot of chunk unnamed-chunk-11" alt="plot of chunk unnamed-chunk-11" style="display: block; margin: auto;" />

Wilcoxon Rank Sum Test
========================================================
- Also Known as the Mann-Whitney Test
- Just as Mean and Standard Deviation are Suseptible to Outliers, so too is the T-Test
- In Essence Data are Combined, Ranked, Stratified into Groups, and Finally Given an Average Rank
- Provides a Non-Parametric Method for Hypothesis Testing

Wilcoxon Rank Sum Test
========================================================
<img src="Robust Summaries & Rank Tests-figure/unnamed-chunk-12-1.png" title="plot of chunk unnamed-chunk-12" alt="plot of chunk unnamed-chunk-12" style="display: block; margin: auto;" />

```
t-test pval: 0.04439948
```
***
<img src="Robust Summaries & Rank Tests-figure/unnamed-chunk-13-1.png" title="plot of chunk unnamed-chunk-13" alt="plot of chunk unnamed-chunk-13" style="display: block; margin: auto;" />

```
Wilcox test pval: 0.1310212
```

The End
========================================================
#### The Exercises <- http://rpubs.com/schifferl/rse
