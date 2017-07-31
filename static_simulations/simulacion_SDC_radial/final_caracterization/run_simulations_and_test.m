clc
clear all
%%
R = 92;%objective radius
r = 10;%sensor outer radius
d_i = 5; %inner plate diameter
y_0 = 0.1; % minimum distance
y_1 = 1.0; % maximum distance
y_d = 0.025 % distance resolution
curvature = r/R; % R/r diameter
%%
openfemm();
y = y_0:y_d:y_1;
capacitance = [];

for y_loop = y;
capacitance = [capacitance cds_calc(y_loop,d_i,curvature)];
end

closefemm();
%%
plot(y,capacitance);
ylabel('C [F]')
xlabel('D [mm]')
grid on
save('simulation_results','y','capacitance');