
function updateTrusses()
%analyizeTrusses(trusses,E)
%analyize a bunch of trusses using direct stiffness method
%input:
%   trusses = cell array column vector of truss structs
%output:
%   trusses = modified trusses with .F, .U and .R fields (overwrites)

global pop numIndivid;
for i = 1:numIndivid
    %truss = trusses{i};
    [F, U, R] = analyizeTruss(pop{i});
    pop{i}.F = F; %forces along members
    pop{i}.U = U; %displacements
    pop{i}.R = R; %reaction force vectors
end

end



