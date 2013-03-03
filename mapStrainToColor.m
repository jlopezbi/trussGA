function [ color ] = mapStrainToColor(strain,stressMax,stressMin)
%[ color ] = mapStressToColor(stress,eMax,eMin)
%   make color RBG  for visualizing stress (tension, compression)
tensHue = .0005;
compresHue = .3111;
greyR = .33;
if(~isnan(strain))
    if(strain>0)
        %TENSION
        sMapped = strain/stressMax;
        v = (1-greyR)*sMapped+greyR;
        hsv = [tensHue,sMapped,v];
    else
        %COMPRESSION / no stress
        sMapped = strain/stressMin;
        v = (1-greyR)*sMapped+greyR;
        hsv = [compresHue,sMapped,v];
    end
end
color = hsv2rgb(hsv);



