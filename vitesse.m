function [ v ] = vitesse( Xsup, Xo,P,Tsup )
%VITESSE Summary of this function goes here
%   Xup : position final
%   Xo : position initial
%   P : ZMP position
%   Tsup : Tsup
%% Data
%
Zc=1;
g=9.81;
Tc=sqrt(Zc/g);
Xp=[];
t=Tsup
   Xp(1)=(Xsup(1)-((Xo(1)-P(1))*cosh(t/Tc))-P(1))/(Tc*sinh(t/Tc));
   Xp(2)=(Xsup(2)-((Xo(2)-P(2))*cosh(t/Tc))-P(2))/(Tc*sinh(t/Tc));

v=[Xp(1) Xp(2)]';
end

