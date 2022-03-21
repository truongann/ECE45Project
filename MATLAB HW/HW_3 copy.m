%% Problem 1
clc
clear
% Loads the essential files first. The noisy.mat file is a summation of
% signals that would be received from a transmitter.
load mod;
load noisy;

%% First Audio
% Play the noisy file and describe what you hear
% mod_play(noisy)
k = 1;
fk = 25000*(k - 1);

Len = length(mod);
Fs = 811025;
f = Fs*(-Len/2:Len/2-1)/Len;
Mod_Freq = fft(mod);
Noisy_Freq = fft(noisy);


figure(1);
plot(f,abs(fftshift(Mod_Freq)));
axis([0, 215000, 0, 130000]);

figure(2);
plot(f,abs(fftshift(Noisy_Freq)));
axis([0, 7000, 0, 130000]);

Filtered_Signal = Mod_Freq .* HW3_Filter(f, -1000, 1000);
figure(3);
plot(f,abs(fftshift(Filtered_Signal)));
axis([-1010, 1010, 0, 130000]);

filtered_signal = real(ifft(Filtered_Signal));
figure(4);
plot(f,abs(fftshift(filtered_signal)));

t = (0:Len-1) / Fs;
demod_signal = filtered_signal .* (2*cos(2*pi*fk*t));
figure(5);
plot(t, demod_signal);

Demod_Signal = fft(demod_signal);
figure(6);
plot(f, abs(fftshift(Demod_Signal)));
axis([-1010, 1010, 0, 130000]);

Message = Demod_Signal .* HW3_Filter(f, -1000, 1000);

message = real(ifft(Message));
figure(7);
plot(t, message);
% mod_play(message);

%% Second Audio
clear
clc

load mod;
load noisy;

k = 2;
fk = 25000*(k - 1);

Len = length(mod);
Fs = 811025;
f = Fs*(-Len/2:Len/2-1)/Len;
Mod_Freq = fft(mod);
Noisy_Freq = fft(noisy);

figure(1);
plot(f,abs(fftshift(Mod_Freq)));
axis([0, 215000, 0, 130000]);

Filtered_Signal = Mod_Freq .* HW3_Filter(f, 18000, 32000);
figure(3);
plot(f,abs(fftshift(Filtered_Signal)));
axis([-32000, 32000, 0, 40000]);

filtered_signal = real(ifft(Filtered_Signal));
figure(4);
plot(f,abs(fftshift(filtered_signal)));

t = (0:Len-1) / Fs;
demod_signal = filtered_signal .* (2*cos(2*pi*fk*t));
figure(5);
plot(t, demod_signal);

Demod_Signal = fft(demod_signal);
figure(6);
plot(f, abs(fftshift(Demod_Signal)));
axis([-7000, 7000, 0, 80000]);

Message = Demod_Signal .* HW3_Filter(f, -7000, 7000);

message = real(ifft(Message));
figure(7);
plot(t, message);
% mod_play(message);

%% Third Audio
clear
clc

load mod;
load noisy;

k = 3;
fk = 25000*(k - 1);

Len = length(mod);
Fs = 811025;
f = Fs*(-Len/2:Len/2-1)/Len;
Mod_Freq = fft(mod);
Noisy_Freq = fft(noisy);

figure(1);
plot(f,abs(fftshift(Mod_Freq)));
axis([0, 215000, 0, 130000]);

Filtered_Signal = Mod_Freq .* HW3_Filter(f, 45900, 54100);
figure(2);
plot(f,abs(fftshift(Filtered_Signal)));
axis([-54200, 54200, 0, 30000]);

filtered_signal = real(ifft(Filtered_Signal));
figure(3);
plot(f,abs(fftshift(filtered_signal)));

t = (0:Len-1) / Fs;
demod_signal = filtered_signal .* (2*cos(2*pi*fk*t));
figure(4);
plot(t, demod_signal);

Demod_Signal = fft(demod_signal);
figure(5);
plot(f, abs(fftshift(Demod_Signal)));
axis([-4300, 4300, 0, 60000]);

Message = Demod_Signal .* HW3_Filter(f, -4300, 4300);

message = real(ifft(Message));
figure(6);
plot(t, message);

% mod_play(message);

%% Fourth Audio
clear
clc

load mod;
load noisy;

k = 4;
fk = 25000*(k - 1);

Len = length(mod);
Fs = 811025;
f = Fs*(-Len/2:Len/2-1)/Len;
Mod_Freq = fft(mod);
Noisy_Freq = fft(noisy);

figure(1);
plot(f,abs(fftshift(Mod_Freq)));
axis([0, 215000, 0, 130000]);

Filtered_Signal = Mod_Freq .* HW3_Filter(f, 68000, 82000);
figure(2);
plot(f,abs(fftshift(Filtered_Signal)));
axis([-84200, 84200, 0, 30000]);

filtered_signal = real(ifft(Filtered_Signal));
figure(3);
plot(f,abs(fftshift(filtered_signal)));

t = (0:Len-1) / Fs;
demod_signal = filtered_signal .* (2*cos(2*pi*fk*t));
figure(4);
plot(t, demod_signal);

Demod_Signal = fft(demod_signal);
figure(5);
plot(f, abs(fftshift(Demod_Signal)));
axis([-7000, 7000, 0, 60000]);

Message = Demod_Signal .* HW3_Filter(f, -7000, 7000);

message = real(ifft(Message));
figure(6);
plot(t, message);

% mod_play(message);

%% Fifth Audio
clear
clc

load mod;
load noisy;

k = 5;
fk = 25000*(k - 1);

Len = length(mod);
Fs = 811025;
f = Fs*(-Len/2:Len/2-1)/Len;
Mod_Freq = fft(mod);
Noisy_Freq = fft(noisy);

figure(1);
plot(f,abs(fftshift(Mod_Freq)));
axis([0, 215000, 0, 130000]);

Filtered_Signal = Mod_Freq .* HW3_Filter(f, 93000, 107000);
figure(2);
plot(f,abs(fftshift(Filtered_Signal)));
axis([-109000, 109000, 0, 45000]);

% Past this point, there's no more need to customize code. The code below
% this point is generalizable to every signal being filtered out.
filtered_signal = real(ifft(Filtered_Signal));
figure(3);
plot(f,abs(fftshift(filtered_signal)));

t = (0:Len-1) / Fs;
demod_signal = filtered_signal .* (2*cos(2*pi*fk*t));
figure(4);
plot(t, demod_signal);

Demod_Signal = fft(demod_signal);
figure(5);
plot(f, abs(fftshift(Demod_Signal)));
axis([-7000, 7000, 0, 60000]);

Message = Demod_Signal .* HW3_Filter(f, -7000, 7000);

message = real(ifft(Message));
figure(6);
plot(t, message);

% mod_play(message);

%% Sixth Audio
clear
clc

load mod;
load noisy;

k = 6;
fk = 25000*(k - 1);

Len = length(mod);
Fs = 811025;
f = Fs*(-Len/2:Len/2-1)/Len;
Mod_Freq = fft(mod);
Noisy_Freq = fft(noisy);

figure(1);
plot(f,abs(fftshift(Mod_Freq)));
axis([0, 215000, 0, 130000]);

Filtered_Signal = Mod_Freq .* HW3_Filter(f, 118000, 132000);
figure(2);
plot(f,abs(fftshift(Filtered_Signal)));
axis([-134000, 134000, 0, 45000]);

% Past this point, there's no more need to customize code. The code below
% this point is generalizable to every signal being filtered out.

filtered_signal = real(ifft(Filtered_Signal));
figure(3);
plot(f,abs(fftshift(filtered_signal)));

t = (0:Len-1) / Fs;
demod_signal = filtered_signal .* (2*cos(2*pi*fk*t));
figure(4);
plot(t, demod_signal);

Demod_Signal = fft(demod_signal);
figure(5);
plot(f, abs(fftshift(Demod_Signal)));
axis([-7000, 7000, 0, 60000]);

Message = Demod_Signal .* HW3_Filter(f, -7000, 7000);

message = real(ifft(Message));
figure(6);
plot(t, message);

% mod_play(message);

%% Seventh Audio
clear
clc

load mod;
load noisy;

k = 7;
fk = 25000*(k - 1);

Len = length(mod);
Fs = 811025;
f = Fs*(-Len/2:Len/2-1)/Len;
Mod_Freq = fft(mod);
Noisy_Freq = fft(noisy);

figure(1);
plot(f,abs(fftshift(Mod_Freq)));
axis([0, 215000, 0, 130000]);

Filtered_Signal = Mod_Freq .* HW3_Filter(f, 144000, 156000);
figure(2);
plot(f,abs(fftshift(Filtered_Signal)));
axis([-156000, 156000, 0, 130000]);

% Past this point, there's no more need to customize code. The code below
% this point is generalizable to every signal being filtered out.

filtered_signal = real(ifft(Filtered_Signal));
figure(3);
plot(f,abs(fftshift(filtered_signal)));

t = (0:Len-1) / Fs;
demod_signal = filtered_signal .* (2*cos(2*pi*fk*t));
figure(4);
plot(t, demod_signal);

Demod_Signal = fft(demod_signal);
figure(5);
plot(f, abs(fftshift(Demod_Signal)));
axis([-7000, 7000, 0, 60000]);

Message = Demod_Signal .* HW3_Filter(f, -7000, 7000);

message = real(ifft(Message));
figure(6);
plot(t, message);

% mod_play(message);

%% Eighth Audio
clear
clc

load mod;
load noisy;

k = 8;
fk = 25000*(k - 1);

Len = length(mod);
Fs = 811025;
f = Fs*(-Len/2:Len/2-1)/Len;
Mod_Freq = fft(mod);
Noisy_Freq = fft(noisy);

figure(1);
plot(f,abs(fftshift(Mod_Freq)));
axis([0, 215000, 0, 130000]);

Filtered_Signal = Mod_Freq .* HW3_Filter(f, 166000, 183000);
figure(2);
plot(f,abs(fftshift(Filtered_Signal)));
axis([-183000, 183000, 0, 60000]);

% Past this point, there's no more need to customize code. The code below
% this point is generalizable to every signal being filtered out.

filtered_signal = real(ifft(Filtered_Signal));
figure(3);
plot(f,abs(fftshift(filtered_signal)));

t = (0:Len-1) / Fs;
demod_signal = filtered_signal .* (2*cos(2*pi*fk*t));
figure(4);
plot(t, demod_signal);

Demod_Signal = fft(demod_signal);
figure(5);
plot(f, abs(fftshift(Demod_Signal)));
axis([-7000, 7000, 0, 60000]);

Message = Demod_Signal .* HW3_Filter(f, -7000, 7000);

message = real(ifft(Message));
figure(6);
plot(t, message);

% mod_play(message);

%% Ninth Audio
clear
clc

load mod;
load noisy;

k = 9;
fk = 25000*(k - 1);

Len = length(mod);
Fs = 811025;
f = Fs*(-Len/2:Len/2-1)/Len;
Mod_Freq = fft(mod);
Noisy_Freq = fft(noisy);

figure(1);
plot(f,abs(fftshift(Mod_Freq)));
axis([0, 215000, 0, 130000]);

Filtered_Signal = Mod_Freq .* HW3_Filter(f, 195000, 205000);
figure(2);
plot(f,abs(fftshift(Filtered_Signal)));
axis([-206000, 206000, 0, 6000]);

% Past this point, there's no more need to customize code. The code below
% this point is generalizable to every signal being filtered out.

filtered_signal = real(ifft(Filtered_Signal));
figure(3);
plot(f,abs(fftshift(filtered_signal)));

t = (0:Len-1) / Fs;
demod_signal = filtered_signal .* (2*cos(2*pi*fk*t));
figure(4);
plot(t, demod_signal);

Demod_Signal = fft(demod_signal);
figure(5);
plot(f, abs(fftshift(Demod_Signal)));
axis([-7000, 7000, 0, 60000]);

Message = Demod_Signal .* HW3_Filter(f, -7000, 7000);

message = real(ifft(Message));
figure(6);
plot(t, message);

% mod_play(message);
