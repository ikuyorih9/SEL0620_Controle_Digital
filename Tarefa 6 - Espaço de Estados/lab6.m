%clear all %#ok<*CLALL>
close all

R = 1.25;
zeta = 1.011;
wn = 1.045;
G = tf(wn^2, [1 2*zeta*wn wn^2]);
T0 = 0.951;

d = -0.15; % disturbio
td = 15; % tempo de inicio do disturbio
ess = 14.5; % erro de estado estacionáriosimulin

% QUESTÃO 1
disp("QUESTÃO 1:");
[num, den] = tfdata(G,'v');
[Ac, Bc, Cc, Dc] = tf2ss(num,den);

fprintf("A:\n");
disp(Ac);
fprintf("B:\n");
disp(Bc);
fprintf("C:\n");
disp(Cc);
fprintf("D:\n");
disp(Dc);

% QUESTÃO 2
disp("QUESTÃO 2:");
ss_c = ss(Ac,Bc,Cc,Dc);
ss_d = c2d(ss_c,T0);
F = ss_d.A
H = ss_d.B
Cd = ss_d.C
Dd = ss_d.D

