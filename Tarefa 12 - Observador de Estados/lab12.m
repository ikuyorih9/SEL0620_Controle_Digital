% Variaveis iniciais.
R = 1.25;
zeta = 1.011;
wn = 1.045;

d = -0.15; % disturbio
td = 15; % tempo de inicio do disturbio
ess = 14.5; % erro de estado estacionário
T0 = 0.377;

X0 = [-0.15 015];

% Espaço de estados.
F = [0.001 -0.382; 0.35 0.739];
H = [0.35;0.239];
Cd = [0 1.092];
Dd = 0;

polos_dominantes = [0.834+0.172i, 0.834-0.172i];
K = place(F,H,polos_dominantes);