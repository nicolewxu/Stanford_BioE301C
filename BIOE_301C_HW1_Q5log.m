% BIOE 301C Lab 1 Question 5
% Negative Log

% Negative log applied
LogLstep=-log(averaged_StepWedge);
figure(3)
imshow(LogLstep,[])
title('Negative Log of Corrected Step Image');

% On the last figure that pops up, click once, drag the cursor along the 
% image and over your line of interest, then double click to end. A new 
% figure with the line profile will appear.
improfile
title('Step Profile: Log');
ylabel('Color Intensity');
%axis([0 1020 -8.2 -6.2]);