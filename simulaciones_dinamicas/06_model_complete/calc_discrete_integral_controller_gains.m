function [Kdi,Adi,Bdi] = calc_discrete_integral_controller_gains(A,B,C,Pi,Ts)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
[Ad,Bd,Cd] = get_discrete_linear_model(A,B,C,Ts);
Pdi = get_discrete_poles(Pi,Ts);

m = size(B,2);% inputs
n = size(B,1);% states
p =  size(C,1);% outputs

Adi =[Ad zeros(n,p);
      -Cd eye(p,p)];
Bdi = [Bd;zeros(p,m)];

Kdi = place(Adi,Bdi,Pdi);
end
