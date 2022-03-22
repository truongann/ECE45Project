function x = sawtooth(amplitude, freq, phase, fs, duration)
% sine: returns a matrix representing a sine wave
% Author: Ann Truong

% amplitude is amplitude of wave
% freq is frequency of wave
% phase shift is given in periods
% fs is sampling frequency (ie how many points we look at per second)
% duration is time in seconds
% duty is on/off time (not applicable, but included for 
%   uniformity w other wave generating functions)

    length = fs * duration; % length of matrix
    Ts = 1/fs; % sampling period, the time between two entries in matrix
    T = 1/freq; % period of the function

    % generates a 1D matrix w specified length and # of entries
    wave = linspace(0, length, fs);
    
    % populates the matrix we just made. you can think of this matrix as a
    % table, where each entry is the y-value that corresponds to x*i on the
    % x-axis. since the x-axis is evenly spaced, we leave out that info.
    % we can think of a sawtooth wave as a linear function that "resets" 
    % periodically (ie linearly increases from one point to another, then
    % drops down to initial point and repeats)
    for i = 1:length
        t = Ts*i; % this is the time at each sampled point
        Tplace = mod(freq*t - phase, 1);
        
        wave(i) = amplitude * sawtooth(2*pi*freq*t - phase);
    end
    
    x = wave;
end