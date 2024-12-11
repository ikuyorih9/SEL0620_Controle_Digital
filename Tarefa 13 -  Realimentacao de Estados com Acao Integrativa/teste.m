close all
T = 0.5

A = [0 1 0; 0 0 1; -0.1 -2 -3]
B = [0; 0; 1]
C = [1 0 0]
D = 0


j1 = [-0.5+2i -0.5-2i -2];
j2 = [-0.5+2i -0.5-2i -2 -8];

aa = [A zeros(3,1); -C 1];
bb = [B; 0];

k1 = acker(A,B,j1)
k2 = acker(aa, bb, j2)

[F H Cd Dd] = c2dm(A,B,C,D,T)

F2 = [F zeros(3,1); -Cd 1]
H2 = [H;0]

jd1 = exp(T*j1)
jd2 = exp(T*j2)

kd1 = acker(F, H, jd1)
[kd2 ki] = place(F2, H2, jd2)

out = sim('testee', 'SimulationMode', 'normal');

figure
stairs (out.y1.Time, out.y1.Data, 'b')
title('Saída y(t).')
legend('Sem ação integrativa','Com ação integrativa', 'Location', 'southwest')
xlabel('Tempo (t)')
ylabel('Amplitude')
%axis([0 30 0 10]);

figure
stairs (out.y2.Time, out.y2.Data, 'r')
title('Saída y(t).')
legend('Sem ação integrativa','Com ação integrativa', 'Location', 'southwest')
xlabel('Tempo (t)')
ylabel('Amplitude')

% Pds = [-0.5+2i -0.5-2i -2]
% Pd = exp(T*Pds)

% K1 = acker(F, H, Pd)

% Pd2 = [Pd exp(T*(-8))]

% F2 = [F zeros(3,1); -C 1]
% H2 = [H; 0]

% [K2 ki] = place(F2, H2, Pd2)