%% Run simulations "run_simulation_save_data" before plotting
clc
clear
close all
load('simulation_results')
max_cap = max(capacitance);
relative_capacitance = capacitance/max_cap;
plot(r_R,relative_capacitance)
xlabel('$\frac{r}{R}$','Interpreter','LaTex','FontSize',18)
ylabel('$\frac{C}{C_{max}}$','Interpreter','LaTex','FontSize',18)
grid on