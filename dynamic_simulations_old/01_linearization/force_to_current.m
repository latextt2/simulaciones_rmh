function [I] = force_to_current(F,y)
%GET_ELECTROMAGNET_PARAMETERS Summary of this function goes here
%   Detailed explanation goes here
N = 162;
%%
a =   1.654e-09;
b =     -0.8914; 
%%
dp_dy = a*b*(y.^(b-1));
I = sqrt((F*2)/dp_dy)/N ;
end