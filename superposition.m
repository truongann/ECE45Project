function superposition(selectedWave, sldDuration, sldAdjustment, sldVolume)

baseSine = sine(sldAdjustment, sldDuration);

sum = baseSine + selectedWave;