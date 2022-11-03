f40ctimes=0;convtimes=0;
N=40;
xn=(0.9).^[0:N-1];
hn=(0.5).^[0:N-1];
for k=1:10
    f=@()conjop(40);
    f2=@()conv([xn xn], hn);
    t(k)=timeit(f);
    t2(k)=timeit(f2);
    f40ctimes=f40ctimes+t(k);
    convtimes=convtimes+t2(k);
 
end
f40c=f40ctimes/length(t)
convtimes=convtimes/length(t)
    
  
   