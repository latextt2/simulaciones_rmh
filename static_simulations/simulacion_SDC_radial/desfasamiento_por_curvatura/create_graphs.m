%% Run simulations "run_simulation_save_data" before plotting
clc
clear
close all
load('simulation_results')
plot(d_i, -delta_c1, d_i, -delta_c2, d_i, -delta_c3);
xlabel('$d_i$ [mm]','Interpreter','LaTex','FontSize',18)
ylabel('$\Delta C$ [F]','Interpreter','LaTex','FontSize',18)
grid on
legend('\rho = 0','\rho = 0.125','\rho = 0.25','Location','northwest');