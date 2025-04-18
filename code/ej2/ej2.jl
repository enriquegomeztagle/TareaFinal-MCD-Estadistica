using Combinatorics, DataFrames, Statistics, Printf, StatsBase

# 1. Define bills
bills = vcat(fill(50,2), fill(200,6), fill(500,4))

# 2. All combinations of 2 bills without replacement
sample_pairs = collect(combinations(bills, 2))

# 3. Compute totals
totals = [sum(pair) for pair in sample_pairs]

# 4. Frequency count
total_counts = countmap(totals)
n_samples = length(totals)

# 5. Create DataFrame
df = DataFrame(Total_T = Int[], Frequency = Int[], Probability = Float64[])
for (val, count) in sort(collect(total_counts))
    push!(df, (val, count, count / n_samples))
end

println(df)

# 6. Expected value and variance
expected_value = sum(df.Total_T .* df.Probability)
expected_sq = sum((df.Total_T .^ 2) .* df.Probability)
variance = expected_sq - expected_value^2

println()
@printf "Expected value E[T]: %.2f\n" expected_value
@printf "Variance Var[T]: %.2f\n" variance
