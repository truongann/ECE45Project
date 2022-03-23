function playSound(sldDuration, sldAdjustment, sldVolume)

x1 = (1:4000*sldDuration.Value + 1); % Saw Tooth Wave
x2 = (1:4000*sldDuration.Value + 1); % Hilly Wave
x3 = (1:4000*sldDuration.Value + 1); % Square Wave

adjustmentValue = 10*sldAdjustment.Value + 1;

% This series of for-loops for the starting functions all are the equations
% for the starting function translated to into MATLAB code. Each one starts
% off by creating a variable B that is used to access and modify each
% element in the 4000-element arrays above. Next we declare a variable 'a'
% to use for summation calculation later. The second for loop is all of the
% computation needed for summation, continuously being added. Lastly the 
% constant parts are added to the complete that element's calculation for
% the starting function in question.

for B = 1:4000 
    a = 0;
    for k = 1:adjustmentValue
        a = a + sin(pi*k*(1/500)*B)/k;
    end
    x1(B) = (a*(-1/pi) + 0.5)*sldVolume.Value;
end

for B = 1:4000 
    a = 0;
    for k = 1:adjustmentValue
        a = a + cos(pi*k*B/500)/(4*k^2-1);
    end
    x2(B) = (a*(-4/pi) + 2/pi)*sldVolume.Value;
end

for B = 1:4000 
    a = 0;
    for k = 1:(2*adjustmentValue)
        k2 = 2*k - 1;
        a = a + sin(k2*pi*B/500)/k2;
    end
    x3(B) = (a*2/pi + 0.5)*sldVolume.Value;
end

sldVolume.Value = 50;
end
