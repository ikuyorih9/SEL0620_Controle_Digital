%#ok<*NOPTS>
clc;

% Variaveis iniciais.
R = 1.25;
zeta = 1.011;
wn = 1.045;
G = tf(wn^2, [1 2*zeta*wn wn^2]) % Funcao de Transferencia^

% Questao 1:
polos = pole(G); % Polos da função de transferência.
fprintf("Polo 1 p1 = %.3f\n", polos(1));
fprintf("Polo 2 p2 = %.3f\n", polos(2));

% Questão 2:
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

% Questão 3:
Gz = c2d(G,T0, 'zoh')

% Questão 4:
polo_discreto = pole(Gz); % Polos da função de transferência discreta.
zero_discreto = zero(Gz); % Zeros da função de transferência discreta.

fprintf("Zero z = %.3f\n", zero_discreto);
fprintf("Polo 1 p1 = %.3f\n", polo_discreto(1));
fprintf("Polo 2 p2 = %.3f\n", polo_discreto(2));

% Questão 5:
figure
step(R*G)
hold on
step(R*Gz)

title('Resposta do sistema contínuo e discreto')
xlabel('Tempo (t)')
ylabel('Amplitude y(t)')
legend('G(s)','G(z)')
axis([0 15 0 1.4]);


% Questão 7
figure
plot(out.y_c.Time, out.y_c.Data, 'b')
hold on
stairs(out.y_d.Time, out.y_d.Data, 'r')

title('Resposta do sistema contínuo e discreto pelo Simulink')
xlabel('Tempo (t)')
ylabel('Amplitude y(t)')
legend('G(s)','G(z)')