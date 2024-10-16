# Stat-6545-Assignment-1
1. Suppose that you have only have access to a routine that produces samples U from the Uniform [0, 1] distribution. Most packages used for statistical computing, such as R or MATLAB have access to such a routine. 
(a) Write a program that uses the inversion method to sample from a Binomial (10, 1/3) distribution. Run the program and plot a histogram of 1, 000 samples. Recall that here you will need to make use of the pseudo-inverse of the cumulative distribution function.

Solution:
To sample from Binomial (n, p) distribution using inversion method we need to consider CDF of binomial distribution. The CDF is:
$\` F( x ) = P( X ≤ x ) = \sum_{i=0}^x {n \\choose i) p^i q^((n-i) )`$
For a given Uniform random sample U ~ Uniform (0,1)  and transforming it using the inverse of the CDF of binomial dstribution. We simulate U and find the smallest x such that the cumulative probability P( X ≤ x ) is greater than or equal to U. 
npm install @stdlib/stats-base-dists-binomial-pmf
