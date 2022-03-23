function x = saw(volume, fs, duration, adjustment)
    
    Length = fs.Value * duration.Value;
    x1 = (1:Length); % Saw Tooth Wave
    
    adjustmentValue = 10*adjustment.Value;
    
    for B = 1:Length
        a = 0;
        for k = 1:(2*adjustmentValue)
            a = a + sin(pi*k*(1/500)*B)/k;
        end
        x1(B) = (a*(-1/pi) + 0.5)*volume.Value;
    end

    x = x1;
    
end