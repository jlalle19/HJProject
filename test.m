%%TESTING
clear; clc; close all;

fileID = fopen('TestChannels.bin','r');

%StackOverflow
NAME_TYPE = 'int16';
SIZE_TYPE = 2;  %Bytes per int
fseek(fileID, 0, 'eof');
sizeA  = fix(ftell(fileID) / SIZE_TYPE)/64;
fseek(fileID, 0, 'bof');
file = fread(fileID, [sizeA,64], NAME_TYPE)


fclose(fileID);