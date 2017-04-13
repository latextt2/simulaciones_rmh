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
NI = 400;
%% constantes
u_0 = 4*pi*1e-7;
y = linspace(y_o,y_f,samples);
%% calculo de reluctancia
r_gap = (y./(((r1+1.5*y).^2)*pi*u_0)) + (y./((((r3+1.5*y).^2)-((r2-1.5*y).^2))*pi*u_0));
r_leak = (log(r2/r1)./(y*2*pi*u_0));
reluctance = r_gap.*r_leak ./(r_gap + r_leak);
flux = NI./reluctance;
energy = (1/2)*((NI)^2)./reluctance;
dw_dy = diff(energy)./diff(y);
%%
plot(y(2:end),dw_dy)
%plot(y,flux);
%y = sin(2*pi*t);
%
%plot(t(2:end),dy_dt);