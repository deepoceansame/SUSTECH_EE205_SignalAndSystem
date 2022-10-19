clear;
clc;
x1n=[1 ,zeros(1,5)];
x2n=[0 1 ,zeros(1,4)];
x3n=[1 2 ,zeros(1,4)];
n=[0:5];
ss1=[1];
ss2=[1 -1 -1];
w1=filter(ss2,ss1,x1n);
w2=filter(ss2,ss1,x2n);
w3=filter(ss2,ss1,x3n);
figure
title('system 1')
subplot(1,4,1);
stem(n,w1);
subplot(1,4,2);
stem(n,w2);
subplot(1,4,3);
stem(n,w3);
subplot(1,4,4);
stem(n,w1+2*w2);