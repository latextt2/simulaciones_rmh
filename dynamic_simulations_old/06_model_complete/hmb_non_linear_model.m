function [xp,y] = hmb_non_linear_model(x,u,ws,Fd_x,Fd_y,Fd_z,Md_y,Md_z)

[m,R_r,R_a,I_p,I_0] = system_parameters();

x1 = x(1);
x2 = x(2);
x3 = x(3);
x4 = x(4);
x5 = x(5);
x6 = x(6);
x7 = x(7);
x8 = x(8);
x9 = x(9);
x10 = x(10);

u1 = u(1);
u2 = u(2);
u3 = u(3);
u4 = u(4);
u5 = u(5);

xp = [
	x4;
	x5;
	x6;
	(Fd_x + u5)/m;
	(Fd_y + u1 + u3)/m;
	(Fd_z - (49*m)/5 + u2 + u4)/m;
	x9;
	x10/cos(x8);
	-(R_r*(u2*cos(x8) + u1*sin(x7)*sin(x8)) - Md_y - R_r*(u4*cos(x8) + u3*sin(x7)*sin(x8)) + I_p*ws*x10 + R_a*abs(u5)*cos(x7)*sin(x8))/I_0;
	(Md_z + R_r*u1*cos(x7) - R_r*u3*cos(x7) - R_a*abs(u5)*sin(x7) + I_p*ws*x9)/I_0;
];

y = [
	x1;
	x2 + R_r*cos(x8)*sin(x7);
	x3 - R_r*sin(x8);
	x2 - R_r*cos(x8)*sin(x7);
	x3 + R_r*sin(x8);
];

end
