# Stat-6545-Assignment-1
1. Suppose that you have only have access to a routine that produces samples U from the Uniform [0, 1] distribution. Most packages used for statistical computing, such as R or MATLAB have access to such a routine. 
(a) Write a program that uses the inversion method to sample from a Binomial (10, 1/3) distribution. Run the program and plot a histogram of 1, 000 samples. Recall that here you will need to make use of the pseudo-inverse of the cumulative distribution function.

**Solution:**
To sample from Binomial (n, p) distribution using inversion method we need to consider CDF of binomial distribution. The CDF is:

```math

F( x ) = P( X \leq x ) = \sum_{i=0}^x \binom{n}{i} p^i q^(n-i)
```
For a given Uniform random sample U ~ Uniform (0,1)  and transforming it using the inverse of the CDF of binomial dstribution. We simulate U and find the smallest x such that the cumulative probability P( X ≤ x ) is greater than or equal to U. 

**Result from R code:**
The histogram represents the frequency distribution of 1000 samples drawn from Binomial (10, 1/3) distribution. The values are mostly clusters around 2 to 4 where the mean of the distribution lies.

(b) Now, using what you know about Binomial distributions, write a program that uses a combination of the inversion and transformation methods to sample from the same Binomial (10, 1/3) distribution. Run the program and plot a histogram of 1, 000 samples. For this part, your answer should include a short proof of the correctness of your approach as well as the program itself.

**Solution:**
Here, we use the combination of both inversion and transformation methods. This combinantion is useful when we want to reduce computational effort of the target distribution.

**Inversion method:** as explained in (a), the inversion method relies on the CDF of Binomial distribution. By generating U ~ Uniform (0,1) and finding the smallest x such that F(x) \leq U.

**Transformation method:** It involves using a different related distribution here it is Bernouli (p) distribution to get sample from Binomial (n, p) distribution.

For Binomial distribution, we can transform a sum of Bernoulli trials with each probability of success is (p). For Binomial ( n=10, p=1/3), We can simulate the sum of 10 Bernoulli trials each with probability p=1/3.

**Proof of Correctness:**
Each Bernoulli trial is an independent random variable with probability p = 1/3. The sum of these independent Bernoulli trials gives the Binomial distribution.

That means sampling from Binomial distribution can be done by generating n Bernoulli samples. This transformation method works well because it has binary outcomes and can be compared with Uniform.

**Result from R code:**
The plotted histogram closely matches the Binomial (10, 1/3) distribution.

(c) We know that the expectation of a Binomial (10, 1/3) distribution is exactly 10/3. However, let’s pretend that we don’t know its true value and want to estimate it using elementary Monte Carlo integration. Use 100 samples generated with one of the methods above to estimate the expectation of a Binomial (10, 1/3) distribution and provide the standard error of the estimate and approximate confidence bounds as per the Central Limit Theorem. You should briefly restate the theory behind this approximation before applying it: simply putting the answer with confidence bounds will not earn full marks.

**Solution:**
We know the expectation of Binomial (n, p) is n * p. Here, it is 10 * 1/3 = 10/3.

We can also estimate the expectation of a Binomial distribution using Monte Carlo simulation. 

**Monte Carlo integration:**  It is a technique to estimate the expected value of a random variable by generating samples from that distribution and computing the mean. In this case, we approximate the expected value of binomial distribution by taking the average of simulated random samples from it.

**Central Limit Theorem:** For sufficiently large sample sizes, the sample mean follows an approximately normal distribution. We will generate 100 samples from binomial distribution using the inversion method and compute the sample mean as an estimator for the expectation. The standard error of the mean is given by:

```math
SE = \sigma /\sqrt{n}

Where σ is the sample standard deviation and n is the number of samples.
an approximate 95% confidence interval for the expectation:

\hat{\mu} \pm \hat{\sigma}/\sqrt{n}

where, \hat{\mu} is the mean and z_0.025=1.96 is the critical value for a 95% confidence interval.

**Explanation:**
•	The mean of the samples is our estimate of the expectation.
•	We calculate the standard error and 95% confidence interval using the Central Limit Theorem.

**Restatement of the Theory:** The Central Limit Theorem states that for large enough sample sizes, the sampling distribution of the sample mean will be approximately normally distributed, regardless of the underlying distribution. The mean of this distribution is the true mean, and the standard deviation is the standard error. The 95% confidence interval is then computed as mean \pm 1.96 * SE.

**Result from R code:**
Estimated expectation: 3.34
Standard error: 0.144404
95% confidence interval: (3.056968, 3.623032)



