n = 100;  % Size of table
M = zeros(n,n);  % Creates the matrix and fills it with zeros

for i = 1:n  % Iterate through rows
       for j = 1:n % Iterate through columns
           M(i,j) = i*j;  % Use value of row and value of column to 
       end
end
num_one = 63;
num_two = 88;
disp("The result of multiplying " + num_one + " and " + num_two + " is =");
disp(M(num_one,num_two));  % Prints out num_one * num_two

