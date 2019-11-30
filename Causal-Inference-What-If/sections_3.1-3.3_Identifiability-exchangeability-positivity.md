
# Ch. 3.1-3.3 
# Observational Studies
### Martin Moser
### Topics in Data Science
### 2019/2020

## What is an observational study?

- systematic way of collecting data by observing people in natural setting
    - Book Example: Observe and record behavior over a certain time with N repetitions
    
- much human knowledge is derived from observational studies

- different types of observational studies

- Problem: lack of randomized treatment assignment => researcher bias

## Identifiability conditions

- An observational study can be conceptualized as a conditionally randomized experiment if the 3 **Identifiability conditions** hold:
    1. Consistency => treatments are well defined 
    2. Exchangeability => conditional probability of receiving every value of treatment depends ONLY on measured covariates L
    3. Positivity => probability of receiving every value of treatment conditional on L is greater than zero


- If the analogy holds => IP weighting and standardization can be used to identify causal effects in observational studies.

**Note** : if any of these fail - the analogy breaks down => other approaches with different identifiability assumptions

#### Identifiability of causal effects (Fine Point 3.1):

- Average causal effect is identifiable if the distribution of the observed data is compatible with a single value of the effect measure.


- For observational studies, we need an identifying assumption.

## Exchangeability

- Randomization ensures independent predictors of the outcome are equally distributed between the treated and the untreated
    - an independent predictor of the outcome is a covariate associated with the outcome Y within levels of treatment


- Conditional exchangeability $(Y^a  ⊥ A |L)$ holds in conditionally randomized experiments because within levels of L, all other predictors of the outcome are equally distributed between treated and untreated.


## Exchangeability in observational studies
- Ex. table 3.1:
- If data came from an observational study where doctors tend to give the scarce heart transplants to people in critical condition and L is the **only** outcome predictor that is unequally distributed, we can refer to the study as either:
    - An observational study
    - A (non-blinded) conditionally randomized experiment 

- Under either characterization, we can use IP weighting as well as standardization because conditional exchangeability holds 
- The problem is that we don't know if L is the only unequally distributed outcome predictor

## Caveats of exchangeability

- In the absence of randomization, there is not guarantee that conditional exchangeability holds (i.e. doctors tend to transplant hearts into nonsmokers)


- Possibility that there are other imbalanced outcome predictors that remain unmeasured


- Conditional exchangeability will not hold if there exists unmeasured outcome predictors U of the outcome such that the probability of receiving treatment A depends on U within the strata of L => investigators cannot empirically verify that this is the case
    - Therefore, we must hope that our expert knowledge is correct


## Positivity

- Positivity condition (= experimental treatment assumption) holds if:
    - Pr[ A = a | L = l ] > 0, for all values l with Pr[L = l] $\neq 0$
    

- Positivity is only needed for values l that are present in the population of interest
    - If study group is restricted to group L = 1, L = 0 does not require positivity
    - Positivity is only required for the variables L that are required for exchangeability ("blue-eyes" example)

## Caveats of Positivity

- In observational studies, neither positivity nor exchangeability are guaranteed:

- Example Positivity: table 3.1

    - Positivity would not hold if doctors always transplant a heart to individuals in critical condition (L = 1) 
      => Pr[ A = 0 | L = 1 ] = 0
      
    - If there were no untreated individuals (A = 0) in critical condition (L = 1), the data would not contain any information to simulate what would have happened had all treated individuals been untreated.


## Summary:

- assignment of treatment and control groups in observational studies can depend on characteristics of individuals

- 3 Identifiability conditions were introduced:
    - Consistency
    - Exchangeability
    - Positivity
    
- assumption that there is no unmeasured confounders => reasonable?

- ethical issues and researcher bias

### Discussion questions (11/20/2019)


```python
from pandas import DataFrame
table = {'Names': ['Rheia', 'Kronos', 'Demeter', 'Hades', 'Hestia', 'Poseidon', 'Hera', 'Zeus', 'Artemis', 'Apollo', 'Leto', 'Ares', 'Athena', 'Hephaestus', 'Aphrodite', 'Cyclope', 'Peresphone', 'Hermes', 'Hebe', 'Dionysus'],
         'L': [0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ,1],
        'A': [0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1],
        'Y': [0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0]}

df = DataFrame(table, columns=['Names', 'L', 'A', 'Y'], index=range(1,21))
df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Names</th>
      <th>L</th>
      <th>A</th>
      <th>Y</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1</th>
      <td>Rheia</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Kronos</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Demeter</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Hades</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Hestia</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Poseidon</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Hera</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Zeus</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>9</th>
      <td>Artemis</td>
      <td>1</td>
      <td>0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>10</th>
      <td>Apollo</td>
      <td>1</td>
      <td>0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>11</th>
      <td>Leto</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>12</th>
      <td>Ares</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>13</th>
      <td>Athena</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>14</th>
      <td>Hephaestus</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>15</th>
      <td>Aphrodite</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>16</th>
      <td>Cyclope</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>17</th>
      <td>Peresphone</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>18</th>
      <td>Hermes</td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <th>19</th>
      <td>Hebe</td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <th>20</th>
      <td>Dionysus</td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
</div>




```python
df['Y'].value_counts()
```




    1    10
    0    10
    Name: Y, dtype: int64



- To answer Merv's first question - yes we can use IP weighting and standardization
    - but only if L is the only unequally distributed outcome predictor

## ECMO Case study:
- **First** experiment - **modified** randomized trial: 
     - 11 ECMO assigned babies => 100% survival
     - 1 baby assigned to control treatment => 1 death
     
     
- **Second** experiment - RCT with a significance level of 0.05 and a stopping rule of 4 deaths
     - 9 ECMO assigned patients => 100%  survival
     - 10 assigned to control group => first 4 died (stopping rule)
     
     **Note:** 20 more patients where recruited before the stopping rule occured:
     Once trial stopped, all 20 patients were assigned to ECMO 19/20 survived
     

- Both experiments did not lead to any statistically significant results


- **Third** experiment (even more unethical) randomized trial without stopping rule involving 185 newborns was conducted
    - stopped because of too many deaths on the non-treated arms

#### ECMO became the conventionally accepted treatment around the world for pulmonary hypertension and other respitory failures in newborns

    

## Ethical considerations and dicussion questions:

- is it ethical to perform such trials at all?
    - ethical and legal standards of care (duty of physicians to patients)
    
    
- is it ethical to not assign a stopping rule?


- what do you think about the third trial they conducted?


- how should we choose our level of significance in studies like that? 


- what other ethical issues can you think of?
