clear all
clc
%%
m = .1;
Ts = 4e-4;

A = [0 1;
     0 0];
B = [0;
     1/m];
C = [1 0];
D = [0];
P_i = [-1000,-1100,-30];
P = P_i(1:2);
K = place(A,B,P);
x0 = [1.5e-3;0];
ke = 9.8*(2e-3)^2;

A_i =[A zeros(size(A,1),1);
      -C 0 ];
B_i = [B;0];
C_i = [C 0];

K_i = place(A_i,B_i,P_i);

K1 = K_i(1:2);
K2 = K_i(3);


A_f = -K_i*B_i;
B_f = -K_i*B_i;

P_f = [-1000]
K_f = place(A_f,B_f,P_f)