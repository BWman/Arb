function [B,S,M,struct_a,validation_odd]=testFeature(tag,x,benchmark,upper_critical,u,v)
    tag=tag(u:v);
    x=x(u:v,:);
    n=size(tag,1);
    idx=linspace(1,n,n);
    lower_critical=-upper_critical;
    
    [Z,MU,SIGMA] = zscore(x); 
    %[B,BINT,R,RINT,STATS] = regress(tag,[Z,ones(n,1)]);
     [B,S] = lasso([Z,ones(n,1)],tag,'Lambda',0.0001);
    pred=([Z,ones(n,1)]*B);
    

    %[B,BINT,R,RINT,STATS] = regress(tag,[x,ones(n,1)]);
    %pred=([x,ones(n,1)]*B);
     signal=-(pred<lower_critical)+(pred>upper_critical);
    for i=1:size(signal,1)-1
        if signal(n-i+1)~=0 && signal(n-i)~=0
            signal(n-i+1)=0;
        end
    end
    long=tag(signal==1);
    long=long(~isnan(long));
    %p=STATS(1);
    short=tag(signal==-1);
    short=-short(~isnan(short));
    long_ret=sum(long);
    long_count=size(long,1);
    short_ret=sum(short);
    short_count=size(short,1);
    tot=[long;short];
    profitlong=sum(long>0);
    profitshort=sum(short>0);
    jpg=plot(idx,benchmark(u:v),idx,(signal<0).*benchmark(u:v),'*g',idx,(signal>0).*benchmark(u:v),'*r');
    saveas(gcf,['trainSignal.jpg'],'jpg');
    jpg=plot(idx,tag,idx,(signal<0).*tag,'*g',idx,(signal>0).*tag,'*r');
    saveas(gcf,['trainReturn.jpg'],'jpg');
    M(1,1)=long_count;
    M(1,2)=short_count;
    M(1,3)=M(1,1)+M(1,2);
    M(2,1)=mean(long);
    M(2,2)=mean(short);
    M(2,3)=mean(tot);
    M(3,1)=profitlong;
    M(3,2)=profitshort;
    M(3,3)=profitlong+profitshort;
    M(4,1)=std(long);
    M(4,2)=std(short);
    M(4,3)=std(tot);
    M(5,1)=skewness(long,1);
    M(5,2)=skewness(short,1);
    M(5,3)=skewness(tot,1);
    M(6,1)=kurtosis(long,0);
    M(6,2)=kurtosis(short,0);
    M(6,3)=kurtosis(tot,0);
  %  struct_a.BINT=BINT;
    struct_a.S=S;
    struct_a.M=M;
    %signal=-(pred<lower_critical)+(pred>upper_critical);
    struct_a.signal=signal;
    struct_a.mu=MU;
    struct_a.sigma=SIGMA;
    struct_a.B=B;
    
    validation_odd=0;
    for i=1:size(signal,1)-1
        validation_odd=validation_odd+(signal(i)*signal(i+1));
    end
 
end