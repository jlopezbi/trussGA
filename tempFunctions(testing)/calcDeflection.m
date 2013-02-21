function [uScores] = calcDeflection(pop,numIndivid)
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

uScores = NaN(numIndivid,2);
for i = 1:numIndivid
    %maximum abosulte val z deflection for a given truss
    U = pop{i}.U;
    if(size(U,1)==3)
        maxU = max(abs(U(3,:)));
        uScores(i,:) = [maxU,i];
    end
end

end
