# Function for binomial CDF
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

# Generating 1000 samples
set.seed(123)
sample_Inversion <- replicate(1000, binom_inversion_sample(n,p)) 

#Histogram
hist (sample_Inversion, breaks= 10, main = "Inversion Method: Binomial(10, 1/3)",
      xlab = "Binomial(10, 1/3) Samples", col = "brown")
