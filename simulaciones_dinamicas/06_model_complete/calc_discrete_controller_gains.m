function [Kd,Kdo] = calc_discrete_controller_gains(A,B,C,P,Po,Ts)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
[Ad,Bd,Cd] = get_discrete_linear_model(A,B,C,Ts);
Pd = get_discrete_poles(P,Ts);
Pdo = get_discrete_poles(Po,Ts);
[Kd,Kdo] = calc_linear_controller_gains(Ad,Bd,Cd,Pd,Pdo);
end
