% Data
n = 100;
x = 10;
p_hat = x / n;

% a) 95% CI for proportion
z95 = norminv(0.975);
se_p = sqrt(p_hat * (1 - p_hat) / n);
ci95 = [p_hat - z95 * se_p, p_hat + z95 * se_p];

% b) One‑sided z‑test (H0: p ≤ 0.05)
p0 = 0.05;
se_h0 = sqrt(p0 * (1 - p0) / n);
zstat = (p_hat - p0) / se_h0;
pval  = 1 - normcdf(zstat);
reject = pval < 0.05;

if reject
    rec = "RETURN the lot (evidence of >5% defective)";
else
    rec = "ACCEPT the lot (no evidence of >5% defective)";
end

% --------------- Results ---------------
fprintf("Sample proportion (p̂): %.3f\n", p_hat);
fprintf("a) 95%% CI for true proportion p: [%.3f, %.3f]\n\n", ci95);

fprintf("b) Hypothesis Test (H0: p ≤ 0.05, H1: p > 0.05)\n");
fprintf("   z-statistic = %.3f\n", zstat);
fprintf("   p-value     = %.4f\n", pval);
if reject
    decision = "Reject H0";
else
    decision = "Fail to reject H0";
end
fprintf("   Decision    : %s\n", decision);

fprintf("\n----------------------------------------------\n");
fprintf("c) Manager's recommendation: %s\n", rec);
