close('all'); clear; clc;

f_name = 'C_01_02.wav';
[x, fs] = audioread(f_name);
SSN = audioread(strcat('ssn.wav'));

SNR = -5;
a = 1;
b = norm(x)./ ( (10.^(SNR/20)).*norm(SSN) );
y = a*x + b*SSN;
y = y*norm(x)/norm(y);
fprintf("output y is equal to x on energy %d", abs(norm(x) - norm(y)) < 0.1.^10);

L = length(x);

t = (0:L-1)/fs;
[pyy, w] = pwelch(repmat(y, 10, 1), [], [], 512, fs);
pxx = pwelch(repmat(x, 10, 1), [], [], 512, fs);

figure;
plot(w, 10*log10(pyy), w, 10*log10(pxx));
legend('orginal signal', 'signal with noise')
title('psd of signal'); xlabel('F (Hz)'); ylabel('PSD(dB/Hz)');
