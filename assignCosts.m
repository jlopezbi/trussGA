function [costs,currMinFit,avgCost ] = assignCosts(uMult)
%[costs,currMinFIt ] = assignCosts(pop)
%run deflection tests
%calculate weight
%input:
%   pop = cell array of truss structs (genes)
%   numIndivid = number of individuals
%output:
%   costs = [numIndivid x 2] array, first col is the cost, second is the
%           index of that individual
%   currMinFit = lowest cost in the population (!) 
%   avgCost = average cost for the population

global pop numIndivid density;

%SUBJECT TRUSSES TO LOADS
%analyizeTrusses(); %updates/adds .F .U .R data to each genome(truss)

%CALCULATE DEFLECTION MATRIX
uScores = findMaxDeflection(uMult);

%CALCULATE MASS MATRIX
mScores = calcMass();

%COMBINE SCORES
costs = NaN(numIndivid,2);
costs(:,1) = uScores(:,1)+mScores(:,1);
costs(:,2) = 1:numIndivid;
costs = sortrows(costs);
currMinFit = costs(1,1);
avgCost = mean(costs(:,1));


end

function [uScores] = findMaxDeflection(uMult)
% [uScores] = calcDeflection(pop)
%output max Z deflection^2
%%% later try max deflection of specific point(s?)
%input:
%   pop = cell array of truss structs
%   numIndivid = number of trusses
%output:
%   uScores = [numIdivid x 2], first column is the maximum displacement,
%               second column is the index of that individual
%               NaN if no U scores matrix is available (is NaN)

global pop numIndivid;

uScores = NaN(numIndivid,1);
for i = 1:numIndivid
    %maximum abosulte val z deflection for a given truss
    U = pop{i}.U;
    if(size(U,1)==3)
        maxU = max(abs(U(3,:)));
        uScores(i,1) = maxU*uMult;
    end
end

end

function [massScores] = calcMass()
% [uScores] = calcDeflection(pop)
%creates deflection scores matrix for a generation.  uses max Z deflection
%%% later try max deflection of specific point(s?)
%input:
%   pop = cell array of truss structs
%   numIndivid = number of trusses
%output:
%   uScores = [numIdivid x 2], first column is the maximum displacement,
%               second column is the index of that individual
%               NaN if no U scores matrix is available (is NaN)

global pop numIndivid density;

massScores = NaN(numIndivid,1);
for i = 1:numIndivid
    hasA = isfield(pop{i}, 'A');
    hasCon = isfield(pop{i}, 'Con');
    hasCoord = isfield(pop{i}, 'Coord');
    
    if(hasA && hasCon && hasCoord)
    areas = pop{i}.A';
    edges = pop{i}.Con; % 2 x nEdges
    verts = pop{i}.Coord;
    
    p1 = verts(:,edges(1,:));
    p2 = verts(:,edges(2,:));
    
    
    dists = distanc(p1,p2);
   
%     fprintf('distances\n');
%     disp(dists);
%     fprintf('areas\n');
%     disp(areas);
    
    volume = sum(areas.*dists);
    mass = density*volume;
%     fprintf('mass for %d\n',i);
%     disp(mass);
    massScores(i) = mass;
    else
    massScores(i) = NaN;
    end
    
end

end



function d = distanc(p1,p2)
% Eucliden distance between points
% rows: different points
% columns: value of each dimension
%
%
% MatSprings: Matlab 3D spring truss simulator
%
% Copyright (C) 2008 Daniel Lobo (dlobo@geb.uma.es)
%
%    This file is part of MatSprings.
%
%    MatSprings is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    MatSprings is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%	 along with MatSprings.  If not, see <http://www.gnu.org/licenses/>

d = sqrt(sum((p1 - p2).^2, 1));
end


