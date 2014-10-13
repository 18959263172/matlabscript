function[output]=ca_gen(prn)

syms cacode;

x=[1,1,1,1,1];

output=ones(33);

output(0)=1;

for index=1:32
    output(index)=0;
end

for index=0:31;
    output(index)=mod(x(1)+x(2)+output(0),2);
end
end