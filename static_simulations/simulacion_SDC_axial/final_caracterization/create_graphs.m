%% Run simulations "run_simulation_save_data" before plotting
clc
clear
close all
load('simulation_results')
plot(y,capacitance);
ylabel('C [F]')
xlabel('d [mm]')
grid on
save('simulation_results','y','capacitance');