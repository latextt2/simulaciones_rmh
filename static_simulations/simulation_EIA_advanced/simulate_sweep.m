clc;
clear all;

n_samples = 21;
yi = 0.5;
yf = 2;
y = linspace(yi,yf,n_samples);
f = [];

for y_k = y
f_k = simulate_static_at(y_k);
f = [f f_k];
end

y = 1e-3 * y;

save('simulation_data','f','y');