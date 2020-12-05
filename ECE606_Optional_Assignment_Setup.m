%**************************************************************************
% This script sets parameters and performs intial calculations for the 3 
% noted devices:
%   1) Si BJT
%   2) Si - abrupt junction SixGe1-x - HBT
%       - x is a specific value x0 in [0,1.0]
%   3) Si - graded junction SixGe1-x - HBT
%       - x is graded linearly from 1.0 to some value xo
%
% Emitter and Collector remain Si for the HBT devices
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
%********************************Constants*********************************
% Ne = Doping concentration in the emitter 
% Nb = Doping concentration in the base
% Nc = Doping concentration in the collector
% We = Total width of the emitter in the BJT/HBT
% Wb = Total width of the base in the BJT/HBT
% Wc = Total width of the collector in the BJT/HBT
% T  = Temperature in Kelvin
% niSi = intrinsic carrier concentration of silicon
% x0 = structure of x0 values for Si(X)Ge(1-X)
% Ksi = dielectric constant of silicon
% epsilon0 = vacuum permittivity of free space
% kBT = thermal voltage
% mupe = minority carrier mobility in the Si emitter
% mupc = minority carrier mobility in the Si collector
% ChiSi = electron affinity for silicon
% q = elementary electric charge
% EgSi = Energy band gap of Silicon

%******************************Calculated**********************************
% munb1 = minority carrier mobility in the BJT Si base
% Dnb1 = minority carrier diffusion coefficient in device 1 base
% Dpe = minority carrier diffusion coefficient in all Si emitters
% P = structure with required parameters to plot
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
niSi = 1.5e10; %atoms/cm^3
x0 = linspace(0.05, 0.65, 13); %vector of x0 from 0.05-0.65 in steps of 0.05
KSi = 11.7; %dielectric constant of silicon
epsilon0 = 8.85e-14; %vacuum permittivity of free space
kBT = 0.0259; %eV
mupe = 70; %cm^2/V-sec - taken from page 80 SDF
mupc = 331; %cm^2/V-sec - taken from page 80 SDF
ChiSi = 4.05; %eV
q=1.602e-19; %C
EgSi=1.12; %eV
%**************************************************************************
%
%**********************Device 1 Material Properties************************
%intrinsic carrier concentration
%intrinsic carrier concentration in device 1 emitter is simply niSi

%mobility
munb1 = 275; %cm^2/V-sec - taken from page 80 SDF

%diffusion coefficient
Dnb1 = kBT * munb1; %cm^2/sec
Dpe = kBT * mupe; %cm^2/sec

%dielectric constants
%dielectric constant is simply Ksi for device 1

%electron affinity
%electron affinity for device 1 base is ChiSi

%valence band offsets
%no valence band offset

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