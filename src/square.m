function x = square(amplitude, fs, duration, adjustment)
% square: generates a square wave

% amplitude is amplitude of wave
% fs is sampling frequeney (points per second)
% duration is time in seconds
    
    length = fs.Value * duration.Value;
    x3 = (1:length); % Square Wave
    adjustmentValue = 10*adjustment.Value;
    
    for B = 1:length
        a = 0;
            for k = 1:(2*adjustmentValue)
                k2 = 2*k - 1;
                a = a + sin(k2*pi*B/500)/k2;
            end
        x3(B) = (a*2/pi + 0.5)*amplitude.Value;
    end
    x = x3;
end