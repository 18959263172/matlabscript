B=1000;       %信号频率200

fs=16000;         %采样频率1W6

syms x;

f=3*sin(2*pi*(x/fs)*100)*cos(2*pi*B*(x/fs));    %

x=0:16000;

y=8000:1:fs;

z=subs(f);

freq=fft(z);

figure(1);

subplot(2,1,1);

plot(x,freq);

subplot(2,1,2);

plot(z);