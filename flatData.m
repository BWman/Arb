function D=flatData(s)
n=size(s,1);
m=size(s,2);
l=size(s,3);
for j=1:4
    for k=1:l
        for i=1:n-1
            if s(n-i,j,k)==0
                s(n-i,j,k)=s(n-i+1,j,k);
            end
        end
    end
end
D=s;