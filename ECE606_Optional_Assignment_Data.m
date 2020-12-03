% This script identifies all preliminary data to be used in the main
% program for the 3 noted devices:
%   1) Si BJT
%   2) Si - abrupt junction SixGe1-x - HBT
%       - x is a specific value x0 in [0,1.0]
%   3) Si - graded junction SixGe1-x - HBT
%       - x is graded linearly from 1.0 to some value xo
%
%********************************Internal**********************************
% V = vector of voltage values used from 29.6V to 33.2V in 0.2V steps
% i = vector of measured current values from input voltage
%**************************************************************************
%
%**********************Global Material Properties**************************
Ne = 1e19; %atoms/cm^3
Nb = 1e18; %atoms/cm^3
Nc = 1e17; %atoms/cm^3
We = 1;    %um
Wb = 0.5;  %um
Wc = 1;    %um

%*************************Team Members*************************************
% Heather Hoftsee
% hhofstee@purdue.edu
% Nicholas Morrissey 
% nmorriss@purdue.edu
% Ted Packowski
% tpackows@purdue.edu
%**************************************************************************