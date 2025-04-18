using Statistics, Distributions, Printf

# Data
data = [10, 10, 7, 12, 5, 7, 2, 1, 7, 2]
n = length(data)
mean_val = mean(data)
sd_val = std(data; corrected=true)
# sample std dev (n-1)

# a) 95% Confidence Interval for the mean
df = n - 1
t_crit = quantile(TDist(df), 0.975)
moe = t_crit * sd_val / sqrt(n)
conf_int_mean = (mean_val - moe, mean_val + moe)

# b) 98% Confidence Interval for standard deviation
alpha = 0.02
chi2_lower = quantile(Chisq(df), alpha / 2)
chi2_upper = quantile(Chisq(df), 1 - alpha / 2)

var_lower = (df * sd_val^2) / chi2_upper
var_upper = (df * sd_val^2) / chi2_lower
sd_lower = sqrt(var_lower)
sd_upper = sqrt(var_upper)
conf_int_sd = (sd_lower, sd_upper)

# c) Required sample size for margin ≤ 3 with 90% confidence
z = quantile(Normal(0, 1), 0.95)
margin = 3
n_required = (z * sd_val / margin)^2
n_required_ceiled = ceil(Int, n_required)

# Results
@printf "Sample mean: %.2f\n" mean_val
@printf "Sample standard deviation: %.3f\n" sd_val

println("\na) 95% CI for the mean: ", conf_int_mean)
println("\nb) 98% CI for the standard deviation: ", conf_int_sd)

if sd_lower > 2
    println("The drug should NOT be released — σ > 2")
else
    println("The drug MAY be released — σ ≤ 2")
end

@printf "\nc) Required sample size: %.2f -> round up to %d\n" n_required n_required_ceiled
