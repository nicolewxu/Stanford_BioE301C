% BIOE 301C HW1

clc
close all

%% Question 6

figure
imshow(averaged_5_3_highDoseLargeCol,[])
title('High Dose Image of Low Contrast');

roi_inside=cell(6,1);
I_ave_inside=zeros(6,1);
roi_outside=cell(6,1);
I_ave_outside=zeros(6,1);
SD_outside=zeros(6,1);
I_ave=zeros(6,1);
C=zeros(6,1);
CNR=zeros(6,1);

roi_i=averaged_5_3_highDoseLargeCol(380:400,740:760);
roi_inside{1,1}=roi_i;
I_ave_inside(1,1)=mean2(roi_i);

roi_o=averaged_5_3_highDoseLargeCol(300:310,750:760);
roi_outside{1,1}=roi_o;
I_ave_outside(1,1)=mean2(roi_o);
SD_outside(1,1)=std2(roi_o);

I_ave(1,1)=mean([I_ave_inside(1,1) I_ave_outside(1,1)]);
C(1,1)=abs(I_ave_inside(1,1)-I_ave_outside(1,1))/I_ave(1,1);
CNR(1,1)=C(1,1)/(SD_outside(1,1)/I_ave(1,1));

LowerDoseImagesLarge=cell(5,1);
LowerDoseImagesLarge{1}=image_5_3_LargeCol05mA;
LowerDoseImagesLarge{2}=image_5_3_LargeCol10mA;
LowerDoseImagesLarge{3}=image_5_3_LargeCol20mA; 
LowerDoseImagesLarge{4}=image_5_3_LargeCol40mA; 
LowerDoseImagesLarge{5}=image_5_3_LargeCol80mA;

% Do this for all of the dose settings;
for i=2:6
    matrix=LowerDoseImagesLarge{i-1};
    roi_i=matrix(380:400,740:760);
    roi_inside{i,1}=roi_i;
    I_ave_inside(i,1)=mean2(roi_i);
    roi_o=matrix(300:310,750:760);
    roi_outside{i,1}=roi_o;
    I_ave_outside(i,1)=mean2(roi_o);
    SD_outside(i,1)=std2(roi_o);
    
    I_ave(i,1)=mean([I_ave_inside(i,1) I_ave_outside(i,1)]);
    C(i,1)=abs(I_ave_inside(i,1)-I_ave_outside(i,1))/I_ave(i,1);
    CNR(i,1)=C(i,1)/(SD_outside(i,1)/I_ave(i,1));
    
end

ln_CNR=log(CNR(2:6));
mA=[05,10,20,40,60];
ln_mA=log(mA);

figure
plot(ln_mA,ln_CNR);

%% Testing the inside roi, to see where it maps to
% figure 
% test1=LowerDoseImagesLarge{1};
% test1(380:400,740:760)=800;
% imshow(test1,[])

%% Do the same for the narrow beam exposure

figure
imshow(averaged_5_3_highDoseTightCol,[])
title('High Dose Image of Low Contrast');

roi_inside=cell(6,1);
I_ave_inside=zeros(6,1);
roi_outside=cell(6,1);
I_ave_outside=zeros(6,1);
SD_outside=zeros(6,1);
I_ave=zeros(6,1);
C=zeros(6,1);
CNR=zeros(6,1);

roi_i=averaged_5_3_highDoseTightCol(380:400,740:760);
roi_inside{1,1}=roi_i;
I_ave_inside(1,1)=mean2(roi_i);

roi_o=averaged_5_3_highDoseTightCol(300:310,750:760);
roi_outside{1,1}=roi_o;
I_ave_outside(1,1)=mean2(roi_o);
SD_outside(1,1)=std2(roi_o);

I_ave(1,1)=mean([I_ave_inside(1,1) I_ave_outside(1,1)]);
C(1,1)=abs(I_ave_inside(1,1)-I_ave_outside(1,1))/I_ave(1,1);
CNR(1,1)=C(1,1)/(SD_outside(1,1)/I_ave(1,1));

LowerDoseImagesTight=cell(5,1);
LowerDoseImagesTight{1}=image_5_3_TightCol05mA;
LowerDoseImagesTight{2}=image_5_3_TightCol10mA;
LowerDoseImagesTight{3}=image_5_3_TightCol20mA; 
LowerDoseImagesTight{4}=image_5_3_TightCol40mA; 
LowerDoseImagesTight{5}=image_5_3_TightCol80mA;

% Do this for all of the dose settings;
for i=2:6
    matrix=LowerDoseImagesTight{i-1};
    roi_i=matrix(380:400,740:760);
    roi_inside{i,1}=roi_i;
    I_ave_inside(i,1)=mean2(roi_i);
    roi_o=matrix(300:310,750:760);
    roi_outside{i,1}=roi_o;
    I_ave_outside(i,1)=mean2(roi_o);
    SD_outside(i,1)=std2(roi_o);
    
    I_ave(i,1)=mean([I_ave_inside(i,1) I_ave_outside(i,1)]);
    C(i,1)=abs(I_ave_inside(i,1)-I_ave_outside(i,1))/I_ave(i,1);
    CNR(i,1)=C(i,1)/(SD_outside(i,1)/I_ave(i,1));
    
end

ln_CNR=log(CNR(2:6));
mA=[05,10,20,40,60];
ln_mA=log(mA);

figure
plot(ln_mA,ln_CNR);
    