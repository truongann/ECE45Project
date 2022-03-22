function superposition(selectedWave, sldDuration, sldAdjustment, sldVolume)

baseSine = sine(sldAdjustment, sldDuration);

superposition = baseSine + selectedWave;
