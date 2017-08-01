function [Pd] = get_discrete_poles(P,Ts)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

my_sys = ss(diag(P),zeros(length(P),1),[1,zeros(1,length(P)-1)],0);
my_sys_d = c2d(my_sys,Ts);
Pd = eig(my_sys_d)';

end

