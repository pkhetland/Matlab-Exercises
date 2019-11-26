function [M] = create_table(n)
if n >= 0
    M = zeros(n,n);  % Creates the matrix and fills it with zeros
    for i = 1:n  % Iterate through rows
           for j = 1:n % Iterate through columns
                M(i,j) = i*j;  % Use value of row and value of column to calculate values
           end
    end
else
    disp('The value of "n" must be greater than 0.');
end