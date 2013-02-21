function [c] = linearRGB(i, limit1, limit2)
%

% MatSprings: Matlab 3D spring truss simulator
%
% Copyright (C) 2008 Daniel Lobo (dlobo@geb.uma.es)

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


if(~isnan(i))
    if (~exist('limit1', 'var'))
        limit1 = 0;
        limit2 = 1;
    elseif (~exist('limit2', 'var'))
        limit2 = limit1 + 1;
    end
    
    if(i < limit1)
        i = limit1;
    elseif(i > limit2)
        i = limit2;
    end
    
    n = (i - limit1) / (limit2 - limit1);
else
    n = limit1;
end

hsv = [n*(2/3) 1 1];
% hsv2rgb bug: hsv2rgb([(1/3 + 1e-16) 1 1])
% solution:
hsv = round(hsv * 1000)/1000;

c = hsv2rgb(hsv);
