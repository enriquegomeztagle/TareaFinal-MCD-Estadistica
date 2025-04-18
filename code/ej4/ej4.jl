using Statistics, Distributions, Printf

# Sample data
n   = 100
x   = 10
p̂   = x / n

# a) 95 % CI for the proportion
z_95   = quantile(Normal(), 0.975)
se_p̂  = sqrt(p̂ * (1 - p̂) / n)
margin = z_95 * se_p̂
ci_95  = (p̂ - margin, p̂ + margin)

# b) One‑sided test (H0: p ≤ 0.05)
p0     = 0.05
se_h0  = sqrt(p0 * (1 - p0) / n)
z_stat = (p̂ - p0) / se_h0
p_val  = 1 - cdf(Normal(), z_stat)
reject = p_val < 0.05

# c) Recommendation
rec = reject ?
      "RETURN the lot (evidence of >5% defective)" :
      "ACCEPT the lot (no evidence of >5% defective)"

# ---------------- Results ----------------
@printf "Sample proportion (p̂): %.3f\n" p̂
println("a) 95% CI for true proportion p: ", ci_95)

println("\nb) Hypothesis Test (H0: p ≤ 0.05, H1: p > 0.05)")
@printf "   z-statistic = %.3f\n" z_stat
@printf "   p-value     = %.4f\n" p_val
println("   Decision    : ", reject ? "Reject H0" : "Fail to reject H0")

println("\n" * "-"^46)
println("c) Manager's recommendation: ", rec)
