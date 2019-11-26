function [t, y] = Rungekutta4(f,t0,y0,tn,n)
% Input:
% f - funksjon av (t,y) som er h yresiden i difflikningen y' = f(t,y).
% t0 -initialverdi og startpunkt for intervallet der vi skal estimere y-verdier. 
% y0 - y-initialverdi.
% tn - endepunktet for intervallet der vi skal estimere y-verdier. 
% n - antall punkter vi vil estimere y(t) for i det aktuelle intervallet [t0 tn].
% Output:
% t - t-verdiene vi estimerer y(t) for.
% y - de estimerte y(t)-verdiene
dt = (tn-t0)/n; % Steglengden. 
t = (t0 : dt : tn)'; % Alle t-verdiene for estimering av y(t) 
y = zeros(n+1,1); % S ylevektor der estimerte y-verdier skal lagres.
y(1) = y0; % Initialbetingelsen er at løsningen går igjennom (t0,y0)
% Runge kutta metoden (av fjerde orden) for estimering av y-verdiene:
% --------------
for k = 2:n+1
    k1 = dt*f(t(k-1),y(k-1));
    k2 = dt*f(t(k-1)+dt/2,y(k-1)+k1/2);
    k3 = dt*f(t(k-1)+dt/2,y(k-1)+k2/2);
    k4 = dt*f(t(k-1)+dt,y(k-1)+k3);
    y(k) = y(k-1)+k1/6+k2/3+k3/3+k4/6;
end
% --------------