x=-pi:0.1:pi;
y=sin(x);
ynoise=y+((rand(1,length(y))-0.5)*0.1);
plot(x,ynoise,'r');