clc
clear all

P = -((1:10)*4 + 400);
Po = -((1:10)*4 + 800);
Pi = [P,-((1:5) + 50)];
ws = 10000;
Ts = 0.5e-3;
Kh = 8;
generate_non_linear_model();
[xp_nl,y_nl] = get_symbolic_model('control');
[A,B,C] = get_linear_model(xp_nl,y_nl,ws);
[K, Ko] = calc_linear_controller_gains(A,B,C,P,Po);
Ki = calc_integral_controller_gains(A,B,C,Pi);

[Ad,Bd,Cd] = get_discrete_linear_model(A,B,C,Ts);
[Kd,Kdo] = calc_discrete_controller_gains(A,B,C,P,Po,Ts);
%%
Kdi = calc_discrete_integral_controller_gains(A,B,C,Pi,Ts);