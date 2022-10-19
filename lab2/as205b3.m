n=[0:19];
x1=[1,zeros(1,19)];
un1=[1];
for i=1:20
    un1(i)=1;
end
a1=[1,-0.6];
b1=[1];
h1=filter(b1,a1,x1);
h2(1)=1;
for i=2:20
    h2(i)=0.6^i*h2(i-1);
end
z1=conv(h1,un1);
z2=conv(h2,un1);
subplot(1,2,1);
plot(s1,'r');
hold on;
plot(z1,'b');
subplot(1,2,2);
plot(s2,'r');
hold on;
plot(z2,'b')