f = @(x,y) -0.5*exp(x/2).*sin(5*x) + 5*exp(x/2).*cos(5*x) + y; % anonym beskrivelse av høreside-funksjonen (obs: vi bruker x istf t som variabel).
x0 = 0; y0 = 0;                 % Initialverdien (løsningsfunksjonen skal gå igjenom punktet (0,0))
ytrue = @(x) exp(x/2).*sin(5*x);

n = 80; b = 8;
[x, y] = Rungekutta4(f,x0,y0,b,n);
Error = abs(ytrue(x)-y);              % Feilen
RelError = 100*Error./abs(ytrue(x));  % Relativ feil i prosent
figure, plot(x, ytrue(x), 'b-'), hold on
plot(x,y,'k*')
legend('sann y','estimert y'), grid
xlabel('x'), ylabel('y(x)')
dirfield(f,0:0.1:8,-40:1:80)
inds = (1:b)*(n/b)+1; % Dette er indeksene som gir x-verdiene (1:8) som vi er interessert i

% --------------
Table = [x(inds) ytrue(x(inds)) y(inds) RelError(inds)];
