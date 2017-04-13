function [m,R_r,R_a,I_p,I_0] = system_parameters()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

l_shaft = 0.40;
l_radial_to_shaft = 0.130;
l_axial_to_shaft = 0.170;

r_shaft = 12.5e-3;
rho_shaft = 1190;
v_shaft = pi*(r_shaft^2)*l_shaft;
m_shaft = v_shaft*rho_shaft;

I_p = (1/2)*m_shaft*(r_shaft^2);
I_0 = (1/12)*m_shaft*(3*(r_shaft^2) + (l_shaft^2));


R_r = l_shaft + l_radial_to_shaft;
R_a = l_shaft + l_axial_to_shaft;
m = m_shaft;

end