clear all
clc

m = .1;
Ts = 1e-3;

A = [0 1;
     0 0];
B = [0;
     1/m];
C = [1 0];
D = [0];
P = [-1000 -1100];
K = place(A,B,P);
x0 = [1.5e-3;0];
ke = 9.8*(2e-3)^2;

sys_ideal = ss(A-B*K,B,C,D); 
sys_ideal_d  = c2d(sys_ideal,Ts,'tustin');
P_d = eig(sys_ideal_d)

sys = ss(A,B,C,D); 
sys_d  = c2d(sys,Ts,'tustin');
A_d = sys_d.A;
B_d = sys_d.B;
C_d = sys_d.C;

K_d = acker(A_d,B_d,P_d)