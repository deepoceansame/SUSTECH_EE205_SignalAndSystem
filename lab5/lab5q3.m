close('all'); clear; clc;

f_name = 'C_01_02.wav';
[x, fs] = audioread(f_name);
L = length(x);
t = (0:L-1)/fs;

cutoff = [100, 200, 300];
figure;
for i = 1:length(cutoff)
    plot(t, butterLPF(x, fs, 2, cutoff(i)));
    hold on;
    legend('orginal signal', 'envelope curve');
    axis([t(1) t(end) xlim]); xlabel('t'); grid('on');
    title(sprintf('Order: %d, Cutoff freq: %dHz', 3, cutoff(i)));
end
%% 

order = [2, 6];
figure;
for i = 1:length(order)
    subplot(length(order), 1, i);
    plot(t, x, t, butterLPF(x, fs, order(i), 200));
    legend('orginal signal', 'envelope curve');
    axis([t(1) t(end) xlim]); xlabel('t'); grid('on');
    title(sprintf('Order: %d, Cutoff freq: %dHz', order(i), 200));
end

order = 1:2:10;
figure; hold('on');
lege = repmat("", 1, length(order));
for i = 1:length(order)
    [b, a] = butter(order(i), 0.5);
    [h, w] = freqz(b, a);
    plot(w, abs(h));
    lege(i) = sprintf('order=%d',order(i));
end
legend(lege); xlabel('\omega'); xlabel('Amplitude');
grid('on'); axis([0 pi 0 1]);
set(gca,'XTick', 0:pi/4:pi, 'XTickLabel',{'0','\pi/4','\pi/2','3\pi/4','\pi'});
