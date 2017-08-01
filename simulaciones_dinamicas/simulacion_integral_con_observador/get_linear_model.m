function [Al,Bl,Cl] = get_linear_model(xp_nl,y_nl,ws)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
syms x1 x2 x3 x4 x5 x6 x7 x8 x9 x10;
syms u1 u2 u3 u4 u5;

x_state = [x1,x2,x3,x4,x5,x6,x7,x8,x9,x10];
u_state = [u1,u2,u3,u4,u5];

A = jacobian(xp_nl,x_state);
B = jacobian(xp_nl,u_state);
C = jacobian(y_nl,x_state);

for n = 1:length(x_state);
    eval(sprintf('x%d = 0;',n));
end

for k = 1:length(u_state);
    eval(sprintf('u%d = 0;',k));
end

[m,R_r,R_a,R_p,I_p,I_0] = system_parameters();

Al = eval(A);
Bl = eval(B);
Cl = eval(C);
end

