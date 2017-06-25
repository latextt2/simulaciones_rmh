clc
clear all
%% Constantes universales
u_0 = 4*pi*1e-7;
%% Datos del collarin
u_cr = 1600;
l_c = 80e-3;
%% Datos del nucleo electroiman
u_er = 950;
l_e = 160e-3;
%% Bsat
B_sat = 1.4; %%Campo de saturacion en Teslas
%% Datos de operacion
y_min = 0.25e-3; %% gap minimo
y_max = 0.75e-3; %% gap maximo
F_max = 50; %% fuerza  maxima

%% Calculo de Area con reluctancia
NI_max = (B_sat * ((l_e/u_er) + (l_c/u_cr) + 2*y_min))/u_0
A_min = (F_max * ((l_e/u_er) + (l_c/u_cr) + 2*y_max)^2 )/(u_0 * NI_max^2) * 1e6

%% Calculo de Area simple
NI_max = (B_sat * (2*y_min))/u_0
A_min = (F_max * (2*y_max)^2 )/(u_0 * (NI_max^2)) * 1e6

%% Datos de las bobinas
I_max = 2;
N = NI_max/I_max
%% Calculo de area de conductores
A_c = 0.823;%%Area mm^2
K = 0.9;%%Factor de empaquetamiento
A_b = (A_c * N)/K%%Area el embobinado