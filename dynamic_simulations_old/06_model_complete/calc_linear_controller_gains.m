function [K,Ko] = calc_linear_controller_gains(A,B,C,Pc,Po)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
K = place(A,B,Pc);
Ko = place(A',C',Po)';
end
