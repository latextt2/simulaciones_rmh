clc
clear all
close all
load('simulation_data')
plot(y05,f05,y10,f10,y15,f15,y20,f20)
grid on
ylabel('Force [N]')
xlabel('Distance [mm]')
title('Fuerza Electroiman radial')