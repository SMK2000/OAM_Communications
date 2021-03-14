% Simple UCA
% Design params
freq = 10e9;
c = physconst('lightspeed');
lambda = c/freq;
z0 = 50; % Characteristic impedance
substr = 'FR4';
conductor = 'Copper';

% Patch parameters
patch_length = 75e-3;
patch_width = 37e-3;
gndplane_length = 120e-3;
gndplane_width = 120e-3;
feed =0;

% Defining element patch
antenna= patchMicrostrip('Length',patch_length, 'Width',patch_width,'GroundPlaneLength',gndplane_length, 'GroundPlaneWidth',gndplane_width);

% Defining UCA 
uca_rad = 0.6*lambda;
uca1 = phased.UCA('NumElements',8,'Radius', uca_rad,'Element', antenna);

% Plot radiation pattern at Operating Frequency
pattern(uca1, freq); 
figure;

% Show antenna
show(antenna);

% View array geometry
figure;
viewArray(uca1);

% Voltage Standing Wave Ratio (VSWR)
vswr(antenna,freq,z0)

% Return Loss of antenna elementat 50Ohm
figure;
returnLoss(antenna,freq,z0);



