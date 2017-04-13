function [ f ] = get_force_at( y )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
y_0 = 1.5;

opendocument('IP_simulation_model.FEM');
mi_saveas('temp_file.FEM');
mi_clearselected();
mi_selectgroup(1)
mi_movetranslate(0,-(y-y_0));
mi_analyze(1);
mi_loadsolution();
mo_seteditmode('area')
mo_selectblock(40,-(y-y_0));
f = mo_blockintegral(19);
mi_close();
mo_close();

end