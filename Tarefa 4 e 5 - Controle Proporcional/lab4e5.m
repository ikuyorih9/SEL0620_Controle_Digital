%#ok<*NOPTS>
% clear;
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

% Kp=8;
Kp = 5.8965517241379310344827586206897; % constante proporcional

% QUESTÃO 10
Gmf = feedback(Kp*G, 1);

nyquist = 10; % Proporção entre banda e amostragem.
wb = bandwidth(Gmf); % Banda em [rad/s]
fb = wb/(2*pi); % Banda [Hz]
w0 = nyquist*wb; % Freq. amostragem [rad/s]
f0 = w0/(2*pi); % Freq. amostragem [Hz]
T0 = 1/f0; % Periodo amostragem [s]
T0_max = (2*pi)/(2*wb); % Periodo amostragem [s]
%T0 = 0.1650;

Gz = c2d(G, T0, 'zoh');
Gmfz = feedback(Kp*Gz, 1);


fprintf("wb = %.3f rad/s\n", wb);
fprintf("w0 = %.3f rad/s\n", w0);  
fprintf("fb = %.3f Hz\n", fb);
fprintf("f0 = %.3f Hz\n", f0);  
fprintf("T0 = %.3f s\n", T0);
fprintf("T0_max = %.3f s\n", T0_max);

% QUESTÃO 11
zeroG = zero(G)
fprintf("\nZeros de G: ");
disp(zeroG);
poloG = pole(Gmf);
fprintf("\nPolos de G: ");
disp(poloG);

zeroGz = zero(Gz)
fprintf("\nZeros de Gz: ");
disp(zeroGz);
poloGz = pole(Gmfz);
fprintf("\nPolos de Gz: ");
disp(poloGz);

% QUESTÃO 15
my_wb = bandwidth(Gmf);
my_w0=10*my_wb;
my_f0 = my_w0/(2*pi);
my_T0 = 1/my_f0
fprintf("\nKp = %d - B = %.3f - T0 = %.3f", Kp, my_wb, my_T0);
ess_abs = ess*0.01*R