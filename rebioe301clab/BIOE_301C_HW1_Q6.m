% BIOE 301C HW1

clc
close all

%% Question 6

D=averaged_DarkField;
F=averaged_FlatField;
Lhdlarge=averaged_5_3_highDoseLargeCol;

LhdlargeCorr=(Lhdlarge-D)./(F-D);
figure
image(LhdlargeCorr,'CDataMapping','scaled')
title('High Dose Image of Low Contrast');

% Trying to take the log of the image to see if this helps me distinguish
% contrast
LogLhdlargeCorr=-log(LhdlargeCorr);

% Getting rid of complex numbers that came up after taking the negative log
for i=1:768
    for j=1:1024
        tf=isreal(LogLhdlargeCorr(i,j));
        if tf==1;
            LogLhdlargeCorr(i,j)=LogLhdlargeCorr(i,j);
        else LogLhdlargeCorr(i,j)=NaN;
        end
    end
end
            
figure
image(LogLhdlargeCorr,'CDataMapping','scaled')
title('High Dose Image of Low Contrast: Negative log applied');
