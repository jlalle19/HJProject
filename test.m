%%TESTING
clear; clc; close all;

%Importing file to a sizeA x 64 array
NAME_TYPE = 'int16';
SIZE_TYPE = 2;  %Bytes per int
[FileName,PathName] = uigetfile('*.bin','Select a data file');
fileID = fopen(FileName,'r');
if(fileID < 0)
    error('File not found, please place binary file in repository.')
end
fseek(fileID, 0, 'eof');
sizeA  = fix(ftell(fileID) / SIZE_TYPE)/64;
fseek(fileID, 0, 'bof');
file = fread(fileID, [sizeA,64], NAME_TYPE);

%%Scaleing file to scaleing factor SCALE_FACTOR
SCALE_FACTOR = 3.05185094759972*10^(-05); %Conversion factor from short to mV
file = double(file)*SCALE_FACTOR;



fclose(fileID);