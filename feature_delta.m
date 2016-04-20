function ret=feature_delta(s,w)
n=size(s,1);
s1=[s(1:w);s];
s1=s1(1:n);
ret=s-s1;
