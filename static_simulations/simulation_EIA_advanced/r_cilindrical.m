function [ r ] = r_cilindrical(r1,r2,g);
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
u_0 = 4*pi*1e-7;
r = g./(u_0*((r2.^2)-(r1.^2))*pi);
end

