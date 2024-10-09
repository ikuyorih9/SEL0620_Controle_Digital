close all;
myaxis = [0 30 0 2];
x_axis = [0 30];

figure
plot (out.y_c.Time, out.y_c.Data, 'b')
hold on
stairs (out.y_d.Time, out.y_d.Data, 'r')
title('Resposta do sistema contínuo e discreto')
xlabel('Tempo (t)')
ylabel('Amplitude y(t)')
legend('G(s)','G(z)')
axis(myaxis);

figure
plot (out.e_c.Time, out.e_c.Data, 'b')
hold on
stairs (out.e_d.Time, out.e_d.Data, 'r')
title('Erro do sistema contínuo e discreto')
xlabel('Tempo (t)')
ylabel('Amplitude y(t)')
legend('G(s)','G(z)')
xlim(x_axis);


figure
plot (out.u_c.Time, out.u_c.Data, 'b')
hold on
stairs (out.u_d.Time, out.u_d.Data, 'r')
title('Entrada da planta do sistema contínuo e discreto')
xlabel('Tempo (t)')
ylabel('Amplitude y(t)')
legend('G(s)','G(z)')
xlim(x_axis);
ylim([-13 13]);


% QUESTÃO 6:
figure
rlocus(G)
hold on
% Adiciona um círculo unitário tracejado
theta = linspace(0, 2*pi, 100);
x = cos(theta);
y = sin(theta);
plot(x, y, '--k') % '--k' para linha tracejada preta
axis([-1.4 1 -1 1]);

title('Lugar das raízes de G')
xlabel('Eixo real')
ylabel('Eixo imaginário')

% QUESTÃO 8
figure
bode(G)
margin(G)

% QUESTÃO 12
figure
step(R*Gmf)
hold on
step(R*Gmfz)
title('Resposta do sistema de malha fechada')
legend('Gmf(s)','Gmfz(z)')
xlabel('Tempo (t)')
ylabel('Amplitude y(t)')
xlim(x_axis);
