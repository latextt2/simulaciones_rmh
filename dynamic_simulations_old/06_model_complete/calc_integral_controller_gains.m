function [K,Ai,Bi,Ci] = calc_integral_controller_gains(A,B,C,P)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

m = size(B,2);% inputs
n = size(B,1);% states
p =  size(C,1);% outputs

Ai =[A zeros(n,p);
      -C zeros(p,p)];
Bi = [B;zeros(p,m)];

Ci = [C zeros(p,p)];

K = place(Ai,Bi,P);
end

