clc;
clear all;
close all;
core = struct();

core.r1 = 18e-3;
core.r2 = 28e-3;
core.r3 = 33e-3;
core.h1 = 20e-3;
core.h2 = 12e-4;
NI = 324;

samples = 1000;
y_o = 0.5e-3;
y_f = 2.0e-3;
y_calc = linspace(y_o,y_f,samples);
[r_3d, flux_3d, force_3d] = get_eia_reluctance_3d(y_calc, core, NI);
[r_ideal, flux_ideal, force_ideal] = get_eia_reluctance_ideal(y_calc, core, NI);
[r_aprox, flux_aprox, force_aprox] = get_eia_reluctance_aprox(y_calc, core, NI);

fig = figure;
load('simulation_data')
plot(y_calc(2:end), force_ideal, y_calc(2:end), force_3d, y, f);
ylabel('Fuerza [N]');
xlabel('Distancia [m]');
legend('Ideal','3D','FEM','Location','southwest');
grid on
saveas(fig,'simulacion_vs_modelo_axial.png');
%%
% subplot(2,1,2)
% plot(y_calc, r_3d, 'r', y_calc, r_ideal, 'b', y_calc, r_aprox, 'g');
% ylabel('Reluctance [A/Wb]');
% xlabel('Distance [m]');
% title('EIA Reluctance');
% legend('3D','Ideal','Simple aproximation','Location','southwest');
% grid on
%