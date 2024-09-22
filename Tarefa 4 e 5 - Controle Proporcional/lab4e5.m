%#ok<*NOPTS>
clear;
%clc;

% Variaveis iniciais.
R = 1.25;
zeta = 1.011;
wn = 1.045;
G = tf(wn^2, [1 2*zeta*wn wn^2]) % Funcao de Transferencia^

[Gnum, Gden] = tfdata(G,'v');

d = -0.15; % disturbio
td = 15; % tempo de inicio do disturbio
ess = 14.5; % erro de estado estacionário

Kp = 1; % constante proporcional

wb = bandwidth(G);
w0 = 10*wb;
fb = wb/(2*pi);
f0 = 10*fb;
T0 = 1/f0; 

fprintf("wb = %.3f rad/s\n", wb);
fprintf("w0 = %.3f rad/s\n", w0);  
fprintf("fb = %.3f Hz\n", fb);
fprintf("f0 = %.3f Hz\n", f0);  
fprintf("T0 = %.3f s\n", T0); 

% simulink;
% figure
% plot (out.y_c.Time, out.y_c.Data, 'b')
% hold on
% stairs (out.y_d.Time, out.y_d.Data, 'r')