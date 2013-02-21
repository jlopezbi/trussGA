function [individual] = randomIndivid(templateTruss,offsetMultiplier)
%[individual] = randomIndivid(templateTruss)
%create a random individual from a template individual by replacing mutable
%verts with random verts
%later add in random areas!!

global boundBox;

numVerts = size(templateTruss.Coord,2);
noChangeVerts = cat(2, templateTruss.loaded, templateTruss.fixed);
individual = templateTruss;
xDim = boundBox(1);
yDim = boundBox(2);
zDim = boundBox(3);

for i = 1:numVerts
    if(~any(i==noChangeVerts))
        offset = randn(3,1)*offsetMultiplier;
        %disp(offset);
        individual.Coord(:,i) = individual.Coord(:,i)+offset;
        
%         individual.Coord(1,i) = randn(1)*xDim; %X VALUE
%         individual.Coord(2,i) = rand(1)*yDim; %Y VALUE
%         individual.Coord(2,i) = rand(1)*zDim; %Z VALUE
        
    end
end

end

