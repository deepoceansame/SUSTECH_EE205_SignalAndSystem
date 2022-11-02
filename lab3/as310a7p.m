clear;clc;
N=40;
f40ftimes=0;
for k=1:10
    f=@()as310a7(N);
   
    t(k)=timeit(f);

    f40ftimes=f40ftimes+t(k);
 
end
f40f=f40ftimes/length(t)