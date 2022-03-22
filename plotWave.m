function t = plotWave(sldDuration, sldAdjustment, sldVolume, fs, waveform)

t = linspace(0, sldDuration.Value, fs.Value*sldDuration.Value);
    plot(t, waveform);
    tlabel("Time");
    ylabel("Amplitude");
    
end
