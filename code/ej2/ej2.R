# 1. Define bills
bills <- c(rep(50, 2), rep(200, 6), rep(500, 4))

# 2. Generate all combinations of 2 bills without replacement
combs <- combn(bills, 2)

# 3. Compute the sum for each combination
totals <- colSums(combs)

# 4. Count frequency of each total
total_counts <- table(totals)
n_samples <- length(totals)

# 5. Create data frame
df <- data.frame(
  Total = as.numeric(names(total_counts)),
  Frequency = as.numeric(total_counts),
  Probability = as.numeric(total_counts) / n_samples
)

print(df)

# 6. Expected value and variance
expected_value <- sum(df$Total * df$Probability)
expected_value_sq <- sum((df$Total^2) * df$Probability)
variance <- expected_value_sq - expected_value^2

cat("\nExpected value E[T]:", expected_value, "\n")
cat("Variance Var[T]:", variance, "\n")
