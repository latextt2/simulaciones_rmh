clc
clear all

syms x1 x2 x3 x4 x5 x6 x7 x8 x9 x10;
syms u1 u2 u3 u4 u5;
syms ws;

x_state = [x1,x2,x3,x4,x5,x6,x7,x8,x9,x10];
u_state = [u1,u2,u3,u4,u5];

[xp_nl, y_nl] = get_symbolic_model( 'control' );

A = jacobian(xp_nl,x_state);
B = jacobian(xp_nl,u_state);
C = jacobian(y_nl,x_state);

for n = 1:length(x_state);
    eval(sprintf('x%d = 0;',n));
end

for k = 1:length(u_state);
    eval(sprintf('u%d = 0;',k));
end

disp(A)
disp(B)
disp(C)
