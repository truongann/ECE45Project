function x = plotWave(waveform, fs, duration)
% plotWave: plots a wave on a xy graph
% Author: Rebecca Wong

% when using, make sure your plot duration and fs match those of your waveform

    x = linspace(0, duration, fs*duration);
    plot(x, waveform);
    xlabel("Time");
    ylabel("Amplitude");
end
