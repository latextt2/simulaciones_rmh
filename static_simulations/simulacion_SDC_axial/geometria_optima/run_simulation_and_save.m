clc
clear all
%%
R = 92;
r = 10;
d_i = 2:0.25:8; %inner plate diameter
y_0 = 0.25; % minimum distance
y_1 = 0.75; % maximum distance
curvature = r/R; % R/r diameter
c_0 = [];
c_1 = [];
%%
[ delta_c1 ] = sensitivity_at_curvature(y_0,y_1,d_i, curvature);
%%
plot(d_i, delta_c1);
save('simulation_results', 'delta_c1', 'd_i', 'curvature')