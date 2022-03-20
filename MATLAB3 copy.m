%% Plot modulated and unmodulated signals
load('noisy.mat')
load('mod.mat')

tiledlayout(2,1);

len = length(noisy);
Fs = 811025;
f = Fs*(-len/2:len/2-1)/len;

%Unmodulated signal
nexttile;
plot(f, abs(fftshift(fft(noisy))));
xlabel('Frequency (Hz)'); ylabel('Amplitude');
title('Unmodulated signal');

%Modulated signal
len = length(mod);
f = Fs*(-len/2:len/2-1)/len;
mod_freq = fft(mod);

nexttile;
plot(f,abs(fftshift(mod_freq)));
xlabel('Frequency (Hz)'); ylabel('Amplitude');
title('Modulated signal');

%% Seperate and plot all 9 messages

load('mod.mat')
len = length(mod);
Fs = 811025;
f = Fs*(-len/2:len/2-1)/len;
t = (0:len-1)/Fs;
mod_freq = fft(mod);

tiledlayout(3,3);

for k = 1:9
    % A and B represent the domain of each message in the frequency
    % domain.
    A = (-0.125+0.25*(k-1))*10^5; 
    B = (0.125+0.25*(k-1))*10^5;

    
    filteredW = mod_freq.*HW3_Filter(f, A, B); %filter out everything except the message
    filteredT = real(ifft(filteredW)); %convert to time domain
    fk = 25000*(k-1);

    demodSignalT = filteredT.*(2*cos(2*pi*fk*t)); %demodulate the signal in the time domain
    demodSignalW = fft(demodSignalT); %convert back to frequency domain

    messageW = demodSignalW.*HW3_Filter(f, 0, B-A); %filter out extra frequencies from the demodulating
    
    %plot
    nexttile;
    plot(f,abs(fftshift(messageW)));
    xlim([0,6000])
    title("message " + k);
    xlabel("Freqency (Hz)");
    ylabel("Amplitude");

    messageT = real(ifft(messageW));
    mod_play(messageT); %play message
    pause(length(messageT)/Fs);                           

end

