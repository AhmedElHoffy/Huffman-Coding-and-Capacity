clc; 
clear;
syms C3B EbN0
% BW_array=(5:5:100)*10^3;
% B3=BW_array;
Eb=( (2^(C3B)-1)/(C3B) );

fplot(Eb,C3B);
xlabel('Eb/N0');
ylabel('C/B');
title('Channel Capacity/BW   VS   Energy/Noise ');
