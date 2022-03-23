%% Problem 1
clc  
clear
% First load in the array "sum" that includes the discreet points
% The kth entry of sum is the sum of the first k entries of z.
% sum[k] = z[1] + z[2] + z[3] + ... + z[k]
load sum

% Next play the sounds with the command "sound(z, Fs)" where z is the audio
% message stored in discreet points while sum is the sum of those points
% and Fs is the desire frequency. (Mac's default frequency should be 8k Hz)

% Fs = 11025
% sound(z, Fs)

% but we want to find z so we know: 
% z[1] = sum[1] and z[n] = sum[n] −sum[n −1] for n ≥2
% So we should use a for loop
for n = 2:length(sum),
    z(n) = sum(n) - sum(n-1);
end;

% Starting from 2 to the end of the array of sum, store the correct
% discreet points in z by subtracting the sum(n-1) from sum(n). This will
% give us z(n).

% Next make a variable N that stores the number of elements in the sum
% array and then make another array that has each element store the place
% they're in and then divide each element by the frrequency used in sound
N = length(sum);
t = (1:N)/11025;

% Creates a figure and then stores a plot that the points of z across t
figure(1)
plot(t, z)

% Labels the x and y axis
xlabel('Time (seconds)')
ylabel('Amplitude')

% The higher the frequency is set, the faster and higher the pitch the
% audio will be. The lower the frequency is set, the slower and lower the
% pitch the audio will be.

% Adjust the way you would like
Fs = 11025;
% sound(z, Fs)

% multiplying sound wave will affect volume
% sampling frequency will affect the pitch
% sld = uislider will spawn a slider

%% Probelm 2
clc


load sum;

for n = 2:length(sum),
    z(n) = sum(n) - sum(n-1);
end;

N = length(sum);
t = (1:N)/11025;

Fs = 11025;

fig = uifigure;
pnl = uipanel(fig, 'Position', [150 180 260 221], 'Title', 'Wave Configuration Controls');
sldVolume = uislider(pnl,'Position',[80 50 150 3]);
txaVolume = uitextarea(pnl,'Editable', 'Off','Position',[0 40 72 20], 'Value', {'Volume'});

sldDuration = uislider(pnl,'Position',[80 100 150 3]);
txaDuration = uitextarea(pnl,'Editable', 'Off','Position',[0 90 72 20] , 'Value', {'Duration'});

sldAdjustment = uislider(pnl,'Position',[80 150 150 3]);
txaAdjustment = uitextarea(pnl,'Editable', 'Off', 'Position',[0 140 72 20] , 'Value', {'Adjustment'});

DP = uidropdown(pnl, 'Position', [5, 170, 130, 25], 'Items', {'Saw Tooth Wave'   'Hilly Wave'   'Square Wave'})

%sldVolume = uislider
%sldDuration = uislider
%sldAdjustment = uislider

sldDuration.Value = 1
sldVolume.Value = 1
sldAdjustment.Value = 1

% These are the starting functions and they all have 4000 elements. The
% adjustmentValue variable controls the variable N that is used in the
% problem to compute the summation.

x1 = (1:4000*sldDuration.Value); % Saw Tooth Wave
x2 = (1:4000*sldDuration.Value); % Hilly Wave
x3 = (1:4000*sldDuration.Value); % Square Wave

adjustmentValue = 10*sldAdjustment.Value;

% This series of for-loops for the starting functions all are the equations
% for the starting function translated to into MATLAB code. Each one starts
% off by creating a variable B that is used to access and modify each
% element in the 4000-element arrays above. Next we declare a variable 'a'
% to use for summation calculation later. The second for loop is all of the
% computation needed for summation, continuously being added. Lastly the 
% constant parts are added to the complete that element's calculation for
% the starting function in question. If you have any questions, email 
% "Daddy" at this address "jlapidar@ucsd.edu" to get help ;)

for B = 1:40000, 
    a = 0;
    for k = 1:adjustmentValue,
        a = a + sin(pi*k*(1/500)*B)/k;
    end;
    x1(B) = (a*(-1/pi) + 0.5)*sldVolume.Value;
end;

for B = 1:40000, 
    a = 0;
    for k = 1:adjustmentValue,
        a = a + cos(pi*k*B/500)/(4*k^2-1);
    end;
    x2(B) = (a*(-4/pi) + 2/pi)*sldVolume.Value;
end;

for B = 1:4000, 
    a = 0;
    for k = 1:(2*adjustmentValue),
        k2 = 2*k - 1;
        a = a + sin(k2*pi*B/500)/k2;
    end;
    x3(B) = (a*2/pi + 0.5)*sldVolume.Value;
end;


%%
t = (1:sldDuration.Value)/adjustmentValue;

figure(1)
title('X1')
plot(t, x1)

figure(2)
title('X2')
plot(t, x2)

figure(3)
title('X3')
plot(t, x3)

figure(4)
title('X1 + X2')
x4 = x1 + x2;
plot(t, x4)

Fs = 2*pi

% As the adjustment value gets larger the more rigid and less smooth the
% signal will become. Such as there will be an increase in sharp edges.

%sound(x4, 4000)

% Number of Samples = Duration
% Magnitude of Fs = Speed
% Magnitude of wave values = Volume

fig = uifigure;
pnl = uipanel(fig);
sld1 = uislider(pnl,'Position',[80 50 150 3]);
txa1 = uitextarea(pnl,'Editable', 'Off','Position',[0 40 72 20] , 'Value', {'Volume'});

sld2 = uislider(pnl,'Position',[80 100 150 3]);
txa2 = uitextarea(pnl,'Editable', 'Off','Position',[0 90 72 20] , 'Value', {'Duration'});

sld3 = uislider(pnl,'Position',[80 150 150 3]);
txa3 = uitextarea(pnl,'Editable', 'Off', 'Position',[0 140 72 20] , 'Value', {'Adjustment'});





%% Practice
clc
clear
[waveform, fs] = audioread('Surprise.wav');

N = length(waveform);
t = (0:N - 1)/fs;
figure(1);
plot(t, waveform(:,1));
figure(2);
plot(t, waveform(:,2));

%sound(waveform(:,2), fs)


%% Practice online
clear
clc

 Fs=100000;
 %Ts=1/Fs;
 Ts = 0.5/549;
 t=[0:Ts:0.5]; % Adjusting the end bounds will make the signal longer
 F_A=440; %Frequency of note A is 440 Hz
 A=sin(pi*F_A*t);
 
 % for x = (1:10),
 %    sound(A,Fs);
 %    pause(1);
 % end;

x3 = (1:550);
adjustmentValue = 10000;

for B = 1:550, 
    a = 0;
    for k = 1:(2*adjustmentValue - 1),
        k2 = 2*k - 1;
        a = a + sin(k2*pi*B/500)/k2;
    end;
    x3(B) = a*2/pi + 0.5;
end;

figure(2)
plot(t, x3)

% sound(x3, 1000);
 for N = (1:3),
    sound(x3, 1000);
    pause(2)
 end;

%%


for N = (1:1000), 
    
end

















