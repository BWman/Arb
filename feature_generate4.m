function f=feature_generate4(tag,x);
s(:,1)=feature_psy(x,10);
s(:,2)=feature_psy(x,60);
s(:,3)=feature_psy(x,240);
s(:,4)=feature_psy(x,1200);
s(:,5)=feature_psy(x,6000);


f=[s];
end
