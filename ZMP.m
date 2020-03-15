function [p] = ZMP( c,f )
%calcul le ZMP connaissant une liste de centre de masse et de force
%appliqués
%c : liste des position des point de contact
%f : liste des forces

p=[0 0 0 1]';
tailleC=size(c);
tailleF=size(f);

taille=min(tailleF(2), tailleC(2))
somme=0;
for i=1:taille
   somme=somme+f(3,i);
end

for i=1:taille
    p(1)=p(1)+ c(1,i)*f(3,i);
    p(2)=p(2)+ c(2,i)*f(3,i);
end
p(1)=p(1)/somme;
p(2)=p(2)/somme;

