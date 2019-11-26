n = 20;  % The desired length of our Tribonacci vector
T = zeros(n,1);  % T is the vector meant to contain our Tribonacci numbers as they're calculated.
T(1) = 1;
T(2) = 1;
T(3) = 1;  % Our first three numbers in the T-vector
for k = 4:n  % Creates a for loop to iterate through numbers from 4 to 20 and add the three previous numbers.
    T(k) = T(k-1) + T(k-2) + T(k-3);  % Performs the calculations and adds the result to T
end
disp(T)
figure, plot(T), grid
title('Tribonnaci numbers up to n=20')
