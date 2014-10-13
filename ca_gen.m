function[G1]=ca_gen(prn)
syms cacode;

x=[1,1,1,1,1,1,1,1,1,1];

y=[1,1,1,1,1,1,1,1,1,1];

output=1:1:1024;
output(1)=1;

G1=1:1:1024;
G1(1)=1;

G2=1:1:1024;
G2(1)=1;

for index=1:1024
    G1(index)=0;
    G2(index)=0;
    output(index)=0;
end

for index=1:1024;
    G1(index)=x(10);
    G2(index)=y(10);
   for k=1:9
       x(11-k)=x(10-k);
       y(11-k)=y(10-k);
   end
    x(1)=mod(x(1)+x(2)+x(3),2);
    y(1)=mod(y(1)+y(2)+y(3)+y(6)+y(8)+y(9)+y(10),2);
    output(index)=mod(y(2)+y(6)+G2(index),2);
end


end