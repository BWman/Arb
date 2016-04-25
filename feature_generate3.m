function f=feature_generate3(tag,x);
s(:,1)=feature_dpo(x,10);
s(:,2)=feature_dpo(x,60);
s(:,3)=feature_dpo(x,240);
s(:,4)=feature_dpo(x,1200);
s(:,5)=feature_dpo(x,6000);


f=[s];