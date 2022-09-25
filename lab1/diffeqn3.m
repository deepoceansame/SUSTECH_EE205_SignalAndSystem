
clear;
clc;
a=1;
yn1=-1;
x1=[ones(31)];
x2=(2);
for i=1:31
    x2(i)=2;
end
y1=diffeqn(a,x1,yn1);
y2=diffeqn(a,x2,yn1);
stem(2*y1-y2);