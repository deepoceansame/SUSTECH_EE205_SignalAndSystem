clc;clear;clf;

load data_1.mat;
end_time = cur_time+duration;
t = linspace(0,duration-cur_time,f_s*duration);
f = linspace(-f_s/(1000000*2),f_s/(1000000*2),length(seq_ref));

figure;
subplot(3,2,1)
plot(t,real(seq_ref))
title(sprintf('Reference signal(raw) %d-%d',cur_time,end_time))
ylabel('Amplitude');xlabel('T/S')

subplot(3,2,2)
sp = 20*log10(abs(fftshift(fft(seq_ref)/length(seq_ref))));
plot(f,sp)
title('Spectrum(raw)')
ylabel('Amplitude(dB)');xlabel('f/MHz')

subplot(3,2,3)
% 频移2.5Mhz
ref_DDC = seq_ref.*exp(1i.*2*pi*3e6.*t);
plot(t,real(ref_DDC))
title('Reference signal(after DDC)')
ylabel('Amplitude');xlabel('T/S')

subplot(3,2,4)
sp_DDC = 20*log10(abs(fftshift(fft(ref_DDC)/length(ref_DDC))));
plot(f,sp_DDC)
title('Spectrum(after DDC)')
ylabel('Amplitude(dB)');xlabel('f/MHz')

subplot(3,2,5)
[b, a] = butter(20, 10e6/(f_s/2));
ref_LPF = filter(b,a,ref_DDC);
plot(t,real(ref_LPF))
title('Reference signal(after LPF)')
ylabel('Amplitude');xlabel('T/S')

subplot(3,2,6)
sp_LPF = 20*log10(abs(fftshift(fft(ref_LPF)/length(ref_LPF))));
plot(f,sp_LPF)
title('Spectrum(after LPF)')
ylabel('Amplitude(dB)');xlabel('f/MHz')











