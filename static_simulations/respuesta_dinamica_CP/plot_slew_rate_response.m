L = 10e-3;
Vcc = 24;

dv_dt_max = 24/L;

Vp01 = 0.1;
Vp05 = 0.5;
Vp10 = 1;
Vp15 = 1.5;
Vp20 = 2.0;

f = logspace(0,4,100);

Vp_out01 = calc_slew_rate_response(dv_dt_max,f,Vp01);
Vp_out05 = calc_slew_rate_response(dv_dt_max,f,Vp05);
Vp_out10 = calc_slew_rate_response(dv_dt_max,f,Vp10);
Vp_out15 = calc_slew_rate_response(dv_dt_max,f,Vp15);
Vp_out20 = calc_slew_rate_response(dv_dt_max,f,Vp20);


%%
subplot(1,2,1);
semilogx(f,Vp_out01,f,Vp_out05,f,Vp_out10,f,Vp_out15,f,Vp_out20);
axis([-inf,inf,-inf,10])
title('Respuesta en frecuencia')
xlabel('Frecuencia [Hz]')
ylabel('Ganancia [dB]')
legend('Ip = 0.1A','Ip = 0.5A','Ip = 1.0A','Ip = 1.5A','Ip = 2.0A','Location','southwest');
grid on

%%
subplot(1,2,2);
Vp = [0.1 :0.05:3];
f_max = dv_dt_max./(2*pi*Vp);
semilogy(Vp,f_max)
title('Limitacion en taza de dislizamiento')
ylabel('Frecuencia [Hz]')
xlabel('Corriente Pico[A]')
grid on