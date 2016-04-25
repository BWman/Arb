function f=feature_generate2(tag,x);
s(:,1)=feature_cmo(x,10);
s(:,2)=feature_cmo(x,60);
s(:,3)=feature_cmo(x,240);
s(:,4)=feature_cmo(x,1200);
s(:,5)=feature_cmo(x,6000);


f=[s];