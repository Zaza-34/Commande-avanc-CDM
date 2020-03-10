%% TP Commande Avancée
%% Règles
%Les vecteur s'écrivent en colonne de 4 lignes.

%% Problèmes possiblle
%Voir Jacobienne dans CentreDeMasse
%Voir les valeur de Tsup Xp et P à metttre dans le main

clc
clear all
%% EX 1
origine=[0;0]
x=2;
y=3;
q1=pi/3;
q2=pi/4;
X=CentreDeMasse(origine,x,y,q1,q2)
% for i=0:5
%     x=x+0.25;
%     y=y+0.4;
%     q2=-i*pi/12;
%     X=CentreDeMasse(origine,x,y,q1,q2)
%     pause(0.6)
% end 
%% Ex 2
P = [1.5; 1; 0;1]
Xp= [0.1;0.1;0.1;1]
Tsup=0.5;
TrajectoireCDM( X,Xp, P, Tsup );

%% Ex 2.2
%ZMP des 4 points
p0=[0 0 0 1]';
p1=[0 0.2 0 1]';
p2=[0.3 0 0 1]';
p3=[0.6 0.2 0 1]';
p4=[0.9 0 0 1]';
p=[p0 p1 p2 p3 p4];

%position
Pos1=[0 0 1.023 1]';
Pos2=[0 0.1 1.023 1]';
Pos3=[0.15 0.1 1.023 1]';
Pos4=[0.45 0.1 1.023 1]';
Pos5=[0.75 0.1 1.023 1]';
Pos6=[1.05 0.1 1.023 1]';
Pos=[Pos1 Pos2 Pos3 Pos4 Pos5 Pos6];

figure(4)
hold on
axis([-0.5 1.5 -0.5 1.5])
figure(5)
    hold on
v=[];
Xnew=[0 0 1.023]';

for i=1:4
%     figure(4)
%     plot(p(1,i),p(2,i),'ro');
    %je stock la position du CDM
    tail=size(Xnew);
    %origine=Xnew(:,tail(2))
    Tsup=0.5;
    %je prend  
    v=vitesse(Pos(:,i+1), Pos(:,i),p(:,i),Tsup);
       
   %Tsup=1; 
   Xnew=[Xnew TrajectoireCDM(Pos(:,i),[v(1) v(2) 0 1]',p(:,i),Tsup)];
  
end
  figure(40)
    %hold on
    plot3(Xnew(1,:),Xnew(2,:),Xnew(3,:),'red');
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    grid on
    axis([-0.5 1.5 -0.5 1.5 -0.5 1.5])
    title('Evolution of the CDM position');
