clear all %#ok<*CLALL>
close all

R = 1.25;
zeta = 1.011;
wn = 1.045;
g = tf(wn^2, [1 2*zeta*wn wn^2]);