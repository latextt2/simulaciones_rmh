clc
clear all
%%
d_i = 2:0.25:7;
c_0 = [];
c_1 = [];

openfemm();

for d = d_i;
c_0 = [c_0 cds_calc(0.25,d,0.25)];
c_1 = [c_1 cds_calc(0.75,d,0.25)];
end

closefemm();
%%
save('simulation_data','c_1','c_0','d_i')
%%
load('simulation_data')
delta_c = c_1 - c_0;
d_i_optimum = d_i(find(max(-delta_c)==-delta_c))
%%
plot(d_i,-delta_c)
ylabel('\DeltaC [F]')
xlabel('d_i [mm]')
grid on