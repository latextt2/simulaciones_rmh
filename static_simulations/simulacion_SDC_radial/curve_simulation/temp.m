%% simulation parameters
y_min = 0.5;
y_max = 2.0;
delta_y = 0.1;
y = y_min:delta_y:y_max;

%%
capacitance = [];
for y_loop = y
    conductor_properties = sin(y_loop)*[0 1];
    capacitance_loop = conductor_properties(2);
    capacitance = [capacitance capacitance_loop]; 
end

%%
dy = diff(y);
dc = diff(capacitance);
dc_dy = dc./dy;
plot(y(2:end),dc_dy)