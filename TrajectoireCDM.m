function [ Xnew] = TrajectoireCDM( X,Xp,P, Tsup, color )
%Calcul d'une trajcectoire à partir du ZMP
%X : position intiale du CDM
%Xp : vitesse initiale du CDM
%P : position du ZMP
%Tsup : temps du mvt
%color : 0=red, 1=blue 
%% Data
%
Zc=1;
g=9.81;
kx=0.1;
ky=0.1;
Tc=sqrt(Zc/g);
% Position of CDM
x=0;
y=0;
z=0;
Xnew=[];
vitGraph=[];
for i=0:5:100
    t=Tsup*i/100;
    x =(X(1)-P(1))*cosh(t/Tc)+Tc*Xp(1)*sinh(t/Tc)+P(1);
    y =(X(2)-P(2))*cosh(t/Tc)+Tc*Xp(2)*sinh(t/Tc)+P(2);
    z=kx*x+ky*y+Zc;
    Xnew=[Xnew [x;y;z]];
    figure(40)
    hold on
    xl = [x P(1)];
    yl = [y P(2)];
    zl = [z 0]; 
    pl = line(xl,yl,zl); 
    if (color==0)
        pl.Color = 'red';  
    else
        p1.color = 'blue';
    end
    xp=(x-X(1))/t;
    yp=(y-X(2))/t;
    vitGraph=[vitGraph [ xp yp sqrt((xp^2)+(yp^2))]'];
end
figure(2)
subplot(3,1,1)
y1 = Xnew(1,:);
plot(y1);
title(' CdM: X Evolution')

subplot(3,1,2)
y2 = Xnew(2,:);
plot(y2);
title(' CdM: Y Evolution')

subplot(3,1,3)
y3 = Xnew(3,:);
plot(y3);
title(' CdM: Z Evolution')

%% Dessin de la trajectoire de la vitesse   
%     figure(7)
%     hold on
% subplot(2,2,1)
% x1 = vitGraph(1,:);
% plot(x1);
% title('X speed')
% xlabel('step number');
% ylabel('speed');
% 
% subplot(2,2,2)
% y1 = vitGraph(2,:);
% plot(y1);
% title('Y speed')
% xlabel('step number');
% ylabel('speed');
% 
%  subplot(2,2,[3,4])
%  y3 = vitGraph(3,:);
%  plot(y3);
%  title('vitesse absolue')
% xlabel('step number');
% ylabel('speed');


%% Plot de l'évoluton de la position
% figure(3)
% plot3(Xnew(1,:),Xnew(2,:),Xnew(3,:),'red');
% xlabel('X');
% ylabel('Y');
% zlabel('Z');
% grid on
% title('Evolution of the CDM position');
end

