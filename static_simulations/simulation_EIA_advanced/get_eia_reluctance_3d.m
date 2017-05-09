function [ reluctance, flux, dw_dy] = get_eia_reluctance_3d(y, core, NI)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%% configuracion
r1 = core.r1;
r2 = core.r2;
r3 = core.r3;
h1 = core.h1;
h2 = core.h2;
%% constantes
u_0 = 4*pi*1e-7;
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
end
