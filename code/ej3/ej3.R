# Load required package
if (!requireNamespace("stats", quietly = TRUE)) {
  stop("The 'stats' package is required.")
}

# Data
data <- c(10, 10, 7, 12, 5, 7, 2, 1, 7, 2)
n <- length(data)
mean_val <- mean(data)
sd_val <- sd(data)
# sample standard deviation (n-1)

# a) 95% Confidence Interval for the mean
df <- n - 1
t_crit <- qt(0.975, df)
moe <- t_crit * sd_val / sqrt(n)
conf_int_mean <- c(mean_val - moe, mean_val + moe)

# b) 98% Confidence Interval for standard deviation
alpha <- 0.02
chi2_lower <- qchisq(alpha / 2, df)
chi2_upper <- qchisq(1 - alpha / 2, df)

var_lower <- (df * sd_val^2) / chi2_upper
var_upper <- (df * sd_val^2) / chi2_lower
sd_lower <- sqrt(var_lower)
sd_upper <- sqrt(var_upper)
conf_int_sd <- c(sd_lower, sd_upper)

# c) Required sample size for margin ≤ 3 with 90% confidence
z <- qnorm(0.95)  # one-tailed z-score for 90% confidence
margin <- 3
n_required <- (z * sd_val / margin)^2
n_required_ceiled <- ceiling(n_required)

# Results
cat(sprintf("Sample mean: %.2f\n", mean_val))
cat(sprintf("Sample standard deviation: %.3f\n", sd_val))

cat(sprintf("\n\na) 95%% CI for the mean: [%.2f, %.2f]\n", conf_int_mean[1], conf_int_mean[2]))

cat(sprintf("\n\nb) 98%% CI for the standard deviation: [%.2f, %.2f]\n", conf_int_sd[1], conf_int_sd[2]))
if (sd_lower > 2) {
  cat("The drug should NOT be released — σ > 2\n")
} else {
  cat("The drug MAY be released — σ ≤ 2\n")
}

cat(sprintf("\n\nc) Required sample size: %.2f -> round up to %d\n", n_required, n_required_ceiled))
