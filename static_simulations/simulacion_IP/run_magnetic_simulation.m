y = [1:0.1:5];
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
save('simulation_data','f','y');