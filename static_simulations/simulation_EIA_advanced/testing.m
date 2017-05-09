%%
clear all
%% simulacion
samples = 10000;
y_o = 0.5e-3;
y_f = 3e-3;
%% configuracion
r1 = 18e-3;
r2 = 28e-3;
r3 = 33e-3;
h1 = 20e-3;
h2 = 12e-4;
NI = 400;
%% constantes
u_0 = 4*pi*1e-7;
y = 2e-3
%% calculo de reluctancia
rg11 = y/((r1/2)*u_0);
rg12 = r_basic(r1,y,h1);
rg1_planar = r_parallel(rg11,rg12);
rg1_planar_ideal = y/(r1*u_0);
sigma_p1 = rg1_planar./rg1_planar_ideal;
rg1 = sigma_p1*r_cilidrical(0,r1,y);