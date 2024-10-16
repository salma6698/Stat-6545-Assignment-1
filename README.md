# Stat-6545-Assignment-1
1. Suppose that you have only have access to a routine that produces samples U from the Uniform [0, 1] distribution. Most packages used for statistical computing, such as R or MATLAB have access to such a routine. 
(a) Write a program that uses the inversion method to sample from a Binomial (10, 1/3) distribution. Run the program and plot a histogram of 1, 000 samples. Recall that here you will need to make use of the pseudo-inverse of the cumulative distribution function.

**Solution:**
To sample from Binomial (n, p) distribution using inversion method we need to consider CDF of binomial distribution. The CDF is:

```math

F( x ) = P( X \leq x ) = \sum_{i=0}^x {n \\choose i} p^i q^(n-i)
```
For a given Uniform random sample U ~ Uniform (0,1)  and transforming it using the inverse of the CDF of binomial dstribution. We simulate U and find the smallest x such that the cumulative probability P( X ≤ x ) is greater than or equal to U. \n

**Result from R code:**
The histogram represents the frequency distribution of 1000 samples drawn from Binomial (10, 1/3) distribution. The values are mostly clusters around 2 to 4 where the mean of the distribution lies.\n

(b) Now, using what you know about Binomial distributions, write a program that uses a combination of the inversion and transformation methods to sample from the same Binomial (10, 1/3) distribution. Run the program and plot a histogram of 1, 000 samples. For this part, your answer should include a short proof of the correctness of your approach as well as the program itself.\n

**Solution:**
Here, we use the combination of both inversion and transformation methods. This combinantion is useful when we want to reduce computational effort of the target distribution.\n
**Inversion method:** as explained in (a), the inversion method relies on the CDF of Binomial distribution. By generating U ~ Uniform (0,1) and finding the smallest x such that F(x) \leq U.\n
**Transformation method:** It involves using a different related distribution here it is Bernouli (p) distribution to get sample from Binomial (n, p) distribution.\n

For Binomial distribution, we can transform a sum of Bernoulli trials with each probability of success is (p). For Binomial ( n=10, p=1/3), We can simulate the sum of 10 Bernoulli trials each with probability p=1/3.\n

**Proof of Correctness:**
Each Bernoulli trial is an independent random variable with probability p = 1/3. The sum of these independent Bernoulli trials gives the Binomial distribution.\n

That means sampling from Binomial distribution can be done by generating n Bernoulli samples. This transformation method works well because it has binary outcomes and can be compared with Uniform.\n

**Result from R code:**
The plotted histogram closely matches the Binomial (10, 1/3) distribution.\n



