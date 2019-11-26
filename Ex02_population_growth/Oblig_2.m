%% Befolkningstall

Y =  [    1950;    1955;    1960;    1965;    1970;    1975;    1980;    1985;    1990;    1995;    2000;    2005;    2010;    2015]; % Årstall
B =  [ 2518269; 2755823; 2981659; 3334874; 3692492; 4068109; 4434682; 4830979; 5263593; 5674380; 6070581; 6453628; 6909000; 7223487]; % Folketall målt i enheter på tusen.

%% Oppgave 1: 

% Beregner veksten mellom hver femårsperiode.
vekst = zeros(1,length(B)-1);  % Definerer tom vektor

for k = 2:length(B)  % Itererer gjennom periodene
    vekst(k-1) = B(k) - B(k-1);  % Regner ut differansen og legger til i "vekst"
end 

% TEST
disp(vekst)


%% Oppgave 2:

% Lager en tom vektor
prosentvis_vekst = zeros(1, length(B)-1);

% Itererer gjennom hvert år og finner den prosentvise veksten
for k = 2:length(B)
    prosentvis_vekst(k-1) = ((B(k)/B(k-1)*100)-100);
end

% TEST
disp(prosentvis_vekst)


%% Oppgave 3

snitt_vekst = zeros(1, length(B)-1);  % Definerer tom vektor
% Bruker summen av den prosentvise veksten i periodene og deler på antallet
% perioder.
for k = 2:length(B)
    snitt_vekst(k-1) = prosentvis_vekst(k-1)/5;
end

% TEST
disp(snitt_vekst);


%% Oppgave 4

% Går ut fra ligning B(1) * (1 + x)^65 = B(14)

eqn = log(B(14)/B(1))/65;  % Definerer likningen
vekst_p_a = exp(eqn)-1;  % Gjør Sx om til desimaltall ved double()-funksjon
vekst_p_5_a = (((1+vekst_p_a)^5)-1);  
% Finner veksten per 5 år for å sammenligne med svare i oppgave 3.

% TEST
disp('Årlig vekstrate');
disp(vekst_p_a*100);
disp('Vekstrate per 5 år i oppgave 4: ');
disp(vekst_p_5_a*100);


%% Oppgave 5

% Likningen i oppgave 4 finner den årlige vekstfaktoren per år som står bak
% veksten i befolkningen fra 1950 til 2015.

% For å beregne tiden det tar for dobling i folketallet tar vi 
% utgangspunkt i følgende likning:
% 1.0163^x = 2

eqn = log(2)/log(1+vekst_p_a);
antall_aar = double(eqn);

% TEST
disp(antall_aar)

% Svaret er at det burde ta 42.7 år før jordens befolkning er doblet
%  hvis vekstfaktoren hadde holdt seg konstant.


%% Oppgave 6

% Lager en anonym funksjon g(t) som tar årstall 't' som input og forventet
% folketall som output.
g = @(t)B(1)*(1+vekst_p_a).^(t-Y(1));

% TEST
disp(g(1900))
disp(g(2015))


%% Oppgave 7

plot(Y, g(Y)), % Lager plot med g(Y) på y-aksen
hold on,
grid on,
title('Reell befolkingsvekst vs. konstant vekstfaktor');
plot(Y, B),  % Legger til plot med B på y-aksen
hold off;
xlabel('Årstall');
ylabel('Befolkningstall');


%% Oppgave 8

% Estimat på befolkningstallet i år 2100
aar_2100 = g(2100);

% TEST
disp(aar_2100);

% Det forventede befolkingstallet blir da ca. 28.655 milliarder


%% Oppgave 9

syms t  % Definerer t som variabel

% Definerer doblingstid som en anonym funksjon med q (vekstrate) som input
% og antall år (for dobling) som output.
doblingstid = @(q)double(log(2)/log(1+q));

% TEST
dt = doblingstid(0.01);
disp(dt)


%% Oppgave 10

% Doblingstid ved 1% vekstrate
dt = doblingstid(0.01);

% TEST
disp(dt);
% Doblingstiden ved 1% vekstrate er omtrent 70 år.


%% Oppgave 11

% Lager en ny anonym funksjon med årstall som input og
% befolkningstallet basert på 1% vekstrate som output.
h = @(t)B(14)*(1.01).^(t-Y(14));

aar_2100_ny = h(2100); % Regner ut befolkingstallet per 2100 med 1% vekstrate
disp(aar_2100_ny)

% Befolkningen i år 2100 er anslått å være omrent 16.829 milliarder i år 2100
% dersom vi bremser befolkningsveksten til 1% p.å.


%% Oppgave 12

periode = 2015:2150;  % Definerer den nye tidsperioden

% Definerer den nye grafen
plot(periode, g(periode)), hold on
title('1% befolkingsvekst vs. 1.65% befolkningsvekst per år.');
plot(periode, h(periode)), hold off;
xlabel('Årstall');
ylabel('Befolkningstall');
legend('1.6344% vekstrate', '1% vekstrate');


%% Oppgave 13

vekstrater = zeros(25, 1);  % Definerer tom vektor for kolonne 1
doblingstider = zeros(25, 1);  % Definerer tom vektor for kolonne 2

for k = 1:25
    % Definerer første kolonne i vektoren som vekstraten
    vekstrater(k) = k;  % Vekstrate i prosent
    % Definerer andre kolonne i vektoren som doblingtiden (i år)
    doblingstider(k) = doblingstid(k/100);  % Kaller funksjonen "doblingstid"
end

tabell_doblingstider = table(vekstrater, doblingstider); % Definerer en tabell
header={'Veksrate_prosent','Doblingstid_for_vekstraten'};  % Definerer overskrifter
tabell_doblingstider.Properties.VariableNames = header;


%% Oppgave 14

% Lager en ny funksjon mtid(m, q) med output mt (tiden) det tar for en
% befolkning (e.l.) å vokse til "m" ganger så stor:

mtid = @(m, q)double(log(m)/log(1+q));

% TEST
femdobling = mtid(2, 0.01);
disp(femdobling);

% Vi ser at funksjonen fungerer da en dobling av A_0 ved 1% vekst er
% tilnærmet lik 70 (Rule of 70)


