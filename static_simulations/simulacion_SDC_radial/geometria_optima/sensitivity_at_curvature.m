function [ delta_c ] = sensitivity_at_curvature(y_0,y_1,d_i, curvature)
%UNTITLED2 Summary of this function goes here
%   y_0 miminum distance
%   y1 maximum_distance
%   d_i vector of diameters
%   d_i vector of diameters
c_0 = [];
c_1 = [];

openfemm();
for d = d_i;
c_0 = [c_0 cds_calc(y_0, d, curvature)];
c_1 = [c_1 cds_calc(y_1, d, curvature)];
end
closefemm();

delta_c = c_1 - c_0;
end

