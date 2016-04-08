% BIOE 301C HW1 Question 4

clc
close all

%% Question 4: Image Correction

D=averaged_DarkField;
F=averaged_FlatField;
Lobj=averaged_object;
Lstep=averaged_StepWedge; % Section 5.2
Lhdlarge=averaged_5_3_highDoseLargeCol; % Section 5.3
Llarge05=image_5_3_LargeCol05mA;
Llarge10=image_5_3_LargeCol10mA;
Llarge20=image_5_3_LargeCol20mA;
Llarge40=image_5_3_LargeCol40mA;
Llarge80=image_5_3_LargeCol80mA;
Lhdsmall=averaged_5_3_highDoseTightCol;
Lsmall05=image_5_3_TightCol05mA;
Lsmall10=image_5_3_TightCol10mA;
Lsmall20=image_5_3_TightCol20mA;
Lsmall40=image_5_3_TightCol40mA;
Lsmall80=image_5_3_TightCol80mA;
Lline=averaged_LinePairPhantom; % Section 5.4

figure
image(averaged_object,'CDataMapping','scaled')
title('Object: No Correction')

LobjCorr=(Lobj-D)./(F-D);
figure
image(LobjCorr,'CDataMapping','scaled')
title('Object: Corrected');

%% Correcting the rest of the images

LhdlargeCorr=(Lhdlarge-D)./(F-D);
% figure
% image(LhdlargeCorr,'CDataMapping','scaled')

Llarge05Corr=(Llarge05-D)./(F-D);
%figure
%image(Llarge05Corr,'CDataMapping','scaled')

Llarge10Corr=(Llarge10-D)./(F-D);
%figure
%image(Llarge10Corr,'CDataMapping','scaled')

Llarge20Corr=(Llarge20-D)./(F-D);
%figure
%image(Llarge20Corr,'CDataMapping','scaled')

Llarge40Corr=(Llarge40-D)./(F-D);
%figure
%image(Llarge40Corr,'CDataMapping','scaled')

Llarge80Corr=(Llarge80-D)./(F-D);
%figure
%image(Llarge80Corr,'CDataMapping','scaled')

LhdsmallCorr=(Lhdsmall-D)./(F-D);
%figure
%image(LhdsmallCorr,'CDataMapping','scaled')

Lsmall05Corr=(Lsmall05-D)./(F-D);
%figure
%image(Lsmall05Corr,'CDataMapping','scaled')

Lsmall10Corr=(Lsmall10-D)./(F-D);
%figure
%image(Lsmall10Corr,'CDataMapping','scaled')

Lsmall20Corr=(Lsmall20-D)./(F-D);
%figure
%image(Lsmall20Corr,'CDataMapping','scaled')

Lsmall40Corr=(Lsmall40-D)./(F-D);
%figure
%image(Lsmall40Corr,'CDataMapping','scaled')

Lsmall80Corr=(Lsmall80-D)./(F-D);
%figure
%image(Lsmall80Corr,'CDataMapping','scaled')


