clear; clc; close all;
load data_1.mat
[lpf_b, lpf_a] = butter(20, 10e6/(f_s/2));
[h,f]=freqz(lpf_b,lpf_a,1024,f_s); % Digital filter frequency response
figure;
plot(f,20*log10(abs(h))); % in dB scale
hold on;
plot(f, ones(1, length(f)).*(-3));
xlabel('Frequency (Hz) ');
ylabel('Magnitude');
title(sprintf("lowpass filter of cutoff=%d", 10e6))
