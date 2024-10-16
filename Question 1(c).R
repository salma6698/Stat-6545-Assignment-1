set.seed(123)
n<-10
p<-1/3
n_value<-100

# Using Inversion method

binom_CDF <- function (x,n,p){
  sum (dbinom (0:x, n,p))
}
# Function for generating sample from Binomial (10, 1/3) using inversion method
binom_inversion_sample<- function (n,p){
  U <- runif(1)
  x<- 0
  while (binom_CDF (x,n,p) < U){
    x<- x + 1
  }
  return (x)
}

# Generate 100 samples using the inversion method
samples <- replicate(n_value, binom_inversion_sample(n, p))

# Monte Carlo estimate of the expectation
mu <- mean(samples)

s<-sd(samples)
SE<-s/sqrt(n_value)

ci<-c(mu - 1.96 * SE, 
      mu + 1.96 * SE)

cat("Estimated Mean (Expectation):", mu, "\n")
cat("Standard Error:", SE, "\n")
cat("95% Confidence Interval:", ci, "\n")
