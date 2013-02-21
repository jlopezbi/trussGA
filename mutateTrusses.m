function mutateTrusses(pop,numIndivid,costs,numKeep,mutationRate)
%mutateTrusses(pop,costs,numKeep)
%   mutate Trusses!! start with only mutating the verts

numVertsPerTruss = size(pop{1}.Coord, 2);
numMutations = ceil(mutationRate*numVertsPerTruss*numIndivid);
%fprintf('# vert mutations: %d\n',numMutations);
idxTrussCanMutate = sort(costs(numKeep+1:end,2));

%VERT MUTATION
offset = 5; %in.
mutateVerts(offset, idxTrussCanMutate,numMutations);


end

function mutateVerts(offset,idxTrussCanMutate,numMutations)
%[mutatedVerts] = mutateVerts(boxLen,pop,idxCanMutate,mutationRate)
%mutate vertices using local constraints on mutation
global pop boundBox;

numVerts = size(pop{1}.Coord,2);
idxVertNoMutate = cat(2,pop{1}.loaded,pop{1}.fixed);
idxVertCanMutate = setdiff(1:numVerts,idxVertNoMutate);
numVertCanMutate = size(idxVertCanMutate,2);


for i = 1:numMutations
    randTruss = randi(size(idxTrussCanMutate,1));
    idxTruss = idxTrussCanMutate(randTruss);
    randVert = randi(numVertCanMutate);
    idxVert = idxVertCanMutate(randVert);
    %fprintf('mutated truss %d\n',idxTruss);
    if(isfield(pop{idxTruss}, 'mutatedVerts'))
        %fprintf('       had mutatedVerts added idxVert:,%d\n',idxVert);
        pop{idxTruss}.mutatedVerts = cat(2,pop{idxTruss}.mutatedVerts,idxVert);
    else
        %fprintf('       new mutatedVerts added idxVert:,%d\n',idxVert);
        pop{idxTruss}.mutatedVerts = [idxVert];
    end
    
    pop{idxTruss}.Coord(:,idxVert) = randomVert(pop{idxTruss}.Coord(:,idxVert));
    
    
end

    function newVert = randomVert(initVert)
        offsets = offset*randn(3,1);
        newVert = offsets+initVert;
        if(newVert(1)<boundBox(1))
            newVert(1) = boundBox(1);
        elseif newVert(1)
        end
        %disp(newVert);
        
    end


end