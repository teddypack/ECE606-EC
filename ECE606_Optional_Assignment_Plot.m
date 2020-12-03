
function ECE606_Optional_Assignment_Plot(Name,pd,fn)
%**************************************************************************
% This script plots the values calculated in the study script
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
%*********************************Inputs***********************************
% Name  = text Description of component
% pd    = structure of data to plot
%  pd.x         = vector x
%  pd.y         = vector y
%  pd.z         = vector z
%  pd.a         = vector a
%  pd.b         = vector b
% fn            = figure number
%**************************************************************************
%
%********************************Internal**********************************
% x     = internal variable x
% y     = internal variable y
% z     = internal variable z
%**************************************************************************
%
%*********************Extract Data from paramters**************************
x=pd.x(:,1);
y=pd.y(:,2);
z=pd.z(:,3);
%
%*****************************Plot Data************************************
%
%Plot code goes here
%
%********************************End Code**********************************
