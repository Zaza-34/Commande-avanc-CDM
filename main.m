%% TP Commande Avanc�e
%% R�gles
%Les vecteur s'�crivent en colonne de 4 lignes.


%%
clf
clc
clear all
%% Part 1
% Ex 1)
origine=[0 0]';
x=0;
y=0;
q1=pi/3;
q2=pi/4;
X=CentreDeMasse(origine,x,y,q1,q2)

for i=0:5
    x=x+0.25;
    %y=y+0.4;
    q2=-i*pi/12;
    X=CentreDeMasse(origine,x,y,q1,q2)
    pause(0.6)
end

% Ex 2
%test du ZMP
%Vous pouvez modifier  les point de contacts et forces
c=[1 -1;
    1 -1;
    0 0;
    1 1];
f=[1 -1;
    1 -1;
    2 -0.5;
    1 1];
res=ZMP(c,f);
display('resultat du ZMP :');
display(res);

%% Part 2
%ZMP des 5 points
p0=[0 0 0 1]';
p1=[0 0.2 0 1]';
p2=[0.3 0 0 1]';
p3=[0.6 0.2 0 1]';
p4=[0.9 0 0 1]';
p=[p0 p1 p2 p3 p4];

%position des 6 centre de masse connus
Pos1=[0 0 1.023 1]';
Pos2=[0 0.1 1.023 1]';
Pos3=[0.15 0.1 1.023 1]';
Pos4=[0.45 0.1 1.023 1]';
Pos5=[0.75 0.1 1.023 1]';
Pos6=[1.05 0.1 1.023 1]';
Pos=[Pos1 Pos2 Pos3 Pos4 Pos5 Pos6];

%Variable declaration for  speed and position of the CDM
v=[];
Xnew=[0 0 1.023]';
vitGraph=[];
%Temps d'un pas
Tsup=0.5;
resu=[];
for i=1:4
    %je prend
    v=vitesse(Pos(:,i+1), Pos(:,i),p(:,i),Tsup);
    %Je m�morise la vitesse
    vitGraph=[vitGraph v];
    %Tsup=1;
    resu= TrajectoireCDM(Pos(:,i),[v(1) v(2) 0 1]',p(:,i),Tsup, mod(i,2));
    Xnew=[Xnew resu];
end
figure(40)
hold on
plot3(Xnew(1,:),Xnew(2,:),Xnew(3,:)*0,'green');
xlabel('X');
ylabel('Y');
zlabel('Z');
view(17,35)
grid on
axis([-0.5 1 -0.5 1 -0.2 1.5]);
title('Evolution of the CDM position');

%% Trac� de l'�volution de la vitesse

figure(6)
subplot(2,2,1)
x1 = vitGraph(1,:);
plot(x1);
title('X speed')
xlabel('step number');
ylabel('speed');

subplot(2,2,2)
y1 = vitGraph(2,:);
plot(y1);
title('Y speed')
xlabel('step number');
ylabel('speed');

subplot(2,2,[3,4])
y3 = vitGraph(3,:);
plot(y3);
title('vitesse absolue')
xlabel('step number');
ylabel('speed');

%% Trac� de la trajectoire

p=[p0 p1 p2 p3 p4];
rep=solveEq(p0(1),0,0.3,p2(1),20);
figure(40)
hold on
plot3(rep(1,:),rep(2,:),rep(3,:),'k*');

rep=solveEq(p1(1),0.2,0.3,p3(1),20);
figure(40)
hold on
plot3(rep(1,:),rep(2,:),rep(3,:),'k*');

rep=solveEq(p2(1),0,0.3,p4(1),20);
figure(40)
hold on
plot3(rep(1,:),rep(2,:),rep(3,:),'k*');
