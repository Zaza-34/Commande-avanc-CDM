function [ Xnew ] = solveEq(x,y, h, xfin,it)
%solveEq resout les �quation du second degr� grace � la hauteur et deux
%point
%solveEq(x,y, h, xfin,it)
%x,y : position de d�part
%h : hauteur max
% xfin : position en x d'arriv�
%it : nombre de points

a= -4*h/((xfin-x)^2);
b=-a*(xfin-x);
Xnew=[];
for i=0:(xfin-x)/it:xfin-x
    s=[ i+x y (a*i^2)+b*i]';
    Xnew=[Xnew s];
end
