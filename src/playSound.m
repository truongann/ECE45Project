function playSound(sldDuration, sldAdjustment, sldVolume, fs, DP)

if strcmp(DP.Value, 'Saw Tooth Wave')
    modifiedWave = saw(sldVolume, fs, sldDuration, sldAdjustment);
elseif strcmp(DP.Value, 'Hilly Wave')
    modifiedWave = hilly(sldVolume, fs, sldDuration);
elseif strcmp(DP.Value, 'Square Wave')
    modifiedWave = square(sldVolume, fs, sldDuration, sldAdjustment);
end

Final_Wave = superposition(modifiedWave, sldDuration, fs);

global waveToPlot;
waveToPlot = Final_Wave;

sound(Final_Wave, fs.Value);

end