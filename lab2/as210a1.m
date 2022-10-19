clear;
clc;
load("lineup(2).mat");
he=zeros(1000);
for i=1001:2000
    he(i-1000)=y(i)+0.5*y(i-1000);
end
plot(he)