function [R1111,H1]=minor1(arr)
z = zpk('z',1);
s = tf('s');
 
%ideal
G=1/s;


w=0.01:0.03:3.14;

    M=bode(G,w);
    M0(1:length(w))=M(1,1,:);
H1=(arr(1)*z+arr(2))/(z+arr(3));                         %first order



M1 = bode(H1,w); 
M11(1:length(w))=M1(1,1,:);
    R11=((M11-M0))*100;
     R111=R11./M0;
    R111=abs(R111);
    R1111 = mean(R111);
   
      
end