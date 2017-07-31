clc
clear all

y_0 = 1.0;

p1 = [0,y_0];
p2 = [10,y_0];

r_R = 0.025 : 0.025: 1;
r = 10;
R = r./r_R;
alpha_rad = asin(r_R);
alpha_deg = rad2deg(alpha_rad);
cos_alpha = cos(alpha_rad);
h = R.*(1-cos_alpha);

capacitance = [];

for n = 1:length(h)
    
openfemm()
opendocument('curvature_simulation.FEE');
ei_saveas('temp.FEE');

ei_clearselected();
ei_selectgroup(4)
ei_deleteselected();

ei_clearselected();
ei_selectnode(p2);
ei_movetranslate(0,h(n));

ei_addarc(p1(1),p1(2),p2(1),h(n)+p2(2),alpha_deg(n),1)

ei_analyze(1);

ei_loadsolution();
conductor_properties = eo_getconductorproperties('sensor');
capacitance = [capacitance conductor_properties(2)];
closefemm();    
end

%%
openfemm()
opendocument('curvature_simulation.FEE');
ei_saveas('temp.FEE');
ei_analyze(1);
ei_loadsolution();
conductor_properties = eo_getconductorproperties('sensor');
capacitance = [conductor_properties(2) capacitance];
r_R = [0 r_R]
closefemm();
%%
plot(r_R,capacitance/max(capacitance))
save('simulation_results','r_R','capacitance')