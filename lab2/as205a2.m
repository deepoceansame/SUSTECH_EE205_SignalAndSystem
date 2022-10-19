clear;
clc;
x1n=[cos(1) 1 1 1 1 1];
x2n=[1 cos(1) 1 1 1 1];
x3n=[cos(1) cos(2) 1 1 1 1];
n=[0:5];
ss1=[1];
ss2=[1];
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