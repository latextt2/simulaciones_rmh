function [F,phi] = rmb_real_force(l_gap,NI)

delta_g = 0.0001e-3;
[Rf,R1,R2,Rg] = rmb_reluctace(l_gap+delta_g);
Ri = rmb_reluctace(l_gap)

phi = NI/Ri
dR_dg = (1/Rf - 1/Ri)/delta_g
F = (1/2) * ((NI)^2) * dR_dg

end