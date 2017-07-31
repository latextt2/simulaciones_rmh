clc
clear all
%%
d_i = 4.4;
y_i = 0.15;
y_f = 0.85;
y_d = 0.025;
openfemm();

y = y_i:y_d:y_f;
capacitance = [];

for y_loop = y;
capacitance = [capacitance cds_calc(y_loop,d_i,0.25)];
end

closefemm();
%%
plot(y,capacitance);
ylabel('Capacitancia [pF]')
xlabel('Desplazamiento [mm]')
grid on
save('simulation_data','y','capacitance');