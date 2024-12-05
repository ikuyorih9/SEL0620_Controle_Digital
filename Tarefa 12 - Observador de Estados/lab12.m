close all

% Variaveis iniciais.
R = 1.25;
zeta = 1.011;
wn = 1.045;

d = -0.15; % disturbio
td = 15; % tempo de inicio do disturbio
ess = 14.5; % erro de estado estacionário
T0 = 0.377;

% Estados iniciais
X0_SIS = [-0.15 0.15];
X0_OBS = [0 0];

% Espaço de estados.
F = [0.001 -0.382; 0.35 0.739];
H = [0.35;0.239];
Cd = [0 1.092];
Dd = 0;

K = place(F,H,[0.834+0.172i, 0.834-0.172i]);
L_T = acker(F',Cd',[0, 0])
L = L_T'

out = sim('tarefa12', 'SimulationMode', 'normal');

figure
stairs (out.xc.Time, out.xc.Data(:,1), 'b')
hold on;
stairs (out.xo.Time, out.xo.Data(:,1), 'r')
title('Estados x1(t) do sistema e do observador.')
legend('Controlador','Observador')
xlabel('Tempo (t)')
ylabel('Amplitude')
axis([0 30 -1 1])

exportgraphics(gca, 'Figuras/Fig - x1.png');

figure
stairs (out.xc.Time, out.xc.Data(:,2), 'b')
hold on;
stairs (out.xo.Time, out.xo.Data(:,2), 'r')
title('Estados x2(t) do sistema e do observador.')
legend('Controlador','Observador')
xlabel('Tempo (t)')
ylabel('Amplitude')
axis([0 30 0 9])

exportgraphics(gca, 'Figuras/Fig - x2.png');