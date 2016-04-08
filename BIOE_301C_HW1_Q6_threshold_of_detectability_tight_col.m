% BIOE 301C HW1

clc
close all

%% Question 6

figure
imshow(averaged_5_3_highDoseTightCol,[])
title('High Dose Image of Low Contrast with Tight Collimator');

% Now, I will account for the six contrast agents, and will do this for
% each contrast sphere over all images. I will assume that the background
% (roi outside) contrast remains the same.
roi_inside=cell(6,6);
I_ave_inside=zeros(6,6);
roi_outside=cell(6,1);
I_ave_outside=zeros(6,1);
SD_outside=zeros(6,1);
I_ave=zeros(6,6);
C=zeros(6,6);
CNR=zeros(6,6);

% roi_i=averaged_5_3_highDoseLargeCol(380:400,740:760);
% roi_inside{1,1}=roi_i;
% I_ave_inside(1,1)=mean2(roi_i);
% 
% roi_o=averaged_5_3_highDoseLargeCol(300:310,750:760);
% roi_outside{1,1}=roi_o;
% I_ave_outside(1,1)=mean2(roi_o);
% SD_outside(1,1)=std2(roi_o);
% 
% I_ave(1,1)=mean([I_ave_inside(1,1) I_ave_outside(1,1)]);
% C(1,1)=abs(I_ave_inside(1,1)-I_ave_outside(1,1))/I_ave(1,1);
% CNR(1,1)=C(1,1)/(SD_outside(1,1)/I_ave(1,1));

LowerDoseImagesTight=cell(6,1);
LowerDoseImagesTight{1}=averaged_5_3_highDoseTightCol;
LowerDoseImagesTight{2}=image_5_3_TightCol05mA;
LowerDoseImagesTight{3}=image_5_3_TightCol10mA;
LowerDoseImagesTight{4}=image_5_3_TightCol20mA; 
LowerDoseImagesTight{5}=image_5_3_TightCol40mA; 
LowerDoseImagesTight{6}=image_5_3_TightCol80mA;

roi_i=cell(6,1);

% Do this for all of the dose settings;
for i=1:6
    for k=1:6
        matrix=LowerDoseImagesTight{i};
        roi_i{1}=matrix(385:400,245:265);
        roi_i{2}=matrix(385:400,325:345);
        roi_i{3}=matrix(385:405,425:445);
        roi_i{4}=matrix(385:405,530:550);
        roi_i{5}=matrix(380:400,630:650);
        roi_i{6}=matrix(380:400,740:760);
        
        I_ave_inside(i,k)=mean2(roi_i{k});
        roi_o=matrix(300:310,750:760);
        roi_outside{i,1}=roi_o;
        I_ave_outside(i,1)=mean2(roi_o);
        SD_outside(i,1)=std2(roi_o);

        I_ave(i,k)=mean([I_ave_inside(i,k) I_ave_outside(i,1)]);
        C(i,k)=abs(I_ave_inside(i,k)-I_ave_outside(i,1))/I_ave(i,k);
        CNR(i,k)=C(i,k)/(SD_outside(i,1)/I_ave(i,k));
    end
end

ln_CNR=log(CNR);
mA=[05,10,20,40,60];
ln_mA=log(mA);

figure
plot(ln_mA,ln_CNR(2:6,2)); % plotting for 10mA (hence the second column)

% % Testing the inside roi, to see where it maps to
% figure 
% test1=LowerDoseImagesLarge{1};
% test1(385:405,245:265)=800;
% imshow(test1,[])