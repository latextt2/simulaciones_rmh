function [ capacitance, r] = simulate_geometry_at(r_max,delta_r,y_i)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
r_min = 1;
r = r_min:delta_r:r_max;
%%
capacitance = [];
openfemm
opendocument('gp_simulation.FEE');
ei_saveas('temp.FEE');

ei_clearselected
ei_selectgroup(1);
ei_movetranslate(0,y_i-0.5);
%%
for r_loop = r
    
    ei_analyze(1)
    ei_loadsolution
    conductor_properties = eo_getconductorproperties('sensor');
    
    capacitance_loop = conductor_properties(2);
    capacitance = [capacitance capacitance_loop]; 
    
    ei_clearselected
    ei_selectgroup(2);
    ei_movetranslate(delta_r,0);
end
closefemm

end

