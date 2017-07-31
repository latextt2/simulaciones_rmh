%%
clc
clear all
%% simulation parameters
y_min = 0.5;
y_max = 2.0;
delta_y = 0.1;
y = y_min:delta_y:y_max;
%%
capacitance = [];
openfemm
opendocument('simulacion_sdc.FEE');
ei_saveas('temp.FEE');
%%
for y_loop = y
    
    ei_analyze(1)
    ei_loadsolution
    conductor_properties = eo_getconductorproperties('sensor');
    
    capacitance_loop = conductor_properties(2);
    capacitance = [capacitance capacitance_loop]; 
    
    ei_clearselected
    ei_selectgroup(1);
    ei_movetranslate(0,delta_y);
end
closefemm
%%
dy = diff(y);
dc = diff(capacitance);
dc_dy = dc./dy;
subplot(2,1,1)
plot(y,capacitance)
subplot(2,1,2)
plot(y(2:end),dc_dy)