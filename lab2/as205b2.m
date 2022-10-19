clear;
clc;
n=[0:19];
x1=[1,zeros(1,19)];
for i=1:20
    x1(i)=1;
end
a1=[1,-0.6];
b1=[1];
s1=filter(b1,a1,x1);
subplot(1,2,1);
stem(s1);
s2(1)=1;
for i=2:20
    s2(i)=0.6^i*s2(i-1)+x1(i);
end
subplot(1,2,2);
stem(s2);