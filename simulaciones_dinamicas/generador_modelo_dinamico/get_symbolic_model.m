function [xp,y] = get_symbolic_model( model_type )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%% sybolic_constants

syms ws;
syms R_r
syms R_a
syms R_p
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

%% Fuerzas mcce
syms Fmcce1 Fmcce2
F4_Z = Fmcce1;
F5_Z = Fmcce2;

%% Fuerzas pertubadoras
syms Fd_x Fd_y Fd_z Md_y Md_z;

%% Matrices de transformacion al marco movil

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

%% Fuerzas de actuadores
F1 = [0; F1_Y; F1_Z];%%Fuerza RMR derecho
F2 = [0; F2_Y; F2_Z];%%Fuerza RMR izquiero
F3 = [F3_X; 0; 0];%%Fuerza RMA
F4 = [0; 0; F4_Z];%%Fuerza MCCE derecho
F5 = [0; 0; F5_Z];%%Fuerza MCCE izquiero

%% Transformacion de fuerzas al marco movil
F1_xyz = T*F1;
F2_xyz = T*F2;
F3_xyz = T*abs(F3);
F4_xyz = T*F4;
F5_xyz = T*F5;

%% Puntos de accion del actuador respecto al centro del eje
R1 = [R_r;0;0];
R2 = -[R_r;0;0];
R3 = [R_a;0;0];
R4 = [R_p;0;0];
R5 = -[R_p;0;0];

%% Momentos torsores
M1 = cross(R1,F1_xyz);
M2 = cross(R2,F2_xyz);
M3 = cross(R3,F3_xyz);
M4 = cross(R4,F4_xyz);
M5 = cross(R5,F5_xyz);

%%Suma de momentos para control
if(isequal(model_type,'control'))
    M = M1 + M2;
%%Suma de momentos para simulacion
else
    M = M1 + M2 + M3 + M4 + M5 + [0;Md_y;Md_z];
end

%%Matriz de inercia ???
I_m = [I_p, 0, 0;
       0, I_0, 0;
       0 , 0 , I_0];

I_m_inv = inv(I_m);

%% Velocidades angulares
w = [wx;wy;wz];
omega = [wx-ws;wy;wz];

H = I_m * w;

w_p = I_m_inv*(M - cross(omega,H));

%% angle equations
angles_p = [wy;sec(theta)*wz];

%% Suma de fuerzas
if(isequal(model_type,'control'))
%%Suma de fuerzas (para control)
    F = F1 + F2 + F3;
else
%%Suma de fuerzas (para control)
    Fw = 9.8*m * [0; 0; -1];
    F = F1 + F2 + F3 + F4 + F5 + Fw + [Fd_x;Fd_y;Fd_z];
end

%% Ecuaciones dinamicas
Rcm_pp = F/m;

xp = [Rcm_p;
      Rcm_pp;
      angles_p;
      w_p(2:3)];

P1  = T_inv*R1 + Rcm;
P2  = T_inv*R2 + Rcm;

y = [Rcm(1);P1(2:3);P2(2:3)];
end