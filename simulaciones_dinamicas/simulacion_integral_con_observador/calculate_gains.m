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


sys_ideal = ss(A_i-B_i*K_i,B_i,C_i,0); 
sys_ideal_d  = c2d(sys_ideal,Ts,'tustin');
P_d = eig(sys_ideal_d);

sys = ss(A_i,B_i,C_i,0); 
sys_d  = c2d(sys,Ts,'tustin');

A_d = sys_d.A;
B_d = sys_d.B;
C_d = sys_d.C;

K_d = place(A_d,B_d,P_d);
K1_d = K_d(1:2);
K2_d = K_d(3);