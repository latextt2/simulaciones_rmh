y = [0.5:0.1:6];
f = [];
%%
openfemm
for y_k = y 
f_k = get_force_at(y_k);
f = [f f_k];
end
closefemm
%%
y = 1e-3 * y;
save('simulation_results','f','y');
plot(y,f);