function [ color ] = mapStressToColor(stress,stressMax,stressMin,isTot)
%[ color ] = mapStressToColor(stress,eMax,eMin)
%   make color RBG  for visualizing stress (tension, compression)
tensHue = .93333;
compresHue = .775;
greyR = .55;
if(~isnan(stress))
    if(stress>0)
        %TENSION
        sMapped = stress/stressMax;
        v = (1-greyR)*sMapped+greyR;
        hsv = [tensHue,sMapped,v];
    else
        %COMPRESSION / no stress
        sMapped = stress/stressMax;
        v = (1-greyR)*sMapped+greyR;
        hsv = [compresHue,sMapped,v];
    end
    

 
end

color = hsv2rgb(hsv);
end

% if(~isnan(i))
%     if (~exist('limit1', 'var'))
%         limit1 = -1;
%         limit2 = 1;
%     elseif (~exist('limit2', 'var'))
%         limit2 = limit1 + 1;
%     end
%     
%     if(i < limit1)
%         i = limit1;
%     elseif(i > limit2)
%         i = limit2;
%     end
%     
%     n = (i - limit1) / (limit2 - limit1);
% else
%     n = limit1;
% end
% 
% hsv = [n*(2/3) 1 1];
% % hsv2rgb bug: hsv2rgb([(1/3 + 1e-16) 1 1])
% % solution:
% hsv = round(hsv * 1000)/1000;

