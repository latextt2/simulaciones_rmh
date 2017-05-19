function [R,R1,R2,Rg] = rmb_reluctace( l_gap )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

mu_0 = 4*pi*1e-7;
A = (12e-3)*(24e-3);

mu_r1 = 950;
l1 = 140e-3;
R1 = l1/(A*mu_0*mu_r1);

mu_r2 = 2200;
l2 = 52e-3; 
R2 = l2/(A*mu_0*mu_r2);

mu_rg = 1;
Rg = l_gap/(A*mu_0*mu_rg);

R = R1 + R2 + 2*Rg;
end

