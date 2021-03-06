clc
clear all

m = .1;
x0 = zeros(3,1);
x0(1) = 1.5e-3;
x0(2) = 0;
x0(3) = force_to_current(-9.8*m,x0(1));

[F,Vfem,R,L] = get_electromagnet_parameters(x0(1),x0(2),x0(3));
u0 = x0(3)*R;

%%
a =   1.654e-09;
b =     -0.8914; 
N = 162;

f11 = 0;
f12 = 1;
f13 = 0;

f21 = (((N^2)*a*b*(b-1))/(2*m))*(x0(3)^2)*(x0(1)^(b-2));
f22 = 0;
f23 = (((N^2)*a*b)/m)*x0(3)*(x0(1)^(b-1));

f31 = ((-b)/(a*(N^2)))*(x0(1)^(-b-1))*u0 + b*(x0(1)^(-2))*x0(2)*x0(3) + ((b*R)/(a*(N^2)))*(x0(1)^(-b-1))*x0(3) ;
f32 = -b*(x0(1)^(-1))*x0(3);
f33 = -b*(x0(1)^(-1))*x0(2) + -(R/(a*(N^2)))*(x0(1)^(-b));

A = [f11 f12 f13;
     f21 f22 f23;
     f31 f32 f33];

f3du = (1/((N^2)*a))*(x0(1)^(-b));

B = [0 0 f3du]';


P = [-300, -400, -1000];

k = place(A,B,P)';