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


d = sqrt(sum((p1 - p2).^2, 2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%