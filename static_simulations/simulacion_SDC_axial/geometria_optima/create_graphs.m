%% Run simulations "run_simulation_save_data" before plotting
clc
clear
close all
load('simulation_results')
plot(d_i, -delta_c1);
xlabel('$d_i$ [mm]','Interpreter','LaTex','FontSize',18)
ylabel('$\Delta C$ [F]','Interpreter','LaTex','FontSize',18)
grid on