clc;clear;clf;

% 验证滤波器
% 在ref和sur都要搞
for i =1:20
FileName = ['data_' num2str(i)];
load (FileName)
end_time = cur_time+duration;
t = linspace(0,duration,f_s*duration);
f = linspace(-f_s/(1000000*2),f_s/(1000000*2),length(seq_ref));

figure(i)
subplot(3,2,1)
plot(t,real(seq_ref))
xlim([0 0.01])
title(sprintf('Reference signal(raw) %.1d-%.1d',cur_time,end_time))
ylabel('Amplitude');xlabel('T/S')

subplot(3,2,2)
sp = 20*log10(abs(fftshift(fft(seq_ref))));
plot(f,sp)
title('Spectrum(raw)')
ylabel('Amplitude(dB)');xlabel('f/MHz')


subplot(3,2,3)
% 频移2.5Mhz
ref_DDC = seq_ref.*exp(1i.*2*pi*3e6.*t);
plot(t,real(ref_DDC))
xlim([0 0.01])
title('Reference signal(after DDC)')
ylabel('Amplitude');xlabel('T/S')

subplot(3,2,4)
sp_DDC = 20*log10(abs(fftshift(fft(ref_DDC)  )));
plot(f,sp_DDC)
title('Spectrum(after DDC)')
ylabel('Amplitude(dB)');xlabel('f/MHz')

subplot(3,2,5)
[b, a] = butter(20, 10e6/(f_s/2));
ref_LPF = filter(b,a,ref_DDC);
plot(t,real(ref_LPF))
xlim([0 0.01])
title('Reference signal(after LPF)')
ylabel('Amplitude');xlabel('T/S')

subplot(3,2,6)
sp_LPF = 20*log10(abs(fftshift(fft(ref_LPF)    )));
plot(f,sp_LPF)
title('Spectrum(after LPF)')
ylabel('Amplitude(dB)');xlabel('f/MHz')
end










