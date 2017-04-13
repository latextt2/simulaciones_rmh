function [F,Vfem,R,L,permeance,N] = get_electromagnet_parameters(y,dy_dt,I)
%GET_ELECTROMAGNET_PARAMETERS Summary of this function goes here
%   Detailed explanation goes here
N = 162;
l_med = 144e-6;
rho = 20.9428;
%%

R = N*rho*l_med;
a =   1.654e-09;
b =     -0.8914; 
permeance = a*(y.^b);

L = (N^2)*permeance;
%%
dp_dy = a*b*(y.^(b-1));
F = (1/2)*((N*I)^2)*dp_dy;
Vfem = N^2*I*dp_dy*dy_dt;
dp2_dy2 = a*b*(y.^(b-1));
end