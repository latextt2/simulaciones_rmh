function [A,B] = return_values()
%RETURN_VALUES Summary of this function goes here
%   Detailed explanation goes here
data_s = load('ss_data','A','B');
A = data_s.A;
B = data_s.B;
end

