%%
clear all
load('datos_reales.mat')
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
NI = 1;
%% constantes
u_0 = 4*pi*1e-7;
y = linspace(y_o,y_f,samples);
%% calculo de reluctancia
rg11 = y/((r1/2)*u_0);
rg12 = r_basic(r1,y,h1);
rg1_planar = r_parallel(rg11,rg12);
rg1_planar_ideal = y/(r1*u_0);
sigma_rg1 = rg1_planar./rg1_planar_ideal;
rg1 = (sigma_rg1).*r_cilindrical(0,r1,y);

rg21 = 2*r_basic(r3-r2,y/2,h1);
rg22 = r_basic(r3-r2,y,h2);
rg2_planar = r_parallel(rg21,rg22);
rg2_planar_ideal = y/((r3-r2)*u_0);
sigma_rg2 = rg2_planar./rg2_planar_ideal;
rg2 = (sigma_rg2).*r_cilindrical(r2,r3,y);

reluctance = rg1 + rg2;

flux = NI./reluctance;
energy = (1/2)*((NI)^2)./reluctance;
dw_dy = -diff(energy)./diff(y);
%%
subplot(2,1,1)
plot(y(2:end),dw_dy,'r',y_real/1000,f_real,'g')
subplot(2,1,2)
reluctance_ideal = r_cilindrical(0,r1,y)+r_cilindrical(r2,r3,y);
reluctance_aprox = r_cilindrical(0,r1+y,y)+r_cilindrical(r2-y,r3+y,y);
plot(y,reluctance,'r',y,reluctance_ideal,'b',y,reluctance_aprox,'g');
%%
selected_y = 2e-3; 
[M,I] = min((y-2e-3).^2);
dw_dy(I)
reluctance(I)
