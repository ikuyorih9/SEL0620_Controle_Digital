close all

R = 1.25;
zeta = 1.011;
wn = 1.045;
G = tf(wn^2, [1 2*zeta*wn wn^2]);
[Gnum, Gden] = tfdata(G,'v');
Kp = 8;
%Gmf = feedback(Kp*G, 1);

T01 = 0.430;
T05 = 0.225;
T08 = 0.201;

tp1 = 3.051;
tr1 = 1.471;
ts1 = 4.019;

Gz = c2d(G, T08, 'zoh');

d = -0.15; % disturbio
td = 15; % tempo de inicio do disturbio
ess = 14.5; % erro de estado estacionário simulink

if ~exist('Gpid', 'var') 
    fprintf("RLTOOL não foi utilizado ainda...\n");
    return; 
end;

% QUESTÃO 3:
fprintf("\n-> QUESTÃO 3:\n");
[Gznum, Gzden] = tfdata(minreal(Gpid), 'v');
fprintf("Gpid(z) = (%.3f + %.3f z^-1 + %.3f z^-2)/(%.3f + %.3fz^-1)\n", Gznum(1), Gznum(2), Gznum(3), Gzden(1), Gzden(2));

% QUESTÃO 4:
fprintf("\n-> QUESTÃO 4:\n");
Gmfz = feedback(Gpid*Gz, 1);
[Gmnum,Gmden] = tfdata(Gmfz, 'v');
fprintf("Gmf(z) = (%.3f + %.3f z^-1 + %.3f z^-2 + %.3f z^-3 + + %.3f z^-4)/(%.3f + %.3fz^-1 + %.3f z^-2 + %.3f z^-3 + %.3f z^-4)\n", Gmnum(1), Gmnum(2), Gmnum(3), Gmnum(4), Gmnum(5), Gmden(1), Gmden(2), Gmden(3), Gmden(4), Gmden(5));


%QUESTÃO 5:
fprintf("\n-> QUESTÃO 5:\n");
z = zero(Gmfz);
fprintf("Zeros: ");
disp(z.');
p = pole(Gmfz);
fprintf("Polos: ");
disp(p.');

%QUESTÃO 6 E 7: SIMULINK
pid(Gpid)
out = sim('tarefa7e8', 'SimulationMode', 'normal');

close all;

% QUESTÃO 8 (se a figura não sair na pasta certa, verifique com 'pwd'):
% Curva de saída;
figure
stairs (out.saida_pid.Time, out.saida_pid.Data, 'b')
hold on;
stairs (out.saida_p.Time, out.saida_p.Data, 'r')
title('Resposta do sistema de malha fechada')
xlabel('Tempo (t)')
ylabel('Amplitude y(t)')
legend({'Controlador PID', 'Controlador P'}, 'Location', 'southeast');
exportgraphics(gca, 'Figuras/fig-saida.png');

% Curva de erro;
figure
stairs (out.erro_pid.Time, out.erro_pid.Data, 'b')
hold on;
stairs (out.erro_p.Time, out.erro_p.Data, 'r')
title('Sinal de erro do sistema de malha fechada')
xlabel('Tempo (t)')
ylabel('Amplitude y(t)')
legend('Controlador PID','Controlador P')
exportgraphics(gca, 'Figuras/fig-erro.png');


% Curva da entrada da planta;
figure
stairs (out.planta_pid.Time, out.planta_pid.Data, 'b')
hold on;
stairs (out.planta_p.Time, out.planta_p.Data, 'r')
title('Entrada da planta do sistema de malha fechada')
xlabel('Tempo (t)')
ylabel('Amplitude y(t)')
legend('Controlador PID','Controlador P')
exportgraphics(gca, 'Figuras/fig-planta.png');

% QUESTÃO 10
Gzp = feedback(Gz, 1);
Gzpid = feedback(Gpid*Gz, 1);

figure
step(R*Gzpid, 'b');
hold on;
step(R*Gzp, 'r');
title('Saida do sistema de malha fechada')
xlabel('Tempo (t)')
ylabel('Amplitude y(t)')
legend({'Controlador PID', 'Controlador P'}, 'Location', 'southeast');
axis([0 30 0 1.4]);

% Exibe o tempo de pico
%tempo_de_pico = stepinfo(feedback(G, 1)).PeakTime;
%disp(['Tempo de Pico (K=1): ', num2str(tempo_de_pico), ' segundos']);

% Exibe o tempo de subida
%tempo_de_subida = stepinfo(feedback(G, 1)).RiseTime;
%disp(['Tempo de Subida (K=1): ', num2str(tempo_de_subida), ' segundos']);

% Exibe o tempo de acomodação
%tempo_de_acomodacao = stepinfo(feedback(G, 1)).SettlingTime;
%disp(['Tempo de Acomdaçãp (K=1): ', num2str(tempo_de_acomodacao), ' segundos']);