clc;
clear all;

load('simulation_data','y','f');
fig = plot(y,f);
grid on
ylabel('Force [N]');
xlabel('Distance [m]');
title('Axial Electromagnet');

saveas(fig,'algo.png');