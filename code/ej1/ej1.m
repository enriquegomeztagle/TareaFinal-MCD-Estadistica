% Parameters
mu = 10;
sigma2 = 4;
sigma = sqrt(sigma2);
N = 1e6;

% Simulation
rng(1); % For reproducibility
x1 = normrnd(mu, sigma, [N, 1]);
x2 = normrnd(mu, sigma, [N, 1]);

% Estimators
A1 = ((x1 + x2) / 2).^2;
A2 = (x1.^2 + x2.^2) / 2;

% Means and bias
mean_A1 = mean(A1);
mean_A2 = mean(A2);
bias_A1 = mean_A1 - mu^2;
bias_A2 = mean_A2 - mu^2;

% Display results
fprintf('mean(A1) = %.4f   bias ≈ %.4f\n', mean_A1, bias_A1);
fprintf('mean(A2) = %.4f   bias ≈ %.4f\n', mean_A2, bias_A2);

% Bias comparison
bias_diff = abs(bias_A1) - abs(bias_A2);
fprintf('\nBias difference (|bias A1| - |bias A2|): %.4f\n', bias_diff);

if abs(bias_A1) < abs(bias_A2)
    disp('→ Estimator A1 has lower bias and is better.');
elseif abs(bias_A2) < abs(bias_A1)
    disp('→ Estimator A2 has lower bias and is better.');
else
    disp('→ Both estimators have the same absolute bias.');
end

% Theoretical expectations
fprintf('\nTheoretical:\n');
fprintf('E[A1] = %.4f\n', mu^2 + sigma2 / 2);
fprintf('E[A2] = %.4f\n', mu^2 + sigma2);
