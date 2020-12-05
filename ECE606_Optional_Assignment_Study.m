% This script initializes parameters, runs study and plots results for 
% ECE 606 Optional Assignment.
%**************************************************************************
%
%*************************Team Members*************************************
% Heather Hoftsee 
% hhofstee@purdue.edu 
% Nicholas Morrissey
% nmorriss@purdue.edu 
% Ted Packowski 
% tpackows@purdue.edu
%**************************************************************************
%
%********************************Internal**********************************
% beta1 = beta Gain of device 1 (BJT) 
% beta2 = beta Gain of device 2 (abrupt junction HBT) 
% beta3 = beta Gain of device 3 (graded junction HBT)
% alpha1 = alpha Gain of device 1 (BJT)
% alpha2 = alpha Gain of device 2 (abrupt junction HBT) 
% alpha3 = alpha Gain of device 3 (graded junction HBT)
% De = minority carrier diffusion coefficient in the emitter
% Dc = minority carrier diffusion coefficient in the collector
% xnbe1 = width of base-emitter base depletion region in device 1
% xnbc1 = width of base-collector depletion region in device 1
% VbiBE1 = built in potential across BE junction
% VbiBC1 =built in potential across BC junction
% W1 = electrical base width in device 1 (BJT)
%**************************************************************************
%
%*******************clear and close the workspace**************************
clear all;
close all force;
%**************************Initialize Parameters***************************
ECE606_Optional_Assignment_Setup;
%*******************************Run Study**********************************
%
%*******************************BJT Calcs**********************************
beta1 = (Dnb1*We*Ne)/(Dpe*Wb*Nb); % common emitter DC gain
alpha1 = beta1/(beta1 +1); %common base DC gain
VbiBE1 = kBT*log((Ne*Nb)/(niSi^2)); %built in potential across BE1 junction
VbiBC1 = kBT*log((Nc*Nb)/(niSi^2)); %built in potential across BC1 junction
xnbe1 = sqrt((VbiBE1*2*KSi*epsilon0*Nb)/(q*Ne*(Ne+Nb))); %width of EB1 depletion region
xnbc1 = sqrt((VbiBC1*2*KSi*epsilon0*Nb)/(q*Nc*(Nc+Nb))); %width of CB1 depletion region
W1=Wb-xnbe1-xnbc1; %electrical base width in device 1 (in um)
%
%***********************Abrupt junction HBT Calcs**************************

%*****************Minority Carrier Mobility in the Base********************
for i=1:6
    munb2(i)=7333.333*(1-x0(i))-5466.667; %for 0<x<0.3
end
for i=4:13
    munb2(i)=597*(1-x0(i))-77.6; %for x>0.3   
end
Dnb2 = kBT * munb2;  %cm^2/sec - Minority Carrier Diffusion Coefficient

%************************SiGe Alloy Band Gap*******************************
EgSiGe = 1.12-0.41*(1-x0)+0.008*(1-x0).^2;%for 0.15<x<1.0

%**********************SiGe Electron Affinity******************************
ChiSiGe = 4 + 0.05 * x0;

DeltaEv = EgSi - EgSiGe - (ChiSiGe - ChiSi);
disp(x0);
% disp(EgSi);
disp(ChiSiGe);
% disp(ChiSi);
%disp(DeltaEv);
%disp(exp(DeltaEv/kBT));
% beta2 = ((Dnb2*We*Ne)/(Dpe*Wb*Nb))*exp(DeltaEv/kBT); % common emitter DC gain
% alpha2 = beta2 / (beta2 +1); %common base DC gain
% VbiBE2 = %built in potential across BE2 junction
% VbiBC2 = %built in potential across BC2 junction
% xnbe2 = %width of EB2 depletion region
% xnbc2 = %width of CB2 depletion region
% W2 = Wb-xnbe2-xnbc2; %electrical base width in device 2 (in um)
% 
%***********************Graded junction HBT Calcs**************************
% beta3 = % common emitter DC gain
% alpha3 = beta3 / (beta3 +1); %common base DC gain
% VbiBE3 = %built in potential across BE3 junction
% VbiBC3 = %built in potential across BC3 junction
% xnbe3 = %width of EB3 depletion region
% xnbc3 = %width of CB3 depletion region
% W3 = Wb-xnbe3-xnbc3; %electrical base width in device 3 (in um)
%**************************************************************************
%
%******************************Plot Results********************************

%***************************Plot Table of info*****************************
DataTable = strings(14,4);
DataTable(1,:) = ["BJT",beta1,alpha1,W1];
for i=2:14
    DataTable(i,1)=x0(i-1);
end
%disp(DataTable);
fig = uifigure('Name','Table Results');
uit = uitable(fig,'Data',DataTable);
uit.ColumnName={'x0','βDC','αDC','Electrical Base Width'};%);
uit.ColumnWidth={64,64,64,164};
uit.Position=[10 10 398 337];

%*********************Plot Common Emitter DC Gain**************************
figure(2)
plot(beta1);
yline(beta1,'-',sprintf('BJT=%0.4f',beta1));
axis([0 1.1 0 100]);
xlabel('x0');
ylabel('Gain');
title(['Common Emitter DC Gain']);
grid on;

%***********************Plot Common Base DC Gain***************************
figure(3)
plot(alpha1);
yline(alpha1,'-',sprintf('BJT=%0.4f',alpha1));
axis([0 1.1 0 1.1]);
xlabel('x0');
ylabel('Gain');
title(['Common Base DC Gain']);
grid on;

%***********************Plot Electrical Base Width*************************
figure(4)
plot(W1);
yline(W1,'-',sprintf('BJT=%0.4f',W1));
axis([0 1.1 0 1.1]);
xlabel('x0');
ylabel('Width (µm)');
title(['Electrical Base Width']);
grid on;
%********************************End Code**********************************