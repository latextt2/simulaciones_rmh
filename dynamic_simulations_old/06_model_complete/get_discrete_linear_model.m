function [Ad,Bd,Cd] = get_discrete_linear_model(A,B,C,Ts)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

sys = ss(A,B,C,0); 
sys_d  = c2d(sys,Ts);
Ad = sys_d.A;
Bd = sys_d.B;
Cd = sys_d.C;
end

