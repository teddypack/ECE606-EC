%%SiGe Bandgap equation testing
%To compare equations from different articles ot see if they work.

%xo=0:0.05:0.65;    %Typical xo range for ratio of SixGe1-x
x0 = linspace(0.05, 0.65, 13) %vector of x0 from 0.05-0.65 in steps of 0.05
xo_ge=1-x0; %Same xo range as SixGe1-x, only accounted for Si1-xGex

%%From Heather's Word doc: 
%EgA=1.12-(0.41.*x0)+(0.008.*x0.*x0)

%%From 
%EgBa=1.17-(0.47.*xo_ge)+(0.24.*xo_ge.*xo_ge)  %Valid when xo_ge<0.85
%EgBb=5.88-(9.58.*xo_ge)+(4.43.*xo_ge.*xo_ge)  %Valid when xo_ge>0.85

%%Ted's method
%for i=1:3
%  EgSiGe(i)=1.86-(1.2*x0(i));
%endfor
%for i=4:13
%  EgSiGe(i)=1.12-(0.41*x0(i))+(0.008*(x0(i)^2));
%endfor

%plot(x0,EgA,x0,EgBa,x0,EgBb)
%legend('EgA','EgBa','EgBb')

%plot(x0,EgA,x0,EgBa,x0,EgBb,x0,EgSiGe)
%legend('EgA','EgBa','EgBb''EgSiGe')

%%Final Model
for i=1:3
  EgSiGe(i)=5.88-(9.58.*xo_ge(i))+(4.43.*xo_ge(i).*xo_ge(i));  %Valid when xo_ge>0.85
end
for i=4:13
  EgSiGe(i)=1.17-(0.47.*xo_ge(i))+(0.24.*xo_ge(i).*xo_ge(i));  %Valid when xo_ge<0.85
end
%plot(x0,EgSiGe)
