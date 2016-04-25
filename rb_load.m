function s=rb_load()
s=load(['data01.csv']);
s=table(s(:,[1,3]),s,'VariableNames',{'Var1','RB01'});
%s=dataset(x(:,[1,3]),x,'VarNames',{'K','V1'});
for i=2:9
    x=load(['data0',num2str(i),'.csv']);
    x=table(x(:,[1,3]),x,'VariableNames',{'Var1',['RB0',num2str(i)]});
    %x=dataset(x(:,[1,3]),x,'VarNames',{'K',['V',num2str(i)]});
    s=innerjoin(s,x,'key','Var1');
end;
for i=10:12
    x=load(['data',num2str(i),'.csv']);
    x=table(x(:,[1,3]),x,'VariableNames',{'Var1',['RB',num2str(i)]});
    %x=dataset(x(:,[1,3]),x,'VarNames',{'K',['V',num2str(i)]});
    s=innerjoin(s,x,'key','Var1');
end;


          
        
    