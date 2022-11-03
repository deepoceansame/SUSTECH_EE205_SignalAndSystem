
function y=conjop(N)
xn=(0.9).^[0:N-1];
hn=(0.5).^[0:N-1,0:N-1];
y=zeros(1,N);
for io=1:N
    for iop=1:N
        y(io)=y(io)+xn(iop)*hn(io+N-iop);
    end
end
