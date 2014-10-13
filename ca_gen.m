function[G1]=ca_gen(prn)

x=[1,1,1,1,1];

y=[1,1,1,1,1];

output=1:1:32;
G1=1:1:32;
G2=1:1:32;

for index=1:32
    G1(index)=0;
    G2(index)=0;
    output(index)=0;
end

for index=1:32;
    G1(index)=x(5);
    G2(index)=y(5);
    x(5)=x(4);
    x(4)=x(3);
    x(3)=x(2);
    x(2)=x(1);
    x(1)=mod(x(1)+x(3),2);
    y(1)=mod(y(1)+y(2)+y(3),2);
   end

end

