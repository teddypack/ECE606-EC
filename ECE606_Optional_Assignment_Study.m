tic;
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

%Ne = Doping concentration in the emitter 
% Nb = Doping concentration in the base
% Nc = Doping concentration in the collector
% We = Total width of the emitter in the BJT/HBT
% Wb = Total width of the base in the BJT/HBT
% Wc = Total width of the collector in the BJT/HBT
% T  = Temperature in Kelvin
%**************************************************************************

%**************************Initialize Parameters***************************
ECE606_Optional_Assignment_Setup;
%
%*******************************Run Study**********************************
%
%*******************************BJT Calcs**********************************

disp(x0);
%alpha1 = beta1 / (beta1 +1);

%***********************Abrupt junction HBT Calcs**************************

%alpha2 = beta2 / (beta2 +1);
%***********************Graded junction HBT Calcs**************************

%alpha3 = beta3 / (beta3 +1);
%**************************************************************************
%
%******************************Plot Results********************************
%ECE606_Optional_Assignment_Plot('Plot Name',Structure,Fig Number);
%
%********************************End Code**********************************
toc;