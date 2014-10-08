function [] = Orthogonal_sampling()
%%%%%%%%%%%%  ������������  %%%%%%%%%%
%%%%%%%%%%%%%% 2007-11-29 %%%%%%%%%%%%
close all
clear all

f0=4200;  %�ز�Ƶ��
fs=4*f0; 
T= 0.5;    
t=-T/2:1/fs:T/2; 
A  = t+1;     
K = 400;             
theta =K*pi*t.^2;   
xr = A.*cos(2*pi*f0*t+theta);
xc = A.*exp(j*theta); 

figure(1)
subplot(2,1,1);plot(t,abs(xc));xlabel('ʱ��(s)');ylabel('����');title('ԭʼʵ�ź����۸��������')
subplot(2,1,2);plot(t,mod(angle(xc)*180/pi,360));xlabel('ʱ��(s)');ylabel('����');title('ԭʼʵ�ź����۸�������λ')

figure(2);
F = -fs*floor(length(xr)/2)/length(xr):fs/(length(xr)):fs*floor(length(xr)/2)/length(xr);
fft_xr = 20*log10(abs(fft(xr)));
fft_xr = fft_xr(2:length(xr)/2+1);
fft_xr = [fliplr(fft_xr) fft_xr(1) fft_xr];
subplot(2,1,1);plot(t,xr);xlabel('ʱ��(s)');ylabel('����');title('ԭʼ�ź�Xrʱ����')
subplot(2,1,2);plot(F,fft_xr);xlabel('Ƶ��(Hz)');ylabel('����(dB)');title('ԭʼ�ź�xrƵ��');

%%%%%%%%%  30��FIR�˲���  %%%%%%%%%%%%
n=30; f1=1/fs/fs; f2=f0/3;
Wn=[f1 f2]/(fs/2);
[fir1_b,fir1_a]=fir1(n,Wn);figure(3);freqz(fir1_b,fir1_a);

xc_a = 2*xr.*cos(2*pi*f0*t);  xc_a = filter(fir1_b,fir1_a,xc_a);
xc_b = 2*xr.*sin(2*pi*f0*t);  xc_b = filter(fir1_b,fir1_a,xc_b);
Fs =2*K;   
xc_a = xc_a(1:fs/Fs:length(xc_a));  %  ͬ���������
xc_b = xc_b(1:fs/Fs:length(xc_b));  %  ������������
xc_out = xc_a+j*xc_b;

A_out = abs(xc_out);      
theta_out = mod(angle(xc_out)*180/pi,360);
t_out = -length(A_out)/Fs/2+1/Fs:1/Fs:length(A_out)/Fs/2;

figure(4)
subplot(2,1,1);plot(t_out,A_out);xlabel('ʱ��(s)');ylabel('����');title('����õ����źŸ��������');axis([-0.25,0.25,0,1.5]);
subplot(2,1,2);plot(t_out,theta_out);xlabel('ʱ��(s)');ylabel('����');title(' ����õ����źŸ�������λ');axis([-0.25,0.25,0,400]);