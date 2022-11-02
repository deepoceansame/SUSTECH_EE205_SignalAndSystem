clear;clc;close all;
a=[1 2 3 4];
b=[2 3 4 5];
xn=[a a a a a a a];
hn=[b b b b b b b];
y=zeros(1,20);
for io=1:20
    for iop=1:4
        y(io)=y(io)+xn(iop)*hn(io+4-iop);
    end
end
stem(y)