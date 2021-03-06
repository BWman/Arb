function [M,M0,struct_a,jgd,sharpe]=generate_model(tag,x,benchmark,upper_critical,regulizer_rate,s,v1,v2)
    n=size(tag,1);
   
    [~,~,M0,struct_a,~]=testFeature(tag(1:n/2),x(1:n/2,:),benchmark,upper_critical,1,n/2,regulizer_rate);
    u=n/2+1;
    v=n;
    s=s(u:v,:,:);
    n=v-u+1;
    tag(tag>100)=100;
    tag(tag<-100)=-100;
    tag=tag(u:v);
    x=[x(u:v,:)];
    
    idx=linspace(1,n,n);
    lower_critical=-upper_critical;
    for j=1:size(x,2)
        Z(:,j)=(x(:,j)-struct_a.mu(j))./struct_a.sigma(j);
    end
    %[Z,MU,SIGMA] = zscore(x); 
    %[B,BINT,R,RINT,STATS] = regress(tag,[Z,ones(n,1)]);
    %[B,S] = lasso([Z,ones(n,1)],tag,'Lambda',0.0000001);
    B=struct_a.B;
    pred=([Z,ones(n,1)]*B);
    

    %[B,BINT,R,RINT,STATS] = regress(tag,[x,ones(n,1)]);
    %pred=([x,ones(n,1)]*B);
    signal=-(pred<lower_critical)+(pred>upper_critical);
    %signal=signal.*(s(:,3,1)>900).*(s(:,3,1)<1430);
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
    %long_ret=sum(long);
    long_count=size(long,1);
    %short_ret=sum(short);
    short_count=size(short,1);
    tot=[long;short];
   
    signal=signal(~isnan(signal));
    
    profitlong=sum(long>0);
    profitshort=sum(short>0);
    jpg=plot(idx,benchmark(u:v),idx,(signal<0).*benchmark(u:v),'.g',idx,(signal>0).*benchmark(u:v),'.r');
    saveas(gcf,['testSignal.jpg'],'jpg');
    jpg=plot(idx,tag,idx,(signal<0).*tag,'.g',idx,(signal>0).*tag,'.r');
    saveas(gcf,['testReturn.jpg'],'jpg');
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
    pl=linspace(0,0,n)';
    eps=0.0006;
    for i=2:n
        pl(i)=pl(i-1)+signal(i)*tag(i)-eps*(signal(i)~=0);
    end
    
    t=[floor(s(:,1,1)/10000),  floor((s(:,1,1)-floor(s(:,1,1)/10000)*10000)/100),       mod(s(:,1,1),100)];
    t=datenum(t);
    uu=[s(31:n,7,v1);s(n-29:n,7,v1)];
    vv=[s(31:n,7,v2);s(n-29:n,7,v2)];
    jgd(:,1)=s(:,1,v1);
    jgd(:,2)=s(:,3,v1);
    jgd(:,3)=s(:,2,v1);
    jgd(:,4)=s(:,7,v1);
    jgd(:,5)=s(:,2,v2);
    jgd(:,6)=s(:,7,v2);
    jgd(:,7)=signal;
    jgd(:,8)=tag;
    jgd(:,9)=uu;
    jgd(:,10)=vv;
    jgd(:,11)=t;
    jgd=jgd(jgd(:,7)~=0,:);
    plot(idx,pl);
    saveas(gcf,['NetValue_Signal.jpg'],'jpg');
    struct_a.pl=pl;
    
    
    startDay=t(1);
    endDay=t(n);
    
    
    for i=startDay:endDay   
       netValue_d(i-startDay+1,1)=sum((jgd(:,11)==i).*(jgd(:,8).*jgd(:,7)-eps));
    
    end
    for i=startDay:endDay
       netValue_d(i-startDay+1,2)=sum(netValue_d(1:i-startDay+1,1));
       netValue_d(i-startDay+1,3)=sum(jgd(:,11)==i);
    end
    struct_a.netValue_d=netValue_d;
    %sharpe= netValue_d(endDay-startDay+1,2)/sqrt(var(netValue_d(1:endDay-startDay+1,1)))/16;
        
  %  struct_a.BINT=BINT;

    