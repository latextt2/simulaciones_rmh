function [ reluctance, flux, dw_dy] = get_eir_reluctance_ideal(y, core, NI)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%% configuracion
w = core.w;
t = core.t;
%% constantes
u_0 = 4*pi*1e-7;
%% calculo de reluctancia
rg1 = y/(u_0 * w * t);
reluctance = 2*rg1;

flux = NI./reluctance;
energy = (1/2)*((NI)^2)./reluctance;
dw_dy = -diff(energy)./diff(y);
end