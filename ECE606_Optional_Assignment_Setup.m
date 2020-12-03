%**************************************************************************
% This script sets parameters and performs intial calculations for the 3 
% noted devices:
%   1) Si BJT
%   2) Si - abrupt junction SixGe1-x - HBT
%       - x is a specific value x0 in [0,1.0]
%   3) Si - graded junction SixGe1-x - HBT
%       - x is graded linearly from 1.0 to some value xo
%
% Emitter and Collector remain Si for the HTB devices
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
%******************************Sources*************************************
% Equations
% https://www.eit.lth.se/fileadmin/eit/courses/fff115/Lectures/F5.pdf
% Material Properties
% http://www.ioffe.ru/SVA/NSM/Semicond/SiGe/
% http://www.ioffe.ru/SVA/NSM/Semicond/SiGe/bandstr.html#carrier%20concentration 
% http://www.virginiasemi.com/pdf/generalproperties%20Si62002.DOC
%**************************************************************************
%
%********************************Internal**********************************
% Ne = Doping concentration in the emitter 
% Nb = Doping concentration in the base
% Nc = Doping concentration in the collector
% We = Total width of the emitter in the BJT/HBT
% Wb = Total width of the base in the BJT/HBT
% Wc = Total width of the collector in the BJT/HBT
% T  = Temperature in Kelvin
%**************************************************************************
%
%**********************Global Material Properties**************************
Ne = 1e19; %atoms/cm^3
Nb = 1e18; %atoms/cm^3
Nc = 1e17; %atoms/cm^3
We = 1;    %um
Wb = 0.5;  %um
Wc = 1;    %um
T = 300;   %temperature in Kelvin
%**************************************************************************
%
%**********************Device 1 Material Properties************************

%intrinsic carrier concentration
ni1= ; %intrinsics carrier concentration in device 1
%mobility
%diffusion coefficient
%dielectric constants
%electron affinity
%valence band offsets

%**************************************************************************
%
%**********************Device 2 Material Properties************************

%intrinsic carrier concentration
%mobility
%diffusion coefficient
%dielectric constants
%electron affinity
%valence band offsets

%**************************************************************************
%
%**********************Device 3 Material Properties************************

%intrinsic carrier concentration
%mobility
%diffusion coefficient
%dielectric constants
%electron affinity
%valence band offsets
%
%********************************End Code**********************************