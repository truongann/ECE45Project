function x = square(amplitude, freq, phase, fs, duration, duty)
% square: generates a square wave
% Author: Rebecca Wong

% amplitude is amplitude of wave
% freq is frequency of wave
% phase shift is given in periods
% fs is sampling frequeney (points per second)
% duration is time in seconds
% duty controls on/off time; 
%   it is the percentage of a waveform that occurs above the zero axis (+amplitude)
%   duty of 0.5 will return a propper square wave (equal time at + and - amplitude)

    length = fs * duration; % length of matrix
    T = 1/fs; % period 
    x = zeros(1, length); % generates matrix of size 1 by length
    
    for i = 1:n
        t = i*T; % exact time of point
    
        st = mod(freq * t - phase, 1); % remainder after dividing by 1
        
    
        if(st < duty)
            x(i) = amplitude;
        else
            x(i) = -amplitude;
        end
    end
end

    
