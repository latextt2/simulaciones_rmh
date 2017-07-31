
y_min = 0.5
y_max = 2.0
delta_y = 0.1;

opendocument('simulacion_sdc.FEE');
ei_saveas('temp.FEE');
ei_clearselected
ei_selectgroup(1);
ei_movetranslate(0,0.5);
ei_analyze(1)
ei_loadsolution
%%
conductor_properties = eo_getconductorproperties('sensor');
capacitance = conductor_properties(2)
%%
closefemm