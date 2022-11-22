clc,clear,close all;
%(a)
syms t;
x=exp(-2*t).*(t>=0)+exp(2*t).*(t<0);
%(b)
tau=0.01;
T=10;
t=0:tau:T-tau;
for i=1:length(t)
    if t(i)>=5
        y(i)=ep(-2*(t(i)-5));
    else
        y(i)=exp(2*(t(i)-5));
    end
end
N=length(y);
figure(1);
plot(t,y);
xlabel('t'),ylabel('y')
%(c)
Y=fftshift(tau*fft(y));
%(d)
w=-(pi/tau)+(0:N-1)*(2*pi/(N*tau));
%(e)
for p=1:length(w)
    X(p)=exp(i*5+w(k))*Y(k);
end
figure(2)
subplot(2,2,1);plot(w,abs(X));xlabel('\omega'),ylabel('abs(X)'),title('approximate')
subplot(2,2,2);plot(w,angle(X));xlabel('\omega'),ylabel('angle(X)'),title('approximate')

for k=1:length(w)
    X_cal=1./(2+j*w)+1./(2-j*w);
end
subplot(2,2,3);plot(w,abs(X_cal));xlabel('\omega'),ylabel('abs(X_anal)'),title('analy')
subplot(2,2,4);plot(w,angle(X_cal));xlabel('\omega'),ylabel('angle(X_anal)'),title(analy);
figure(3)
subplot(1,2,1);plot(w,abs(Y),'b');xlabel('\omega');ylabel('Y Mag'),title('app of |Y|')
subplot(1,2,2);plot(w,angle(Y),'b');xlabel('\omega');ylebal('Y PH'),title('ap of |X|' )
