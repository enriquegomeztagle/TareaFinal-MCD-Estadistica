using Distributions, Statistics, Printf

# Parameters
μ = 10.0
sigma2 = 4.0
sigma = sqrt(sigma2)
N = 1_000_000
d = Normal(μ, sigma)

# Simulation
x1 = rand(d, N)
x2 = rand(d, N)

A1 = ((x1 .+ x2) ./ 2) .^ 2
A2 = (x1 .^ 2 .+ x2 .^ 2) ./ 2

bias_A1 = mean(A1) - μ^2
bias_A2 = mean(A2) - μ^2

@printf("mean(A1) = %.4f   bias ≈ %.4f\n", mean(A1), bias_A1)
@printf("mean(A2) = %.4f   bias ≈ %.4f\n", mean(A2), bias_A2)

# Direct comparison
bias_diff = abs(bias_A1) - abs(bias_A2)
@printf "\nBias difference (|bias A1| - |bias A2|): %.4f\n" bias_diff

if abs(bias_A1) < abs(bias_A2)
    println("→ Estimator A1 has lower bias and is better.")
elseif abs(bias_A2) < abs(bias_A1)
    println("→ Estimator A2 has lower bias and is better.")
else
    println("→ Both estimators have the same absolute bias.")
end

# Theoretical expectations
println("\nTheoretical:")
@printf "E[A1] = %.4f\n" μ^2 + sigma2 / 2
@printf "E[A2] = %.4f\n" μ^2 + sigma2
