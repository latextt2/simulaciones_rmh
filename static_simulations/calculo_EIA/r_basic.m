function [ r ] = r_basic(w,l,h)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
u_0 = 4*pi*1e-7;
r = 1./((u_0)*((w./(2*l))+((2/pi)*(1+log((pi*h)./(4*l))))));
end

