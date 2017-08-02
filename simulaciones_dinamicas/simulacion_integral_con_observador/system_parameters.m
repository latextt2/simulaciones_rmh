function [m,R_r,R_a,R_p,I_p,I_0] = system_parameters()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

l_shaft = 0.40;
l_radial_to_shaft = 0.052 + 0.020;
l_mcce_to_shaft = 0.052 + 0.060;
l_axial_to_shaft = 0.147;

r_shaft = 12.25e-3;
rho_shaft = 1050; %%plastico ABC
v_shaft = pi*(r_shaft^2)*l_shaft;
m_shaft = v_shaft*rho_shaft;

%%Datos del collarin
Ixx_collarin = 4588236e-9;
I0_collarin = 6754745e-9;
l_cm_collarin =  87.33e-3;
m_collarin = 3.216;

I_p = (1/2)*m_shaft*(r_shaft^2) + 2*Ixx_collarin;%%Ixx
I_0 = (1/12)*m_shaft*(l_shaft^2) + 2*(I0_collarin + m_collarin*(l_shaft + l_cm_collarin)^2);%%Irho

R_r = l_shaft + l_radial_to_shaft;
R_p = l_shaft + l_mcce_to_shaft;
R_a = l_shaft + l_axial_to_shaft;
m = m_shaft + m_collarin;

end