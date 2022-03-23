function x = hilly(amplitude, fs, duration)
% sine: returns a matrix representing a hilly wave (absolute sine)

% amplitude is amplitude of wave
% fs is sampling frequency (ie how many points we look at per second)
% duration is time in seconds

    length = fs.Value * duration.Value; % length of matrix
    T = 1/fs.Value; % sampling period, the time between two entries in matrix

    % generates a 1D matrix w specified length and # of entries
    wave = linspace(0, length, fs.Value);
    
    % populates the matrix we just made. you can think of this matrix as a
    % table, where each entry is the y-value that corresponds to x*i on the
    % x-axis. since the x-axis is evenly spaced, we leave out that info.
    for i = 1:length
        t = T*i; % this is the time at each point
        wave(i) = amplitude.Value * abs(sin(2*pi*t));
    end
    
    x = wave;
end