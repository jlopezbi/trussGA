function TP(D,U,Sc)
hold on;
C=[D.Coord;D.Coord+Sc*U];
e=D.Con(1,:);
f=D.Con(2,:);
for i=1:6
    M=[C(i,e);C(i,f); repmat(NaN,size(e))];
    X(:,i)=M(:);    
end
plot3(X(:,1),X(:,2),X(:,3),'k',X(:,4),X(:,5),X(:,6),'m');

%PLOT FIXED NODES AS BLUE

A = D.Coord(:,D.fixed);
B = A';
plot3(B(:,1),B(:,2),B(:,3),'Marker','o','LineStyle','none');

%PLOT LOADED NODES AS RED x
C = D.Coord(:,D.loaded);
E = C';
plot3(E(:,1),E(:,2),E(:,3),'Marker','o','MarkerEdgeColor','r','LineStyle','none');

axis('equal');
if D.Re(3,:)==1; 
    view(2);
end
