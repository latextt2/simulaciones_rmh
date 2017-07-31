function [ capacitance ] = cds_calc( y,d_i,r_R)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
y_0 = 1.0;
d_0 = 1.0;

p1 = [0,y_0];
p2 = [10,y_0];

r = 10;
R = r./r_R;
alpha_rad = asin(r_R);
alpha_deg = rad2deg(alpha_rad);
cos_alpha = cos(alpha_rad);
h = R.*(1-cos_alpha);

opendocument('cds_param_sim.FEE');
ei_saveas('temp.FEE');

if(r_R ~= 0)
    ei_clearselected();
    ei_selectgroup(4)
    ei_deleteselected();

    ei_clearselected();
    ei_selectnode(p2);
    ei_movetranslate(0,h);

    ei_addarc(p1(1),p1(2),p2(1),h+p2(2),alpha_deg,1)
end

ei_clearselected();
ei_selectgroup(2)
ei_movetranslate(d_i-d_0,0);

ei_clearselected();
ei_selectgroup(3)
ei_movetranslate(0,y-y_0);

ei_analyze(1);

ei_loadsolution();
conductor_properties = eo_getconductorproperties('sensor');
capacitance = conductor_properties(2);

eo_close()
ei_close()
end