%intensity as fnc of kV and mA

%kV = [60 80 100 120 100 100 100 100 60 80 100 120 100 100 100 100];
%mA = [100 100 100 100 25 80 160 250 100 100 100 100 25 80 160 250];
%exposure_time = 500 * ones(1,size(kV,2));   %ms
%acrylic_thickness = [zeros(1,size(kV,2)/2) 11*ones(1,size(kV,2)/2)];    %cm
%dose = [0.995 1.950 3.150 4.460 0.788 2.51 4.923 7.622 0.032 0.090 0.172 ...
%    0.278 0.042 0.134 0.267 0.415]; %mGy

%dose vs mA
mA = [25 80 100 160 250];
dose = [0.788 2.51 3.15 4.923 7.622];
dose_acrylic = [0.042 0.134 0.172 0.267 0.415];

R = corrcoef(mA,dose);
R_sq = R(2)^2;

R_acrylic = corrcoef(mA,dose_acrylic);
R_sq_acrylic = R_acrylic(2)^2;

figure(1)
plot(mA,dose,'ro-',mA,dose_acrylic,'bo-')
title('Current vs. Dose')
xlabel('Current (mA)')
ylabel('Dose (mGy)')
legend('No Acrylic','Acrylic (11 cm)')

%dose vs kV

kV = [60 80 100 120];
dose = [0.995 1.950 3.150 4.460];
dose_acrylic = [0.032 0.090 0.172 0.278];

R = corrcoef(kV,dose);
R_sq = R(2)^2;

R_acrylic = corrcoef(kV,dose_acrylic);
R_sq_acrylic = R_acrylic(2)^2;

figure(2)
plot(kV,dose,'ro-',kV,dose_acrylic,'bo-')
title('Voltage (kV) vs. Dose')
xlabel('Voltage (kV)')
ylabel('Dose (mGy)')
legend('No Acrylic','Acrylic (11 cm)')

%ln(dose) vs ln(kV)

figure(3)
plot(log(kV),log(dose),'ro-',log(kV),log(dose_acrylic),'bo-')
title('Ln of Voltage (kV) vs. Ln of Dose')
xlabel('Ln of Voltage (kV)')
ylabel('Ln of Dose (mGy)')
legend('No Acrylic','Acrylic (11 cm)')

%measurements of n with and without absorber

%attenuation of plastic and copper

acrylic_sheets = [0 2 6 8 10];
acrylic_thickness = [0 2.2 6.6 8.8 11.0];   %mm
dose_60kV = [1.008 0.500 0.137 0.077 0.042];    %mGy
dose_120kV_filter = [2.544 1.527 0.590 0.365 0.241];    %mGy

figure(4)
plot(acrylic_thickness,log(dose_60kV),'ro-',acrylic_thickness,log(dose_120kV_filter),'bo-')
title('Ln of Dose vs Acrylic Thickness')
xlabel('Thickness (mm)')
ylabel('Ln of Dose (mGy)')
legend('60 kV','120 kV')

copper_sheets = [1 2 3 5 7];
copper_thickness = [0 0.1 0.3 0.5 0.7]; %mm
dose_60kV = [1.008 0.522 0.214 0.106 0.065]; %mGy
dose_120kV_filter = [2.544 2.089 1.519 1.168 0.927];    %mGy

figure(5)
plot(copper_thickness,log(dose_60kV),'ro-',copper_thickness,log(dose_120kV_filter),'bo-')
title('Ln of Dose vs Copper Thickness')
xlabel('Thickness (mm)')
ylabel('Ln of Dose (mGy)')
legend('60 kV','120 kV')

%scatter

field_size = [5.1*5 10*10.2 15*15];   %in
dose_noacrylic = [3.025 3.426 3.505]; %mGy
dose_6sheets = [0.600 0.795 0.945]; %mGy
dose_12sheets = [0.124 0.233 NaN];    %mGy, last value NaN bc broken

figure(5)
plot(field_size,dose_noacrylic,'ro-',field_size,dose_6sheets,'bo-',...
    field_size,dose_12sheets,'ko-')
title('Dose vs Field Size')
xlabel('Field Size (sq in)')
ylabel('Dose (mGy)')
legend('No Acrylic','6 Sheets of Acrylic (6.6 mm)', '12 Sheets of Acrylic (13.2 mm)')

P = [3.1 0.58 0.088];   %mGy, calculated from best fit lines
S_no = dose_noacrylic - P;
S_6 = dose_6sheets - P;
S_12 = dose_12sheets - P;
StoP_no = S_no./P;
StoP_6 = S_6./P;
StoP_12 = S_12./P;
names = {'No Acrylic','6 Sheets of Acrylic','12 Sheets of Acrylic'};
T = table(S_no,S_6,S_12StoP_no,StoP_6,StoP_12);