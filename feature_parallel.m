function ret=feature_parallel(a,width)
n=size(a,1);
a=[zeros(width-1,1);a;zeros(width-1,1)];
ret=zeros(n,width);
for i=1:n
    for j=1:width
        ret(i,j)=a(i+j-1);
    end
end
