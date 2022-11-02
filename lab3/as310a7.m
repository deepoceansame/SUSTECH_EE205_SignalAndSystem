
function y=as310a7(N)

xn=(0.9).^[0:N-1];
hn=(0.5).^[0:N-1];

xc=fft(xn);
hc=fft(hn);
yc=zeros(1,N);
for io=1:N
    yc(io)=xc(io)*hc(io);
end
y=ifft(yc);