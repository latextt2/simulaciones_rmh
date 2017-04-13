%%
clc
clear all
%%
delta_y = 1;
y_initial = 1;

r_i = 1
delta_r = 0.5;
r_max = 9;

r = r_i:delta_r:r_max

openfemm
opendocument('gp_simulation.FEE');
ei_saveas('temp.FEE');
 
ei_clearselected
ei_selectgroup(1);
ei_movetranslate(0,y_initial-0.5);
ei_analyze(1)
ei_loadsolution
conductor_properties = eo_getconductorproperties('sensor');
capacitance(1) = conductor_properties(2);

ei_clearselected
ei_selectgroup(1);
ei_movetranslate(0,delta_y);
ei_analyze(1)
ei_loadsolution
conductor_properties = eo_getconductorproperties('sensor');
capacitance(2) = conductor_properties(2);
%%
closefemm
%%
dc = diff(capacitance)
dy = delta_y
dc_dy = dc./dy
dc_dy_c = dc_dy/capacitance(1)
