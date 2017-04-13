function [xp,y] = get_symbolic_model( model_type )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%% sybolic_constants

syms ws;
syms R_r
syms R_a
syms I_p I_0
syms m

%% state variables
syms x1 x2 x3 x4 x5 x6 x7 x8 x9 x10;
syms u1 u2 u3 u4 u5;

Rcm_x = x1;
Rcm_y = x2;
Rcm_z = x3;
Rcm_p_x = x4;
Rcm_p_y = x5;
Rcm_p_z = x6;

Rcm = [Rcm_x;Rcm_y;Rcm_z];
Rcm_p = [Rcm_p_x;Rcm_p_y;Rcm_p_z];

psi = x7;
theta = x8;
wy = x9;
wz = x10;
wx = ws;
F1_Y = u1;
F1_Z = u2;
F2_Y = u3;
F2_Z = u4;
F3_X = u5;

syms Fd_x Fd_y Fd_z Md_y Md_z;

%%

T_psi =     [ cos(psi), sin(psi), 0;
            -sin(psi), cos(psi), 0;
            0, 0, 1;];
T_theta =   [ cos(theta), 0, -sin(theta);
            0,1,0;
            sin(theta), 0, cos(theta)];

T_psi_inv = [ cos(psi), -sin(psi), 0;
            sin(psi), cos(psi), 0;
            0, 0, 1;];
T_theta_inv =   [ cos(theta), 0, sin(theta);
                0,1,0;
                -sin(theta), 0, cos(theta)];

T = T_theta*T_psi;
T_inv = T_psi_inv*T_theta_inv;

%%
F1 = [0;F1_Y;F1_Z];
F2 = [0;F2_Y;F2_Z];
F3 = [F3_X;0;0];

F1_xyz = T*F1;
F2_xyz = T*F2;
F3_xyz = T*abs(F3);


R1 = [R_r;0;0];
R2 = -[R_r;0;0];
R3 = [R_a;0;0];

M1 = cross(R1,F1_xyz);
M2 = cross(R2,F2_xyz);
M3 = cross(R3,F3_xyz);

if(isequal(model_type,'control'))
    M = M1 + M2;
else
    M = M1 + M2 + M3 + [0;Md_y;Md_z];
end

I_m = [I_p, 0, 0;
       0, I_0, 0;
       0 , 0 , I_0];

I_m_inv = inv(I_m);
   


w = [wx;wy;wz];
omega = [wx-ws;wy;wz];

H = I_m * w;

w_p = I_m_inv*(M - cross(omega,H));

%% angle equations
angles_p = [wy;sec(theta)*wz];
%% linear equations

if(isequal(model_type,'control'))
    F = F1 + F2 + F3;
else
    Fw = 9.8*m * [0; 0; -1];
    F = F1 + F2 + F3 + Fw + [Fd_x;Fd_y;Fd_z];
end

Rcm_pp = F/m;

xp = [Rcm_p;
      Rcm_pp;
      angles_p;
      w_p(2:3)];

P1  = T_inv*R1 + Rcm;
P2  = T_inv*R2 + Rcm;

y = [Rcm(1);P1(2:3);P2(2:3)];
end