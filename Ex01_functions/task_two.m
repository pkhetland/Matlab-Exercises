counter = 0;                % Amount of calculations before condition is met
sum = 0;                    % Sum of two random numbers between 0 and 1
threshhold = 1.9;           % Threshhold for stopping the calculation
while sum <= threshhold     % While the sum does not exceed the threshhold
    sum = rand(1)+rand(1);  % Add two random numbers
    counter = counter + 1;  % Count amount of tries
end
display(counter)