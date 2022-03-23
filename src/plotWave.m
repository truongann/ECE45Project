function t = plotWave(fs)
global waveToPlot
figure(1)
N = length(waveToPlot);
t = (1:N)/fs.Value;
    plot(t, waveToPlot);
    xlabel("Time");
    ylabel("Amplitude");    
end