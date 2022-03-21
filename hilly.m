function x = hilly(amplitude, freq, phase, fs, duration, duty);
% sine: returns a matrix representing a hilly wave (absolute sine)
% Author: Ann Truong

% amplitude is amplitude of wave
% freq is frequency of wave
% phase shift is given in periods
% fs is sampling frequency (ie how many points we look at per second)
% duration is time in seconds
% duty is on/off time (not applicable to sinusoids, but included for 
%   uniformity w other wave generating functions)

    length = fs * duration; % length of matrix
    T = 1/fs; % sampling period, the time between two entries in matrix

    % generates a 1D matrix w specified length and # of entries
    wave = linspace(0, length, fs);
    
    % populates the matrix we just made. you can think of this matrix as a
    % table, where each entry is the y-value that corresponds to x*i on the
    % x-axis. since the x-axis is evenly spaced, we leave out that info.
    for i = 0:length-1
        t = T*i; % this is the time at each point
        wave(i) = amplitude * abs(sin(2*pi*freq*t - phase));
    end
    
    x = wave;
end