function [Vp_out] = calc_slew_rate_response(dv_dt_max,f,Vp)

f_max = dv_dt_max/(2*pi*Vp);
Vp_out = zeros(1,length(f));
for k  = 1:100;
    f_k = f(k);
    if(f_k <= f_max)
        Vp_out(k) = Vp;
    else
        Vp_out(k) = dv_dt_max/(2*pi*f_k);
    end
 
end

Vp_out = log10(Vp_out/Vp)*20;
end