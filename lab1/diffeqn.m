function y=diffeqn(a,x,yn1)
N=31;
y(1)=a*yn1+x(1);%一号位对应N=0
for i=2:N%同上
    y(i)=a*y(i-1)+x(i);
end
