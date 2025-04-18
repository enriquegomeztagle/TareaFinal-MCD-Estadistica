# Data
data <- c(1.5,1.6,1.5,1.4,1.9,1.4,1.3,1.9,1.8,1.7)
n  <- length(data)
x_bar <- mean(data)
s  <- sd(data)        # n‑1

# One‑sided t‑test
mu0 <- 1.4
t_obs <- (x_bar - mu0) / (s / sqrt(n))
df   <- n - 1
p_val <- 1 - pt(t_obs, df)
t_crit <- qt(0.99, df)

cat(sprintf("Sample mean: %.2f L\n", x_bar))
cat(sprintf("Sample SD  : %.3f L\n", s))
cat(sprintf("t-statistic: %.3f\n", t_obs))
cat(sprintf("Critical t : %.3f\n", t_crit))
cat(sprintf("p-value    : %.4f\n", p_val))
cat("Decision   :", if (p_val < 0.01) "Reject H0" else "Fail to reject H0", "\n")
