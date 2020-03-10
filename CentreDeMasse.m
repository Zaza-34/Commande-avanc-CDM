function [ X ] = CentreDeMasse(origine,x,y,q1,q2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%Masse du corp
%% 

m1 = 1;
m2 = 0.5;
l1 = 1;
l2 = 1;
l1m = 0.5;
l2m = 0.5;
c1 = (1/(m1+m2))*m1*l1m+m2*l1;
c2 = (1/(m1+m2))*m2*l2m;



%% Calcul Centre de Masse et Jacobienne
%Calcul du centre de masse
X = [origine(1);origine(2)] + [x;y] + (1/(m1+m2))*((c1)*[cos(q1); sin(q1)] + c2*[cos(q1+q2); sin(q1+q2)]);
X= [X;0;1];
%Je rafraichie l'image
hold off
plot(0,0)
%J'affiche l'volution du centre de masse
figure(1)
hold on
plot(X(1),X(2),'bo');
plot(origine(1)+x, origine(2)+y,'xr');
axis([0 6 2 7])
line([origine(1)+x origine(1)+x+l1*cos(q1)],[origine(2)+y origine(2)+y+l1*sin(q1)],'Color','red','LineWidth',2);
line([origine(1)+x+l1*cos(q1) origine(1)+x+l1*cos(q1)+l2*cos(q1+q2)],[origine(2)+y+l1*sin(q1) origine(2)+y+l1*sin(q1)+l2*sin(q1+q2)],'Color','green','LineWidth',2);
    xlabel('X');
    ylabel('Y');
    grid on
    title('Evolution of the CDM position');

%Calcul Jacobienne 
%----------------------------------------------------
%           Il peut y avoir un problème de dimension
%-----------------------------------------------------
Jcdm = [1 0 -c1*sin(q1)-c2*sin(q1+q2) -c2*sin(q1+q2);
        0 1 c1*cos(q1)+c2*cos(q1+q2)  c2*cos(q1+q2)];    
end

