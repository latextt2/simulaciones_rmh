%%
clc
clear all
%% simulation parameters
r_max = 7.5;
delta_r = 0.5;
%%
[capacitance_1 r]= simulate_geometry_at(r_max,delta_r,1);
[capacitance_2 r]= simulate_geometry_at(r_max,delta_r,2);
%%
delta_c = capacitance_1 - capacitance_2; 
delta_c_norm = delta_c./capacitance_1;
%%
subplot(3,1,1)
plot(r,capacitance_1,r,capacitance_2)
subplot(3,1,2)
plot(r,delta_c)
subplot(3,1,3)
plot(r,delta_c_norm)