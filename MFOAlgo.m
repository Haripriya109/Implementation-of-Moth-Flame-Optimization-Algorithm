function [OBFS BFS]=MFOAlgo()
T=5;
lb=-1;
ub=1;
n=30;
d=5;
M=unifrnd(lb,ub,n,d);
iteration=1;
while iteration<T+1
    flameno=round(n-iteration*((n-1)/T));
    for i=1:n
        forub=M(i,:)>ub;
        forlb=M(i,:)<lb;
        M(i,:)=(M(i,:).*(~(forub+forlb)))+ub.*forub+lb.*forlb;
        OM(1,i) = minor1(M(i,:));
    end
     if iteration==1
        [OMS I]=sort(OM);
        MS=M(I,:);
        BFS=MS;
        OBFS=OMS;
     else
         
        M2=[lastM;BFS];
        OM2=[lastOM OBFS];
        
        [OM2S I]=sort(OM2);
        M2S=M2(I,:);
        
        OMS=OM2S(1:n);
        MS=M2S(1:n,:);
        BFS=MS;
        OBFS=OMS;
    end
 
    OBF=OMS(1);
    BFP=MS(1,:);
      
    lastM=M;
    lastOM=OM;
    
     a=-1+iteration*((-1)/T);
     
     for i=1:size(M,1)
        
        for j=1:size(M,2)
            if i<=flameno
                Dis=abs(MS(i,j)-M(i,j));
                b=1;
                t=(a-1)*rand+1;
                M(i,j)=Dis*exp(b.*t).*cos(t.*2*pi)+MS(i,j);
            end
            if i>flameno
                Dis=abs(MS(i,j)-M(i,j));
                b=1;
                t=(a-1)*rand+1;
                M(i,j)=Dis*exp(b.*t).*cos(t.*2*pi)+MS(flameno,j);
            end
        end
     end
     

     
     iteration=iteration+1;
end

 OBFFINAL=OMS(1)
 BFPFINAL=MS(1,:)

end    
        
    
        