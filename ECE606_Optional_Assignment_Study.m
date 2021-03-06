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
% xnbe1 = width of base-emitter base depletion region in device 1
% xnbc1 = width of base-collector depletion region in device 1
% xnbe2 = width of base-emitter base depletion region in device 2
% xnbc2 = width of base-collector depletion region in device 2
% xnbe3 = width of base-emitter base depletion region in device 3
% xnbc3 = width of base-collector depletion region in device 3
% VbiBE1 = built in potential across BE junction in device 1
% VbiBC1 =built in potential across BC junction in device 1
% VbiBE2 = built in potential across BE junction in device 2
% VbiBC2 =built in potential across BC junction in device 2
% VbiBE3 = built in potential across BE junction in device 3
% VbiBC3 =built in potential across BC junction in device 3
% W1 = electrical base width in device 1
% W2 = electrical base width in device 2
% W3 = electrical base width in device 3
% munb2 = minority carrier mobility in the base of device 2
% Dnb2 = minority carrier diffusion coefficient in the base of device 2
% EgSiGe = band gap of Silicon Germanium Alloy
% ChiSiGe = electron affinity of Silicon Germanium alloy
% DeltaEv = Valence band discontinuity in SiGe Alloy
% NCSiGe = Conduction Band Density of states in SiGe Alloy
% NVSiGe = Valence Band Density of states in SiGe Alloy
% KSiGe = SiGe Alloy Dielectric constant
% nib3 = intrinsic carrier concentration in SiGe Alloy
% DataTable = String array of information to be plotted in data table
% fig = figure for user interface figure
% uit = user interface table plotted inside uifigure
%**************************************************************************
%
%*******************clear and close the workspace**************************
clear all;
close all force;
%**************************Initialize Parameters***************************
ECE606_Optional_Assignment_Setup;
%*******************************Run Study**********************************
%
%▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓BJT Calcs▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
%%
%***********************βDC & αDC calculations*****************************
beta1 = (Dnb1*We*Ne)/(Dpe*Wb*Nb); % common emitter DC gain
alpha1 = beta1/(beta1 +1); %common base DC gain

%********************Built in Potential calculations***********************
VbiBE1 = kBT*log((Ne*Nb)/(niSi^2)); %built in potential across BE1 junction
VbiBC1 = kBT*log((Nc*Nb)/(niSi^2)); %built in potential across BC1 junction

%************************Depletion Region Widths***************************
xnbe1 = sqrt((VbiBE1*2*KSi*epsilon0*Nb)/(q*Ne*(Ne+Nb))); %width of EB1 depletion region
xnbc1 = sqrt((VbiBC1*2*KSi*epsilon0*Nb)/(q*Nc*(Nc+Nb))); %width of CB1 depletion region

%*******************Electrical Base Width Calculation**********************
W1=Wb-(xnbe1*1e4)-(xnbc1*1e4); %electrical base width in device 1 (in um)
%
%▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓Abrupt junction HBT Calcs▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
%%
%*****************Minority Carrier Mobility in the Base********************
for i=1:6
    munb2(i)=7333.333*(1-x0(i))-5466.667; %for 0<x<0.3
end
for i=4:13
    munb2(i)=597*(1-x0(i))-77.6; %for x>0.3   
end

%****************Minority Carrier Diffusion Coefficient********************
Dnb2 = kBT * munb2;  %cm^2/sec - Minority Carrier Diffusion Coefficient

%************************SiGe Alloy Band Gap*******************************
%EgSiGe = 1.12-0.41*(1-x0)+0.008*(1-x0).^2;%for 0.15<x<1.0
for i=1:3
  EgSiGe(i)=5.88-(9.58.*(1-x0(i)))+(4.43.*(1-x0(i)).^2);  %Valid when xo_ge>0.85
end
for i=4:13
  EgSiGe(i)=1.17-(0.47.*(1-x0(i)))+(0.24.*(1-x0(i)).^2);  %Valid when xo_ge<0.85
end

%**********************SiGe Electron Affinity******************************
ChiSiGe = 4 + 0.05 * x0;

%*****************SiGe Valence Band Discontinuity**************************
DeltaEv = (EgSi - EgSiGe) + (ChiSiGe - ChiSi);

%***********************βDC & αDC calculations*****************************
beta2 = ((Dnb2*We*Ne)/(Dpe*Wb*Nb)).*exp(DeltaEv/kBT); % common emitter DC gain
alpha2 = beta2 ./ (beta2 +1); %common base DC gain

%*****************SiGe Conduction Band Density of States*******************
for i=1:2
    NCSiGe(i) = (5.3e15*T^1.5);    
end
for i=3:13
    NCSiGe(i) = (2e15*T^1.5);
end

%******************SiGe Valence Band Density of States*********************
NVSiGe = (4.82e15*4*(0.81-0.47*(1-x0))*T^1.5);

%********************Built in Potential calculations***********************
VbiBE2 = kBT*log((Ne*Nb)./(NVSiGe*NCSi))+EgSiGe+ChiSiGe-ChiSi;%built in potential across BE2 junction
VbiBC2 = kBT*log((Nc*Nb)./(NVSiGe*NCSi))+EgSiGe+ChiSiGe-ChiSi;%built in potential across BC2 junction

%***********************SiGe Dielectric Constant***************************
KSiGe = 16.2 - 4.5*x0;

%************************Depletion Region Widths***************************
xnbe2 = sqrt((VbiBE2*2*KSi.*KSiGe*epsilon0*Nb)./(q*Ne*(Ne*KSi+Nb.*KSiGe))); %width of EB2 depletion region
xnbc2 = sqrt((VbiBC2*2*KSi.*KSiGe*epsilon0*Nb)./(q*Nc*(Nc*KSi+Nb.*KSiGe))); %width of CB2 depletion region

%*******************Electrical Base Width Calculation**********************
W2 = Wb-(xnbe2*1e4)-(xnbc2*1e4); %electrical base width in device 2 (in um)

%▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓Graded junction HBT Calcs▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
%%
%*********Alloy Intrinsic Carrier Concentration Calculations***************
nib3 = sqrt(NCSiGe.*NVSiGe).*exp(-EgSiGe/(2*kBT));

%***********************βDC & αDC calculations*****************************
beta3 = (((nib3.^2).*Dnb2)*We*Ne)/(Dpe*Wb*Nb*niSi^2); % common emitter DC gain
alpha3 = beta3 ./ (beta3 +1); %common base DC gain

%********************Built in Potential calculations***********************
VbiBE3 = kBT*log((Ne*Nb)./(NVSiGe*NCSi))+EgSiGe+ChiSiGe-ChiSi;%built in potential across BE3 junction
VbiBC3 = kBT*log((Nc*Nb)./(NVSiGe*NCSi))+EgSiGe+ChiSiGe-ChiSi;%built in potential across BC3 junction

%************************Depletion Region Widths***************************
xnbe3 = sqrt((VbiBE3*2*KSi.*KSiGe*epsilon0*Nb)./(q*Ne*(Ne*KSi+Nb.*KSiGe))); %width of EB3 depletion region
xnbc3 = sqrt((VbiBC3*2*KSi.*KSiGe*epsilon0*Nb)./(q*Nc*(Nc*KSi+Nb.*KSiGe))); %width of CB2 depletion region

%*******************Electrical Base Width Calculation**********************
W3 = Wb-(xnbe3*1e4)-(xnbc3*1e4); %electrical base width in device 3 (in um)

%▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓Plot Results▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
%%
%******************************Plot Data Table ****************************
DataTable = strings(29,4);
DataTable(1,:) = ["BJT",beta1,alpha1,W1];
DataTable(2,:) = ["=====","Device 2","=====","=========="];
DataTable(16,:) = ["=====","Device 3","=====","=========="];
for i=3:15
    DataTable(i,1)=x0(i-2);
    DataTable(i,2)=sprintf('%1.5g',beta2(i-2));
    DataTable(i,3)=sprintf('%1.5g',alpha2(i-2));
    DataTable(i,4)=sprintf('%1.5g',W2(i-2));
    DataTable(i+14,1)=x0(i-2);
    DataTable(i+14,2)=sprintf('%1.5g',beta3(i-2));
    DataTable(i+14,3)=sprintf('%1.5g',alpha3(i-2));
    DataTable(i+14,4)=sprintf('%1.5g',W3(i-2));
end
fig = uifigure;
fig.Name = 'Table of Results';
fig.Position = [500 300 478 677 ];
uit = uitable(fig,'Data',DataTable);
uit.ColumnName={'x0 (%Si)','βDC','αDC','Electrical Base Width (µm)'};%);
uit.ColumnWidth={64,114,64,184};
uit.Position = [5 5 468 667];

%*********************Plot Common Emitter DC Gain**************************
figure(2)
semilogy(x0, beta1*ones(13,1), x0, beta2, x0, beta3);
ylim([10^1 2*10^8]);
xlim([0.05 0.65])
xlabel('x0');
ylabel('Gain');
title(['Common Emitter DC Gain (βDC)']);
legend('BJT','Abrupt HBT','Graded HBT','Location','northeast')
grid on;

%***********************Plot Common Base DC Gain***************************
figure(3)
plot(x0, alpha1*ones(13,1), x0, alpha2, x0, alpha3);
%yline(alpha1,'-',sprintf('BJT=%0.4f',alpha1));
axis([0.05 0.65 0.985 1.005]);
xlabel('x0');
ylabel('Gain');
title(['Common Base DC Gain (αDC)']);
legend('BJT','Abrupt HBT','Graded HBT','Location','northeast')
grid on;

%***********************Plot Electrical Base Width*************************
figure(4)
plot(x0, W1*ones(13,1), x0, W2, x0, W3);
axis([0.05 0.65 0.39 0.425]);
xlabel('x0');
ylabel('Width (µm)');
title(['Electrical Base Width']);
legend('BJT','Abrupt HBT','Graded HBT','Location','northeast');
grid on;

%********************************End Code**********************************