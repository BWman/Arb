function R=Amend(R)
n=size(R.Close1);
for i=1:n-1
    if R.Close1(i+1)==0
        R.Close1(i+1)=R.Close1(i);
    end
    if R.High1(i+1)==0
        R.High1(i+1)=R.High1(i);
    end
    if R.Low1(i+1)==0
        R.Low1(i+1)=R.Low1(i);
    end
    if R.Open1(i+1)==0
        R.Open1(i+1)=R.Open1(i);
    end
    if R.Close10(i+1)==0
        R.Close10(i+1)=R.Close10(i);
    end
    if R.High10(i+1)==0
        R.High10(i+1)=R.High10(i);
    end
    if R.Low10(i+1)==0
        R.Low10(i+1)=R.Low10(i);
    end
    if R.Open10(i+1)==0
        R.Open10(i+1)=R.Open10(i);
    end
    if R.Close5(i+1)==0
        R.Close5(i+1)=R.Close5(i);
    end
    if R.High5(i+1)==0
        R.High5(i+1)=R.High5(i);
    end
    if R.Low5(i+1)==0
        R.Low5(i+1)=R.Low5(i);
    end
    if R.Open5(i+1)==0
        R.Open5(i+1)=R.Open5(i);
    end
end;