clc
dz = 0.05;
n = 20;
z_max = n * dz;
f = [];
distance = [];
%%
openfemm
opendocument('matlab_femm.FEM')
for d = 0:dz:z_max
mi_analyze(1)
%%
mi_loadsolution
mo_seteditmode('area')
mo_selectblock(18,-5)
f_new = mo_blockintegral(19);
f = [f f_new];
distance = [distance d];
%%
mi_clearselected
mi_selectgroup(1)
mi_movetranslate(0,dz)
end
%%
mi_clearselected
mi_selectgroup(1)
mi_movetranslate(0,-((n+1)*(dz)))
mi_analyze(1)
%%
mi_close
closefemm
f_real = f
y_real = 2.0 - distance