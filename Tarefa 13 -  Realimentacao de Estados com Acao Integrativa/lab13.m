clear all;
close all;
% Variaveis iniciais.
R = 1.25;
zeta = 1.011;
wn = 1.045;

d = -0.15; % disturbio
td = 15; % tempo de inicio do disturbio
ess = 14.5; % erro de estado estacionário
T0 = 0.377;

% Espaço de estados.
F = [0.001 -0.382; 0.35 0.739]
H = [0.35; 0.239]
Cd = [0 1.092];
Dd = 0;

polos_dominantes = [0.834+0.172i, 0.834-0.172i];
K = place(F,H,polos_dominantes)

F2 = [F zeros(2,1); -Cd 1]
H2 = [H; 0]
C2 = [Cd 0]

Pd2 = [polos_dominantes 0.734];
K2 = place(F2, H2 ,Pd2)

out = sim('tarefa13', 'SimulationMode', 'normal');

% Questão 4:
figure
stairs (out.u2.Time, out.u2.Data, 'r')
title('Entrada u[k] do sistema.')
xlabel('Tempo (t)')
ylabel('Amplitude')
exportgraphics(gca, 'Figuras/fig - u.png');

figure
stairs (out.y2.Time, out.y2.Data, 'r')
title('Saída y[k] do sistema.')
xlabel('Tempo (t)')
ylabel('Amplitude')
exportgraphics(gca, 'Figuras/fig - y.png');

figure
stairs (out.x2.Time, out.x2.Data(:,1), 'b')
hold on;
stairs (out.x2.Time, out.x2.Data(:,2), 'r')
hold on;
stairs (out.q.Time, out.q.Data, 'black')
title('Estados x1[k], x2[k] e q[k] do sistema.')
legend('x1[k]','x2[k]', 'q[k]', 'Location', 'southeast')
xlabel('Tempo (t)')
ylabel('Amplitude')
exportgraphics(gca, 'Figuras/fig - xq.png');
