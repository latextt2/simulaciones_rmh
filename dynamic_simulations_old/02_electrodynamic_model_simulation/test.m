clc;
clear all;
%%
y = 2e-3;
yp = 0e-3;
I = 2;
[F,Vfem,R,L] = get_electromagnet_parameters(y,yp,I);
