% 1. Define bills
bills = [repmat(50,1,2), repmat(200,1,6), repmat(500,1,4)];

% 2. All combinations of 2 bills
pairs = nchoosek(bills, 2);

% 3. Sum of each pair
totals = sum(pairs, 2);

% 4. Frequency count
[unique_vals, ~, idx] = unique(totals);
freq = accumarray(idx, 1);
prob = freq / length(totals);

% 5. Table
T = table(unique_vals, freq, prob, 'VariableNames', {'Total_T', 'Frequency', 'Probability'});
disp(T)

% 6. Expected value and variance
E_T = sum(unique_vals .* prob);
E_T2 = sum((unique_vals.^2) .* prob);
Var_T = E_T2 - E_T^2;

fprintf('\nExpected value E[T]: %.2f\n', E_T);
fprintf('Variance Var[T]: %.2f\n', Var_T);
