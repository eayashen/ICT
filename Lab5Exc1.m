clc;
close all;
x=0:0.01:100;
a=10;
b=50;
c=0.1;
y=a*(exp((-(x-b).^2)/2*c.^2));
y0=awgn(y,30,'measured');
ap=polyfit(x,y0,100);
yp=polyval(ap,x);
MSEp=mean((y0-yp).^2)

F=@(a,x)(a(1)*(exp((-(x-a(2)).^2)/2*a(3).^2)));
ai=[3 40 .1];
[al]=lsqcurvefit(F,ai,x,y0)
yl=F(al,x);
MSEl=mean((y0-yl).^2)


figure 
plot(x,y0)
hold on
plot(x,yp)
hold on
plot(x,yl)
grid on
legend('observed','polyfitted','isqfitted')