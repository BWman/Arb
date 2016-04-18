function ret=feature_tag(s)
n=size(s,1);
t=[s(241:n);s(n-239:n)];
ret=t-s;
end