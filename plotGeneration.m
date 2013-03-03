function gaPlot = plotGeneration(costs,numKeep,numDisplay)
%plotGeneration(costs)
%visualize generation
%
%
global boundBox pop numIndivid;

uScale = 2;
gaPlot = figure('Color',[1 1 1],'OuterPosition',[600,400,1500,700],...
    'DockControls','off');
for i = 1:numDisplay
    rank = find(costs(:,2)==i); %find i in the 2column of the cost array
    fitness = costs(rank,1);
    h = subplot(2,numDisplay/2,i,'Color','White');
    %set(h, 'Color','black');
    plotTruss(pop{i},uScale,rank,fitness,numKeep,boundBox); 
end

end



