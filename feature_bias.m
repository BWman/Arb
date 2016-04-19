function ret=feature_bias(s,w)
u=feature_ma(s,w);
ret=s-u;
