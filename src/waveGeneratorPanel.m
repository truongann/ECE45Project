function waveGeneratorPanel

fig = uifigure;
pnl = uipanel(fig, 'Position', [5 5 500 400], 'Title', 'Wave Configuration Controls');
sldVolume = uislider(pnl,'Position',[100 50 150 3]);
uitextarea(pnl,'Editable', 'Off','Position',[15 40 72 20] , 'Value', {'Volume'});

sldDuration = uislider(pnl,'Position',[100 100 150 3], 'Limit', [1 20]);
uitextarea(pnl,'Editable', 'Off','Position',[15 90 72 20] , 'Value', {'Duration'});

fs = uislider(pnl,'Position',[100 150 150 3], 'Limit', [8000 30000]);
uitextarea(pnl,'Editable', 'Off','Position',[15 125 72 40] , 'Value', {'Sample Freq'});

sldAdjustment = uislider(pnl,'Position',[100 200 150 3], 'Limit', [1 100]);
uitextarea(pnl,'Editable', 'Off', 'Position',[15 190 72 20] , 'Value', {'Adjustment'});

DP = uidropdown(pnl, 'Position', [15, 250, 130, 25], 'Items', {'Saw Tooth Wave'   'Hilly Wave'   'Square Wave'});

uibutton(pnl, 'Position', [350 150 100 25], 'Text', {'Play Sound'}, 'ButtonPushedFcn', @(button,event) playSound(sldDuration, sldAdjustment, sldVolume, fs, DP));
uibutton(pnl, 'Position', [350 100 100 25], 'Text', {'Plot Wave'}, 'ButtonPushedFcn', @(button,event) plotWave(fs));


end
