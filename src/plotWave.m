function t = plotWave(sldDuration, fs, waveform)

t = linspace(0, sldDuration.Value*fs.Value, sldDuration.Value);
    plot(t, waveform);
    xlabel("Time");
    ylabel("Amplitude");
    
end
