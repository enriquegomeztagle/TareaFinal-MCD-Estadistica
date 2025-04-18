# Parameters
mu <- 10
sigma2 <- 4
sigma <- sqrt(sigma2)
N <- 1e6

# Simulation
set.seed(123)
x1 <- rnorm(N, mean = mu, sd = sigma)
x2 <- rnorm(N, mean = mu, sd = sigma)

# Estimators
A1 <- ((x1 + x2) / 2)^2
A2 <- (x1^2 + x2^2) / 2

# Bias calculation
mean_A1 <- mean(A1)
mean_A2 <- mean(A2)
bias_A1 <- mean_A1 - mu^2
bias_A2 <- mean_A2 - mu^2

# Print results
cat(sprintf("mean(A1) = %.4f   bias ≈ %.4f\n", mean_A1, bias_A1))
cat(sprintf("mean(A2) = %.4f   bias ≈ %.4f\n", mean_A2, bias_A2))

# Bias comparison
bias_diff <- abs(bias_A1) - abs(bias_A2)
cat(sprintf("\nBias difference (|bias A1| - |bias A2|): %.4f\n", bias_diff))

if (abs(bias_A1) < abs(bias_A2)) {
  cat("→ Estimator A1 has lower bias and is better.\n")
} else if (abs(bias_A2) < abs(bias_A1)) {
  cat("→ Estimator A2 has lower bias and is better.\n")
} else {
  cat("→ Both estimators have the same absolute bias.\n")
}

# Theoretical expectations
cat("\nTheoretical:\n")
cat(sprintf("E[A1] = %.4f\n", mu^2 + sigma2 / 2))
cat(sprintf("E[A2] = %.4f\n", mu^2 + sigma2))
