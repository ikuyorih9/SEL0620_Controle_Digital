close all;


% Questão 4:
figure
subplot(2,1,1)
plot (out.x.Time, out.x.Data(:,1), 'b')
hold on
stairs (out.xd.Time, out.xd.Data(:,1), 'r')
title('Estado x1 contínuo e discreto.')
legend('Contínuo','Discreto')
xlabel('Tempo (t)')
ylabel('Amplitude x1(t)')
axis([0 30 -0.1 0.5])

exportgraphics(gca, 'Figuras/fig - x1.png');

subplot(2,1,2)
plot (out.x.Time, out.x.Data(:,2), 'b')
hold on
stairs (out.xd.Time, out.xd.Data(:,2), 'r')
title('Estado x2 contínuo e discreto.')
legend('Contínuo','Discreto')
xlabel('Tempo (t)')
ylabel('Amplitude x2(t)')
axis([0 30 0 1.2]);

exportgraphics(gca, 'Figuras/fig-x2.png');

% QUESTÃO 5
figure
plot (out.y.Time, out.y.Data, 'b')
hold on
stairs (out.yd.Time, out.yd.Data, 'r')
title('Saída contínua e discreta.')
legend('Contínuo','Discreto')
xlabel('Tempo (t)')
ylabel('Amplitude y(t)')
axis([0 30 0 1.4]);

exportgraphics(gca, 'Figuras/fig-y.png');
