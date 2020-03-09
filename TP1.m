%% 
clc;
close all;
clear;
%% Def constantes
x = 0;  y = 0;
m1 = 0.1;  m2 = 0.5;
l1 = 1; l2 = 1;
l1m = 0.5;  l2m = 0.5;
q1 = pi/6;  q2 = pi/2;
r1 = m1*l1m+m2*l1;  r2 = m2*l2m;

%% Calcul CdM & Jacobienne
[CdM] = [x;y] + (1/(m1+m2))*((r1)*[cos(q1); sin(q1)] + r2*[cos(q1+q2); sin(q1+q2)]);



%% Trajectoire du CdM
% on connait x(0) et x(Tsup), on peut déduire xpoint(0) en l'isolant dans
% l'équation (4). De même pour ypoint(0).
% Entrées : positionZMP, positionCdM(à t=0), vitesseCdM(à t=0),zc, Tsup, dt
% Sorties : positionCdM(x,y,z), vitesseCdM(xpoint(t),ypoint(t),zpoint(t))

kx = 0.1;
ky = 0.1;
zc = 1;

% Trajectoire du CdM en fonction du temps et d'un ZMP :

xt = (x0 - px)*cosh(t/Tc) + Tc*xpoint0*sinh(t/Tc) + px
yt = (y0 - py)*cosh(t/Tc) + Tc*ypoint0*sinh(t/Tc) + py

