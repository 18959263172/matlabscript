

x=0:1024;    %����Ƶ��2kbs

y=1000*sin(pi*200*(x/2047));

z=fft(y);

figure(1);

subplot(2,1,1);

plot(x,y);

subplot(2,1,2)

plot(x,z)

%subplot(2,1,2);plot(F,z);xlabel('Ƶ��(Hz)');ylabel('����(dB)');title('ԭʼ�ź�xrƵ��');

%z=fft(y);



