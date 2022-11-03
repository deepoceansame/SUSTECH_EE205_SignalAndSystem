
dtfstimes=0;a=1;ftttimes=0;
for N=[8 32 64 128 256]
    
    for k=1:10
    x=(0.9).^[0:N-1];
    f=@()dtfs(x,0);
    f2=@()fft(x,0);
    t(k)=timeit(f);
    t2(k)=timeit(f2);
    dtfstimes=dtfstimes+t(k);
    ftttimes=ftttimes+t2(k);
    end
    dtfstimes=dtfstimes/length(t);
    ftttimes=ftttimes/length(t2);
    dtfscomps(a)=dtfstimes;
    fttcomps(a)=ftttimes;
    a=a+1;
    
end
N=[8 32 64 128 256];
subplot(1,2,1);
loglog(N,dtfscomps);
subplot(1,2,2);
loglog(N,fttcomps);