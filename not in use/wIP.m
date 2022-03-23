%% crying dying school sux
clc

load sum;

for n = 2:length(sum)
    z(n) = sum(n) - sum(n-1);
end

N = length(sum);
t = (1:N)/11025;

Fs = 11025;

fig = uifigure;
pnl = uipanel(fig, 'Position', [5 5 500 400], 'Title', 'Wave Configuration Controls');
sldVolume = uislider(pnl,'Position',[100 50 150 3]);
txaVolume = uitextarea(pnl,'Editable', 'Off','Position',[15 40 72 20] , 'Value', {'Volume'});

sldDuration = uislider(pnl,'Position',[100 100 150 3]);
txaDuration = uitextarea(pnl,'Editable', 'Off','Position',[15 90 72 20] , 'Value', {'Duration'});

sldAdjustment = uislider(pnl,'Position',[100 150 150 3]);
txaAdjustment = uitextarea(pnl,'Editable', 'Off', 'Position',[15 140 72 20] , 'Value', {'Adjustment'});

DP = uidropdown(pnl, 'Position', [15, 200, 130, 25], 'Items', {'Saw Tooth Wave'   'Hilly Wave'   'Square Wave'})

btn = uibutton(pnl, 'Position', [350 100 100 25], 'Text', {'Play Sound'}, 'ButtonPushedFcn', {'playSound'});

%sldVolume = uislider
%sldDuration = uislider
%sldAdjustment = uislider

%sldDuration.Value = 1
%sldVolume.Value = 1
%sldAdjustment.Value = 1

% These are the starting functions and they all have 4000 elements. The
% adjustmentValue variable controls the variable N that is used in the
% problem to compute the summation.










