clear;clc;
f80ctimes=0;
N=80;
for k=1:10
    f=@()conjop(N);
   
    t(k)=timeit(f);

    f80ctimes=f80ctimes+t(k);
 
end
f80c=f80ctimes/length(t)
y=conjop(80);
plot(y);