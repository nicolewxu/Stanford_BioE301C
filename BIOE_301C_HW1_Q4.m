% BIOE 301C HW1 Question 4

clc
close all

%% Question 4: Image Correction

D=averaged_DarkField;
F=averaged_FlatField;
Lobj=averaged_object;

figure
imshow(averaged_object,[])
title('Object: No Correction')

LobjCorr=(Lobj-D)./(F-D);
figure
imshow(LobjCorr,[])
title('Object: Corrected');