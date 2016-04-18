function ret=feature_tag(s)
n=size(s,1);
window=30;
t=[s(window+1:n);s(n-window+1:n)];
ret=t-s;
end