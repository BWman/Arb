function ret=feature_rsi(x,w)
% n=size(x,1);
% y=[x(1);x];
% y=y(1:n);
% d=x-y;
% ad=abs(d);
% d=d.*(d>0);
% k1=feature_ma(d,w);
% k2=feature_ma(ad,w);
% ret1=k1./k2;
% ret=0;
% ret=ret1.*(~isnan(ret1));

ret=rsindex(x,w);
ret(isnan(ret))=50;
ret=ret/100;

