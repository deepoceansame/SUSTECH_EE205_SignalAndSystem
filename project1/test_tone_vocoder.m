clear; clc; close;

ctof_fq = 50; 
but_order = 4;
[sig, fs] = audioread('C_01_02.wav');
N = [8]; %Define the bands.
fbe = 200; %Start Frequency
fen = 7000; %End Frequecy


n = 8;
% tone_vocoder(sig, n_bands, ctof_fq, but_order, fs, fbe, fen)
syth = tone_vocoder(sig, n, ctof_fq, but_order, fs, fbe, fen);
syth_tmp = tone_vocoder_tmp(sig,fs,n,ctof_fq, but_order, fbe, fen);
subplot(211);
plot(1:length(sig), syth);
subplot(212);
plot( 1:length(sig), syth_tmp);
