clc;
clear all;

m = 1000;
[tm, signal, Fs] = rdsamp('mitdb/122', [], m);
signal = signal(:, 1);
Fs = Fs(1);

% Derivative
h = 1 / Fs;
diffSignal = gradient(signal, h);

% Square derivative
sqDiffSignal = diffSignal.^2;

% Cumulative integral
integralSignal = cumtrapz(tm, sqDiffSignal);

% Discrete Fourier transform
n = 2 ^ nextpow2(m);
fftSignal = fft(signal, n);
f = Fs * (0 : (n/2)) / n;
fftSignal = abs(fftSignal / n);

% Plot
subplot(2, 2, 1);
plot(tm, signal, 'b');
xlabel('Time (s)');
ylabel('Amplitude (mV)');
title('Signal');

subplot(2, 2, 2);
plot(tm, diffSignal, 'r');
xlabel('Time (s)');
ylabel('Slew rate (mV/s)');
title('Signal derivative');

subplot(2, 2, 3);
plot(tm, integralSignal, 'g');
xlabel('Time (s)');
ylabel('Cumulative integral of sq. der. ((mV)^2 / s)');
title('Integral of squared derivative');

subplot(2, 2, 4);
plot(f, fftSignal(1 : n/2+1));
title('Signal in frequency domain');
xlabel('f (Hz)');
ylabel('|fft(signal)|');
