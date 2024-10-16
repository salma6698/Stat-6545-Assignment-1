set.seed(123)
n_value<-1000
# setting parameters
n<- 10
p<- 1/3
# Function for binomial CDF
binom_CDF <- function (x,n,p){
  return(pbinom(x,n,p))
}
# Function for generating sample from Binomial (10, 1/3) using inversion method
binom_inversion<- function (n_value, n, p){
samples<-numeric(n_value)
for(i in 1:n_value){
  U <- runif(1)
for(x in 0:n){
  if (binom_CDF (x,n,p) >= U){
    samples[i]<- x
break
  }
}
}
  return (samples)
}

# Generating 1000 samples
sample_Inversion <- binom_inversion(n_value, n,p)

#Histogram
hist (sample_Inversion, breaks= 10, main = "Inversion Method: Binomial(10, 1/3)",
      xlab = "Binomial(10, 1/3) Samples", col = "brown")
