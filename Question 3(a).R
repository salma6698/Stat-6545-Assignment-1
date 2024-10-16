set.seed(123)
alpha1 <- 0.2
  alpha2 <- 0.8

# The target mixture distribution 
fx <- function(x) {
  d1 <- dnorm(x, mean = 1, sd = sqrt(0.5))  # N(1, 0.5)
  d2 <- dnorm(x, mean = 2, sd = sqrt(0.1))  # N(2, 0.1)
  return(alpha1 * d1 + alpha2 * d2)
}
# Proposal distribution : N(2, 0.8)
gx <- function(x) {
  dnorm(x, mean = 2, sd = 0.8)
}

# Function for Rejection sampling
rejection_sampling <- function(n_value) {
  samples <- numeric(n_value)
  accepted <- 0
  trials<-0
  
  # Maximum of target_density / proposal_density (estimated)
  M <- max(sapply(seq(-5, 5, length.out = 100), fx))
  
for(i in 1:n_value){
repeat{
trials<-trials+1
#Sample from proposal distribution

    x <- rnorm(1, mean = 2, sd = 0.8)
  
  # Acceptance probability
      u <- runif(1)
      accept_prob <- fx(x) / (M * gx(x))
      
      # Accept or reject
      if (u < accept_prob) {
        samples[i] <- x
      
        accepted <- accepted + 1
     break
}
      }
    }
  
  acceptance_rate <- accepted / trials
  return(list(samples=samples,acceptance_rate=acceptance_rate))
}

# Generate samples using rejection sampling
  
n_value <- 1000
result <- rejection_sampling(n_value)
samples <- result$samples
acceptance_rate <- result$acceptance_rate
cat("Acceptance rate:", acceptance_rate, "\n")

# Plot histogram of the samples from rejection sampling
hist(samples, breaks=30, prob = TRUE, main = "Rejection Sampling from Mixture",
     xlab = "x", col = "lightblue", ylim=c(0,1))
curve(fx, col = "red", lwd = 2, add = TRUE)  # Overlay target density


# Composition method for comparison
composition_sampling <- function(n_value) {
  
  samples <- numeric(n_value)
  for (i in 1:n_value) {
    # Randomly choose which normal to sample from based on the weights
    if (runif(1) < alpha1) {
      # Sample from N(1, 0.5)
      samples[i] <- rnorm(1, mean = 1, sd = sqrt(0.5))
    } else {
      # Sample from N(2, 0.1)
      samples[i] <- rnorm(1, mean = 2, sd = sqrt(0.1))
    }
  }
  return(samples)
}

# Generate samples using the composition method
n_value <- 1000
comp_samples <- composition_sampling(n_value)

# Plot histogram for sanity check
hist(comp_samples, breaks = 30, probability = TRUE, main = "Histogram of Samples from Composition",
     xlab = "x", col = "lightgreen")
curve(fx, add = TRUE, col = "red", lwd = 2)
