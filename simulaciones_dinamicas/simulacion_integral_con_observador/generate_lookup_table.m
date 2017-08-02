clc
clear all

P = -((1:10)*4 + 300);
Po = -((1:10)*4 + 600); 
Pi = [P,-((1:5)+30)];
Ts = 0.5e-3;
ws_lt = -30000 : 2500 :30000;

generate_non_linear_model();
[xp_nl,y_nl] = get_symbolic_model('control');
Kh = 8;
%%
for n = 1:length(ws_lt)
ws = ws_lt(n);
[A,B,C] = get_linear_model(xp_nl,y_nl,ws);
[K, Ko] = calc_linear_controller_gains(A,B,C,P,Po);
Ki = calc_integral_controller_gains(A,B,C,Pi);

[Ad,Bd,Cd] = get_discrete_linear_model(A,B,C,Ts);
[Kd,Kdo] = calc_discrete_controller_gains(A,B,C,P,Po,Ts);
Kdi = calc_discrete_integral_controller_gains(A,B,C,Pi,Ts);

A_lt(:,:,n) = A; 
B_lt(:,:,n) = B;
C_lt(:,:,n) = C;
K_lt(:,:,n) = K;
Ko_lt(:,:,n) = Ko;
Ki_lt(:,:,n) = Ki;

Ad_lt(:,:,n) = Ad; 
Bd_lt(:,:,n) = Bd;
Cd_lt(:,:,n) = Cd;
Kd_lt(:,:,n) = Kd;
Kdo_lt(:,:,n) = Kdo;
Kdi_lt(:,:,n) = Kdi;
end

ws = -10000;
[A,B,C] = get_linear_model(xp_nl,y_nl,ws);
[K, Ko] = calc_linear_controller_gains(A,B,C,P,Po);
Ki = calc_integral_controller_gains(A,B,C,Pi);

[Ad,Bd,Cd] = get_discrete_linear_model(A,B,C,Ts);
[Kd,Kdo] = calc_discrete_controller_gains(A,B,C,P,Po,Ts);
Kdi = calc_discrete_integral_controller_gains(A,B,C,Pi,Ts);
