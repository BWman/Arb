function f=feature_generate(tag,x);
s(:,1)=feature_ma(x,10);
s(:,2)=feature_ma(x,60);
s(:,3)=feature_ma(x,240);
s(:,4)=feature_ma(x,1200);
s(:,5)=feature_ma(x,6000);
s(:,6)=feature_percentage(x,10);
s(:,7)=feature_percentage(x,60);
s(:,8)=feature_percentage(x,240);
s(:,9)=feature_percentage(x,1200);
s(:,10)=feature_percentage(x,6000);
s(:,11)=feature_bias(x,10);
s(:,12)=feature_bias(x,60);
s(:,13)=feature_bias(x,240);
s(:,14)=feature_bias(x,1200);
s(:,15)=feature_bias(x,6000);

s(:,16)=feature_delta(x,10);
s(:,17)=feature_delta(x,60);
s(:,18)=feature_delta(x,240);
s(:,19)=feature_delta(x,1200);
s(:,20)=feature_delta(x,6000);

s(:,21)=feature_rsi(x,10);
s(:,22)=feature_rsi(x,60);
s(:,23)=feature_rsi(x,240);
s(:,24)=feature_rsi(x,1200);
s(:,25)=feature_rsi(x,6000);

f=[s];