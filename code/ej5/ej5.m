data = [1.5 1.6 1.5 1.4 1.9 1.4 1.3 1.9 1.8 1.7];
n  = numel(data);
xbar = mean(data);
s    = std(data, 0);          % n‑1

mu0 = 1.4;
df  = n - 1;
t_obs = (xbar - mu0) / (s / sqrt(n));
t_crit = tinv(0.99, df);
p_val  = 1 - tcdf(t_obs, df);

fprintf("Sample mean: %.2f L\n", xbar);
fprintf("Sample SD  : %.3f L\n", s);
fprintf("t‑statistic: %.3f\n", t_obs);
fprintf("Critical t : %.3f\n", t_crit);
fprintf("p‑value    : %.4f\n", p_val);

if p_val < 0.01
    decision = 'Reject H0';
else
    decision = 'Fail to reject H0';
end
fprintf("Decision   : %s\n", decision);
