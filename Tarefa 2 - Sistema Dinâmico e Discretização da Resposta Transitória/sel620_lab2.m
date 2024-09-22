clear all %#ok<*CLALL>
close all

% TODO: Alterar os valores para o seu caso
R = 1.25;
zeta = 1.011 %#ok<*NOPTS>
wn = 1.045
g = tf(wn^2, [1 2*zeta*wn wn^2]); % Funcao de Transferencia

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Grafico de Bode
figure
bode(g)  
grid
title('Gráfico de Bode','interpreter','latex','FontSize',12)
xlabel('Frequência','interpreter','latex','FontSize',12)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Largura de Banda
% TODO: Colocar abaixo o valor de largura de banda para o seu caso. Usar o
% comando bandwidth ou encontrar pelo grafico de bode
wb = 0.6609   % Valor da largura de banda em rad/s
fb = wb/(2*pi)   % Valor da largura de banda em em Hz
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resposta degrau continua
Fc = 10000;    % Ferquencia de amostragem em Hz  
T = 15; % Tempo final da simula??o
t = 0:1/Fc:T; 
y = R*step(g,t);  % Resposta degrau unitario
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Para 1*fb %%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotar a resposta degrau unitario contínua
figure
plot(t,y)
title('Resposta degrau do sistema')
xlabel('Tempo (t)')
ylabel('y(t)')
grid
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resposta degrau discreta
hold on
F0 = fb;    % Frequencia de amostragem in Hz  
T0 = 1/F0;    % Periodo de amostragem em segundos
t2 = 0:T0:T; % Time vector 
y2 = R*step(g,t2);  % Step response
stairs(t2,y2,'r')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Analise de Fourier
w0=F0*2*pi % frequencia de amostragem do sinal discreto em rad/s
plot_fft_discreto(t,y,w0,wb)  % t,y sao o vetor de tempo e sa?da da resposta degrau continua

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Para 2*fb %%%%%%%%%%%%%%%


%%%%% TODO: Copiar e modificar codigo



%% Para 5*fb %%%%%%%%%%%%%%%

%%%%% TODO: Copiar e modificar codigo

%% Para 10*fb %%%%%%%%%%%%%%%

%%%%%% TODO: Copiar e modificar codigo


%% Para 35*fb %%%%%%%%%%%%%%%

%%%%%%% TODO: Copiar e modificar codigo