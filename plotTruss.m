function trussH = plotTruss(truss,uScale,rank,fitness,numKeep,idx)
%trussH = plotTruss(truss,rank,position)
%   Detailed explanation goes here

global boundBox;

hold on;
if(isfield(truss, 'U'))
    displ = truss.U;
else
    displ = 0.0;
end
phenotype = [truss.Coord;truss.Coord+uScale*displ];
e = truss.Con(1,:);
f = truss.Con(2,:);
for i = 1:6
    M=[phenotype(i,e);phenotype(i,f); NaN(size(e))];
    X(:,i)=M(:); 
end
trussH = plot3(X(:,1),X(:,2),X(:,3),'Marker','o','MarkerEdgeColor',[.2 .2 .2],'Color',[0 0 0]);
plot3(X(:,4),X(:,5),X(:,6),'Color', 'm');

%% PLOT FIXED NODES AS BLUE

A = truss.Coord(:,truss.fixed);
B = A';
plot3(B(:,1),B(:,2),B(:,3),'Marker','.','MarkerEdgeColor','b','LineStyle','none');


%% PLOT LOADED NODES AS BLUE x
C = truss.Coord(:,truss.loaded);
E = C';
plot3(E(:,1),E(:,2),E(:,3),'Marker','x','MarkerEdgeColor','m','LineStyle','none');

%% PLOT MUTATED NODES AS RED
if(isfield(truss,'mutatedVerts'))
    F = truss.Coord(:,truss.mutatedVerts);
    G = F';
    %greenish = [.78,.956,.427];
    plot3(G(:,1),G(:,2),G(:,3),'Marker','.','Color','r','LineStyle','none');
end

%% PLOT BOUND BOX

x = boundBox(1);
y = boundBox(2);
z = boundBox(3);
Da = [[0 0 0];
     [0 0 z];
     [0 y z];
     [0 y 0];
     [0 0 0];
     [x 0 0];
     [x 0 z];
     [x y z];
     [x y 0];
     [x 0 0];
    ];
Db = [[0 y 0];
      [x y 0];];
Dc = [[0 y z];
       [x y z]];
Dd = [[0 0 z];
       [x 0 z]];
line(Da(:,1),Da(:,2),Da(:,3),'LineStyle','--');
line(Db(:,1),Db(:,2),Db(:,3),'LineStyle','--');
line(Dc(:,1),Dc(:,2),Dc(:,3),'LineStyle','--');
line(Dd(:,1),Dd(:,2),Dd(:,3),'LineStyle','--');

%% LIMITS
%axis fill;
axis equal;
%axis vis3d;

xlim([x,0]);
ylim([0 y]);
zlim([0 z]);
zoom on;
set(gca, 'XTick', [],'YTick', [],'ZTick', []);


%% TITLE
titleStr = ['RANK: ', num2str(rank),', FITNESS: ',num2str(fitness)];
titleH = title(titleStr);
if(numKeep-rank>=0)
    set(titleH, 'Color', 'b');
end

view(3);
end























