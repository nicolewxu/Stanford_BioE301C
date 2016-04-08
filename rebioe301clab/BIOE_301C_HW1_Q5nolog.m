% BIOE 301C Lab 1 Question 5
% No log

clc
close all

D=averaged_DarkField;
F=averaged_FlatField;
Lstep=averaged_StepWedge;

LstepCorr=(Lstep-D)./(F-D);
figure
image(LstepCorr,'CDataMapping','scaled')
title('Corrected Step Image')

% On the last figure that pops up, click once, drag the cursor along the 
% image and over your line of interest, then double click to end. A new 
% figure with the line profile will appear.
improfile
title('Step Profile: No log')