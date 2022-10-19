clear;
clc;
n=[0:19];
x1=[1,zeros(1,19)];
a1=[1,-0.6];
b1=[1];
h1=filter(b1,a1,x1);
subplot(1,2,1);
stem(h1);
h2(1)=1;
for i=2:20
    h2(i)=0.6^i*h2(i-1);
end
subplot(1,2,2);
stem(h2);