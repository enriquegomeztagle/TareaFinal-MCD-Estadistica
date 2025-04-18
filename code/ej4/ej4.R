# Data
n  <- 100
x  <- 10
p_hat <- x / n  # sample proportion

# a) 95% CI
z95   <- qnorm(0.975)
se_p_hat <- sqrt(p_hat * (1 - p_hat) / n)
ci95  <- c(p_hat - z95 * se_p_hat,
           p_hat + z95 * se_p_hat)

# b) One‑sided z‑test (H0: p ≤ 0.05)
p0    <- 0.05
se_h0 <- sqrt(p0 * (1 - p0) / n)
z     <- (p_hat - p0) / se_h0
pval  <- 1 - pnorm(z)
reject <- pval < 0.05

if (reject) {
  rec <- "RETURN the lot (evidence of >5% defective)"
} else {
  rec <- "ACCEPT the lot (no evidence of >5% defective)"
}

# --------------- Results ---------------
cat(sprintf("Sample proportion (p̂): %.3f\n", p_hat))
cat(sprintf("a) 95%% CI for true proportion p: [%.3f, %.3f]\n\n",
            ci95[1], ci95[2]))

cat("b) Hypothesis Test (H0: p ≤ 0.05, H1: p > 0.05)\n")
cat(sprintf("   z-statistic = %.3f\n", z))
cat(sprintf("   p-value     = %.4f\n", pval))
cat(sprintf("   Decision    : %s\n",
            if (reject) "Reject H0" else "Fail to reject H0"))

cat("\n----------------------------------------------\n")
cat("c) Manager's recommendation:", rec, "\n")
