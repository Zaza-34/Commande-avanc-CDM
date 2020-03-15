function [ Jcdm ] = Jacobien( x,y,q1, q2 )
%JACOBIEN 
%Jcdm

%% Variable

m1 = 1;
m2 = 0.5;
l1 = 1;
l2 = 1;
l1m = 0.5;
l2m = 0.5;
c1 = (1/(m1+m2))*m1*l1m+m2*l1;
c2 = (1/(m1+m2))*m2*l2m;


%% Calcul Jacobienne 
%----------------------------------------------------
%        
%-----------------------------------------------------
Jcdm = [1 0 -c1*sin(q1)-c2*sin(q1+q2) -c2*sin(q1+q2);
        0 1 c1*cos(q1)+c2*cos(q1+q2)  c2*cos(q1+q2)]; 
    
end

