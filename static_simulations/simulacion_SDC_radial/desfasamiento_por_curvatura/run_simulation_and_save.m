clc
clear all
%%
d_i = 2:0.25:7; %inner plate diameter
y_0 = 0.25; % minimum distance
y_1 = 0.75; % maximum distance
curvature = [0 0.125 0.25]; % R/r diameter
c_0 = [];
c_1 = [];
%%
[ delta_c1 ] = sensitivity_at_curvature(y_0,y_1,d_i, curvature(1));
[ delta_c2 ] = sensitivity_at_curvature(y_0,y_1,d_i, curvature(2));
[ delta_c3 ] = sensitivity_at_curvature(y_0,y_1,d_i, curvature(3));
%%
plot(d_i, delta_c1, d_i, delta_c2, d_i, delta_c3);
save('simulation_results','delta_c1', 'delta_c2', 'delta_c3', 'd_i', 'curvature')