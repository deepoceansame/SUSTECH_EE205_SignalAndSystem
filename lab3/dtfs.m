function a=dtfs(x,n_init)
a=zeros(size(x));
no=size(x);
x=[x x];
while n_init<0||n_init>4
if n_init<0 n_init=n_init+4;
end
if n_init>4 n_init=n_init-4;
end
end
for(op=1:no(2))
    b(op)=x(op+4-n_init);
end
for(op=1:no(2))
    for(j=1:no(2))
        a(op)=a(op)+b(j)*exp(-1i*(op-1)*(j-1)*(2*3.14159/no(2)));
    end
a(op)=a(op)/no(2);
end
