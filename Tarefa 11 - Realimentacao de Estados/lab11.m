% Variaveis iniciais.
R = 1.25;
zeta = 1.011;
wn = 1.045;

d = -0.15; % disturbio
td = 15; % tempo de inicio do disturbio
ess = 14.5; % erro de estado estacionário
T0 = 0.377;

% Espaço de estados.
F = [0.001 -0.382; 0.35 0.739];
H = [0.35;0.239];
Cd = [0 1.092];
Dd = 0;

polos_dominantes = [0.834+0.172i, 0.834-0.172i];
K = place(F,H,polos_dominantes);

out = sim('tarefa11', 'SimulationMode', 'normal');

% Questão 4:
figure
stairs (out.u.Time, out.u.Data, 'b')
title('Entrada u(t) do sistema.')
xlabel('Tempo (t)')
ylabel('Amplitude')

exportgraphics(gca, 'Figuras/fig - u.png');

figure
stairs (out.xd.Time, out.xd.Data(:,1), 'b')
hold on;
stairs (out.xd.Time, out.xd.Data(:,2), 'r')
title('Estados x1(t) e x2 do sistema.')
legend('X1','X2')
xlabel('Tempo (t)')
ylabel('Amplitude')
%axis([0 30 -0.1 0.5])

exportgraphics(gca, 'Figuras/fig - x.png');

figure
stairs (out.yd.Time, out.yd.Data, 'r')
title('Saída y(t) do sistema.')
xlabel('Tempo (t)')
ylabel('Amplitude')
%axis([0 30 0 1.4]);

exportgraphics(gca, 'Figuras/fig - y.png');
