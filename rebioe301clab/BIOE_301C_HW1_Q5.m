% BIOE 301C Lab 1 Question 5
% Negative Log

clc
close all

D=averaged_DarkField;
F=averaged_FlatField;
Lstep=averaged_StepWedge;

% Corrected step image with negative log applied
LogLstep=-log(Lstep);
figure
image(LogLstep,'CDataMapping','scaled')
title('Negative Log of Corrected Step Image');

% On the last figure that pops up, click once, drag the cursor along the 
% image and over your line of interest, then double click to end. A new 
% figure with the line profile will appear.
improfile
title('Step Profile: Log');
%axis([0 1020 -8.2 -6.2]);