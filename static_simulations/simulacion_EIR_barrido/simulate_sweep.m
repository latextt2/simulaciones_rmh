clc;
clear all;

yi = 0.1;
yf = 1;
dy = 0.05;
y = yi:dy:yf;
f = [];

for y_k = y
f_k = simulate_static_at(y_k);
f = [f f_k];
end

y = 1e-3 * y;
%%
f20 = f
y20 = y
%%
save('simulation_data','f20','y20','-append');