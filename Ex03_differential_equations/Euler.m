function [t, y] = Euler(f,t0,y0,tn,n)
% Input:
% f - funksjon av (t,y) som er h yresiden i difflikningen y' = f(t,y).
% t0 -initialverdi og startpunkt for intervallet der vi skal estimere y-verdier. 
% y0 - y-initialverdi.
% tn - endepunktet for intervallet der vi skal estimere y-verdier. 
% n - antall punkter vi vil estimere y(t) for i det aktuelle intervallet [t0 tn].
% Output:
% t - t-verdiene vi estimerer y(t) for.
% y - de estimerte y(t)-verdiene
dt = (tn-t0)/n; % Steglengden i Eulers metode. 
t = (t0 : dt : tn)'; % Alle t-verdiene for estimering av y(t) 
y = zeros(n+1,1); % S ylevektor der estimerte y-verdier skal lagres.
y(1) = y0; % Initialbetingelsen er at l sningen g r igjenom (t0,y0)
% Eulers metode for estimering av y-verdiene:
% --------------
for k = 2:n+1
    y(k) =  f(t(k-1),y(k-1))*dt + y(k-1); 
end
% --------------