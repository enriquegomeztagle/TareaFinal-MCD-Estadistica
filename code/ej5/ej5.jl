using Statistics, Distributions, Printf

data = [1.5,1.6,1.5,1.4,1.9,1.4,1.3,1.9,1.8,1.7]
n  = length(data)
x̄ = mean(data)
s  = std(data; corrected=true)   # n‑1

mu0 = 1.4
df  = n - 1
t_obs = (x̄ - mu0) / (s / sqrt(n))
p_val = 1 - cdf(TDist(df), t_obs)
t_crit = quantile(TDist(df), 0.99)

@printf "Sample mean: %.2f L\n" x̄
@printf "Sample SD  : %.3f L\n" s
@printf "t-statistic: %.3f\n" t_obs
@printf "Critical t : %.3f\n" t_crit
@printf "p-value    : %.4f\n" p_val
println("Decision   : ", p_val < 0.01 ? "Reject H0" : "Fail to reject H0")
