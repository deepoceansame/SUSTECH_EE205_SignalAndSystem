clear;clc;
N=80;
f80ftimes=0;
for k=1:10
    f=@()as310a7(N);
   
    t(k)=timeit(f);

    f80ftimes=f80ftimes+t(k);

 
end
f80f=f80ftimes/length(t)
y=as310a7(N);
plot(y);