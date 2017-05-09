function [ force ] = simulate_static_at(y)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

y0 = 2.0;
dy = y0 - y;

openfemm();
opendocument('matlab_femm.FEM');
mi_saveas('temp_file.FEM');

mi_clearselected();
mi_selectgroup(1);
mi_movetranslate(0, dy);

mi_analyze(1);
mi_loadsolution();
mo_seteditmode('area');

mo_selectblock(18, -5);
force = mo_blockintegral(19);

mi_close();
mo_close();
end