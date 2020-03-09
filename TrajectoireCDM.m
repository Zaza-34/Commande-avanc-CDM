function [ Xnew ] = TrajectoireCDM( X,Xp,P, Tsup )
%Calcul d'une trajcectoire à partir du ZMP
%X position intial du CDM
%Xp : vitesse initial du CDM
%P position du ZMP
%Tsup temps du mvt

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
for i=0:5:100
    t=Tsup*i/100;
    x =(X(1)-P(1))*cosh(t/Tc)+Tc*Xp(1)*sinh(t/Tc)+P(1);
    y =(X(2)-P(2))*cosh(t/Tc)+Tc*Xp(2)*sinh(t/Tc)+P(2);
    z=kx*x+ky*y+Zc;
    Xnew=[Xnew [x;y;z]];
    
end
figure(2)
subplot(3,1,1)
y1 = Xnew(1,:);
plot(y1);
title(' ZMP: X Evolution')

subplot(3,1,2)
y2 = Xnew(2,:);
plot(y2);
title(' ZMP: Y Evolution')

subplot(3,1,3)
y3 = Xnew(3,:);
plot(y3);
title(' ZMP: Z Evolution')

figure(3)
plot3(Xnew(1,:),Xnew(2,:),Xnew(3,:),'red');
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on
title('Evolution of the CDM position');
end

