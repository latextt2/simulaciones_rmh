function [Y_k] = matrix_interpolation(w,Y,w_k)

Y_r = reshape(Y,[size(Y,1)*size(Y,2),size(Y,3)])';
Y_r_k = interp1(w,Y_r,w_k,'linear','extrap');
Y_k = reshape(Y_r_k,[size(Y,1),size(Y,2)]);

end