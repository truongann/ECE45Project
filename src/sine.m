function x = sine(duration, fs)
% sine: returns a matrix representing a sine wave

% amplitude is amplitude of wave
% fs is sampling frequency (ie how many points we look at per second)
% duration is time in seconds
    
    Length = fs.Value * duration.Value; % length of matrix
    wave = (1:Length); % Sine Wave
    T = 1/fs.Value; % sampling period, the time between two entries in matrix
   
    for i = 1:Length
        t = T*i; % this is the time at each point
        wave(i) = sin(2*pi*t);
    end
    
    x = wave;
end