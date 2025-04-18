% Data
data = [10, 10, 7, 12, 5, 7, 2, 1, 7, 2];
n = length(data);
mean_val = mean(data);
sd_val = std(data, 0); % sample std dev (normalized by n-1)

% a) 95% Confidence Interval for the mean
df = n - 1;
t_crit = tinv(0.975, df);
moe = t_crit * sd_val / sqrt(n);
conf_int_mean = [mean_val - moe, mean_val + moe];

% b) 98% Confidence Interval for standard deviation
alpha = 0.02;
chi2_lower = chi2inv(alpha / 2, df);
chi2_upper = chi2inv(1 - alpha / 2, df);

var_lower = (df * sd_val^2) / chi2_upper;
var_upper = (df * sd_val^2) / chi2_lower;
sd_lower = sqrt(var_lower);
sd_upper = sqrt(var_upper);
conf_int_sd = [sd_lower, sd_upper];

% c) Required sample size for margin ≤ 3 with 90% confidence
z = norminv(0.95); % one-tailed z-score
margin = 3;
n_required = (z * sd_val / margin)^2;
n_required_ceiled = ceil(n_required);

% Results
fprintf("Sample mean: %.2f\n", mean_val);
fprintf("Sample standard deviation: %.3f\n", sd_val);

fprintf("\n\na) 95%% CI for the mean: [%.2f, %.2f]\n", conf_int_mean(1), conf_int_mean(2));

fprintf("\n\nb) 98%% CI for the standard deviation: [%.2f, %.2f]\n", conf_int_sd(1), conf_int_sd(2));
if sd_lower > 2
    fprintf("The drug should NOT be released — σ > 2\n");
else
    fprintf("The drug MAY be released — σ ≤ 2\n");
end

fprintf("\n\nc) Required sample size: %.2f -> round up to %d\n", n_required, n_required_ceiled);
