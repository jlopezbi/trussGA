function [individual] = randomIndivid(templateTruss,mean,sD)
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
        offset = random('Normal',mean,sD,3,1);
        %disp(offset);
        individual.Coord(:,i) = individual.Coord(:,i)+offset;
    end
end

end

