function sum = superposition(selectedWave, sldDuration, fs)

    baseSine = sine(sldDuration, fs);

    sum = baseSine + selectedWave;
end