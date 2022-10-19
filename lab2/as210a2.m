YS=0;
yn=[y(1000,1)];
B=1;
A=[1,zeros(1,999),0.5];
xi=filtic(B,A,YS);
yout=filter(B,A,yn,xi);
figure;
plot(yout)
