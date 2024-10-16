#Setting parameters
set.seed (123)
n<- 10
p<- 1/3
n_value <- 1000

# Inversion method for Bernoulli(p)
bernoulli_inversion<- function(p){
  U<-runif(1)
  return(ifelse(U<p, 1, 0))
}

#Combination of inversion and transformation method for Binomial (n,p)
binomial_combined<- function(n, p, n_value){
  samples<- numeric (n_value)
  for(i in 1:n_value){
    trials<- replicate (n, bernoulli_inversion(p))
    samples[i] <- sum (trials)
  }
  return(samples)
}
  
  binomial_inv_trans<- binomial_combined(n,p,n_value)
  
  #Plot histogram of 1000 samples
  hist (binomial_inv_trans, breaks=10, col='red',main="Histogram of Binomial(10, 1/3) Samples",
        xlab="Number of Successes", ylab="Frequency", freq=TRUE)
