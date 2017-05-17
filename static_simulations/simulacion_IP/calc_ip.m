clc
clear all;
%% Datos de iman parmanente
B_r = 1.4;
H_c = 796e3;
mu_m = B_r/H_c;

l_m = 5e-3;
w_m = 10e-3;

%% Gap
g = 0.75e-3;

%% Contantes
mu_0 = 4*pi*1e-7;

%% Medidas del nucleo
L = 5e-3;
w_g = 10e-3;

%% Areas
A_m = L * w_m;
A_g = L * w_g;

Fg = (((B_r^2)*A_m) / ( 2 * mu_0 * (1 + (mu_m/mu_0)*(A_m/A_g)*(g/l_m))^2)) ...
 * ((A_m +2*A_g)/(2*A_g))