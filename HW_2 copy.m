%% Problem 1
clear 
clc
% Load in all audio vectors
load one;
load two;
load three;
load four;

% Length of all audio vectors
N = 11613;

% Fs is the frequency the audio message was sampled at
Fs = 11025;

% t is an array of time (in seconds)
t = (0:N - 1)/Fs;

figure(1)
plot(t, one)
figure(2)
plot(t, two)
figure(3)
plot(t, three)
figure(4)
plot(t, four)
%% Testing audio samples :))))
 sound(one, Fs)
 sound(two, Fs)
 sound(three, Fs)
 sound(four, Fs)
%% Conitnuation
% this creates a length-N array whose entries range from −Fs to Fs and 
% increment by Fs/(N - 1)
f = (-Fs/2 : Fs/(N - 1) : Fs/2);

% this creates an array of length N that represents one in the frequency 
% domain. Do this for all functions
One = fft(one);
Two = fft(two);
Three = fft(three);
Four = fft(four);

% Plot the FT of each function in the frequency domain
%figure(1)
%plot(f, abs(fftshift(One)));
%figure(2)
%plot(f, abs(fftshift(Two)));
%figure(3)
%plot(f, abs(fftshift(Three)));
%figure(4)
%plot(f, abs(fftshift(Four)));

% Plot the FT of each function in the frequency domain but multiply the
% signal by log
%figure(1)
%plot(f, log(abs(fftshift(One))));
%figure(2)
%plot(f, log(abs(fftshift(Two))));

figure(3)
plot(f, log(abs(fftshift(Three))));

%figure(4)
%plot(f, log(abs(fftshift(Four))));

% Three has the most unique one so we'll choose to unscramble that
% HW2_Filter(f, -3500, 3500) is an ideal band pass filter that lets us pass
% certain frequencies into it so we can unscramble the input. The
% unscrambled output is put in the complex expression Z.
Z = Three .* HW2_Filter(f, -3500, 3500);

% Z is transformed back into the time domain through inverse fourier
% transform.
z = real(ifft(Z));

% plays the sound in the time domain at the sampling frequency Fs.
sound(z, Fs)

% Figure 1 has the plot of the output z(t) throughout t. Time Domain 
figure(1)
plot(t, z);










