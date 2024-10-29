% GRUPO 7:
% Dead-beat de ordem v;
% Dead-beat de ordem v+1 para u(0)DB(v+1) = 0.8u(0)DB(v)

clc;
close all;
% VALORES PADRÕES.
R = 1.25;
zeta = 1.011;
wn = 1.045;
T0 = 0.201;

d = -0.15; % disturbio
td = 15; % tempo de inicio do disturbio
ess = 14.5; % erro de estado estacionário simulink

% PLANTA
G = tf(wn^2, [1 2*zeta*wn wn^2]);
H0GP = c2d(G, T0, 'zoh')
[Gnum, Gden] = tfdata(G,'v');
[H0GPnum, H0GPden] = tfdata(H0GP,'v');
disp(H0GPnum)
disp(H0GPden)
% QUESTÃO 1:

% DEAD BEAT DE ORDEM 2:

q0 = 1/sum(H0GPnum)
q1 = H0GPden(2)*q0
q2 = H0GPden(3)*q0

p1 = H0GPnum(2)*q0;
p2 = H0GPnum(3)*q0;

Gdb = tf([q0 q1 q2], [1 -p1 -p2], T0)

% DEAD BEAT DE ORDEM 3

Q0 = 0.8*q0;
Q1 = Q0*(H0GPden(2)-1) + 1/sum(H0GPnum);
Q2 = Q0*(H0GPden(3)-H0GPden(2)) + H0GPden(2)/sum(H0GPnum);
Q3 = H0GPden(3)*(-Q0 + 1/sum(H0GPnum));

P1 = Q0*H0GPnum(2);
P2 = Q0*(H0GPnum(3)-H0GPnum(2) + H0GPnum(2)/sum(H0GPnum));
P3 = H0GPnum(3)*(-Q0 + 1/sum(H0GPnum));

Gdb3 = tf([Q0 Q1 Q2 Q3], [1 -P1 -P2 -P3], T0)

% QUESTÃO 2
%Gmfz3 = feedback(Gdb3*H0GP,1)
%polos = pole(Gmfz)

% QUESTÃO 3: simulink

% QUESTÃO 4:

figure
stairs (out.erro2.Time, out.erro2.Data, 'b')
hold on
stairs (out.erro3.Time, out.erro3.Data, 'r')
title('Erro do sistema Dead Beat de malha fechada')
xlabel('Tempo (t)')
ylabel('Amplitude y(t)')
legend({'GDB(2)', 'GDB(3)'}, 'Location', 'southeast');
%axis([0 30 1 2]);
exportgraphics(gca, 'Figuras/fig-erro2.png');

figure
stairs (out.planta2.Time, out.planta2.Data, 'b')
hold on
stairs (out.planta3.Time, out.planta3.Data, 'r')
title('Entrada da planta do sistema Dead Beat de malha fechada')
xlabel('Tempo (t)')
ylabel('Amplitude y(t)')
legend({'GDB(2)', 'GDB(3)'}, 'Location', 'southeast');
%axis([0 30 1 2]);
exportgraphics(gca, 'Figuras/fig-erro2.png');

figure
stairs (out.saida2.Time, out.saida2.Data, 'b')
hold on
stairs (out.saida3.Time, out.saida3.Data, 'r')
title('Resposta do sistema Dead Beat de malha fechada')
xlabel('Tempo (t)')
ylabel('Amplitude y(t)')
legend({'GDB(2)', 'GDB(3)'}, 'Location', 'southeast');
%axis([0 30 1 2]);
exportgraphics(gca, 'Figuras/fig-erro2.png');
