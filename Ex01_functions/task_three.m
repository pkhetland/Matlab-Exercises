n = 1000;         % Number of months
threshhold = 0.1;
F = zeros(n,1); % Vector to contain result of calculations
F(1) = 1;
F(2) = 1;

for k = 3:n % Loops through numbers from 3 to n
    r = rand(1); % Draw a random number
    if F(k-1) > 0  % If the last number returned is greater than zero
        if r > threshhold % Perform normal calculation
            F(k) = F(k-1) + F(k-2);  % Add two previous numbers
            disp("Population has increased to " + F(k) + " in month " + k + ".");
        else
            F(k) = F(k-1) - F(k-2);  % Subtract two previous numbers
            disp("Population has decreased to " + F(k) + " in month " + k + ".");
        end
    else  % If last number is equal to or less than zero
        disp("The rabbit population is exterminated!");
        break  % Break the while loop
    end
end

figure, plot(F), grid
title('Fibonacci numbers with n up to n')
set(gca, 'YScale', 'log')  % A logarithmic scale gives us a much more readable graph