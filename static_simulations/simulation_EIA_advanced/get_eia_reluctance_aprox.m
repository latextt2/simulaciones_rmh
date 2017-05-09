function [ reluctance, flux, dw_dy] = get_eia_reluctance_aprox(y, core, NI)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%% configuracion
r1 = core.r1;
r2 = core.r2;
r3 = core.r3;
%% constantes
u_0 = 4*pi*1e-7;
%% calculo de reluctancia
rg1 = r_cilindrical(0,r1+y,y);

rg2 = r_cilindrical(r2-y,r3+y,y);

reluctance = rg1 + rg2;

flux = NI./reluctance;
energy = (1/2)*((NI)^2)./reluctance;
dw_dy = -diff(energy)./diff(y);
end
