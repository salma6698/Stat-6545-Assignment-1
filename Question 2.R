set.seed(123)
# Function to generate Poisson(t) samples using transformation method
poisson_transform <- function(t, n_value) {
  samples <- numeric(n_value)  
  for (i in 1:n_value) {
    s <- 0  # Sum of exponential variables
    n <- 0  # Poisson count
    while (s <= t) {
      U <- runif (1)
      e <- -log(U)
      s <- s + e  # Exponential(1) random variable
      n <- n + 1
    }
    samples[i] <- n - 1  # Poisson sample
  }
  return(samples)
}
# Run the program for t = 1 and 10, 100, 1000 and 10000 samples
t_value <- 1
sample_sizes<-c(10,100,1000,10000)


results<-data.frame(Sample_Size=integer(), Mean=numeric(),Std_Error=numeric(),CI=c(numeric(),numeric()))

for (size in sample_sizes) {
  pois_samples<-poisson_transform(t,size)
  mu <- mean (pois_samples)
  SD <-sd(pois_samples)
  SE<- SD/sqrt(size)
  ci<-c(mu-1.96*SE, mu+1.96*SE)
  results <- rbind(results, data.frame(SampleSize = size,
                                       Mean = mu,
                                       Std_Error=SE,
                                       CI= c(ci[1],ci[2])))
  cat("Sample Size:", size, "\n")
  cat("Estimated Mean:", mu, "\n")
  cat("Standard Error:", SE, "\n")
  cat("95% Confidence Interval:", ci, "\n\n")
}
#Histogram

final_sample <- poisson_transform(t, 10000)
hist(final_sample, breaks = seq(-0.5, max(final_sample) + 0.5, by = 1),
     col = "lightblue", main = "Histogram of Poisson(1) Samples",
     xlab = "Value", ylab = "Frequency", freq = TRUE)
