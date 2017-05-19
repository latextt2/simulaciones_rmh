clc;
clear all;
l_g_min = 0.3e-3;%%gap
l_g_max = 0.7e-3;
l_g_nom = 0.5e-3;

B_sat = 1.2;
NI_max = 550;
I_max = 2;
N = NI_max/I_max
I_nom = 2;
mu_0 = 4*pi*1e-7;

A = (12e-3)*(24e-3);
NI_sat = (B_sat * 2 * l_g_min)/mu_0;

if NI_max > NI_sat
    error('NI_max > NI_sat, reduce max NI_max to avoid saturation')
end

Fnom = (A*mu_0*(N*I_nom)^2)/((l_g_nom^2)*4)
L = ((N^2) * A * mu_0)/(2*l_g_nom)