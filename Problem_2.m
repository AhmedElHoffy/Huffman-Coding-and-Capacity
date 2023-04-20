%% Ahmed Ismail El Hoofy 016152095
% lab #1
% %Problem #2
clc;
clear;
SNo_mag=(db2mag(-20):1:db2mag(30));
BW=5*10^3;
C=BW*log2(1+(SNo_mag/BW));
%% a)- plot#1 of S/N0 array
figure(1)
plot(SNo_mag,C,'G','linewidth',2);
xlabel('S/No');
ylabel('Channel Capacity');
title('Channel Capacity Vs transmitted power and noise ');
legend('C-Capacity');

%% b)- plot#2 of BW array
BW_array=(5:5:100)*10^3;
SNo_Value=db2mag(25);
C2=BW_array.*log2(1+(SNo_Value./BW_array));

figure(2)
plot(BW_array,C2,'r','linewidth',2);
xlabel('BW-array');
ylabel('Channel Capacity');
title('Channel Capacity Vs different BW Frequeincies ');
legend('C-Capacity');

%% c)- Limiting Value of capacity as B--> inf
C_limit=SNo_Value/log(2);
fprintf('the capacity limit = %f \n',C_limit);
%% d)- Eb/N0 function
syms C3B EbN0

Eb=( (2^(C3B)-1)/(C3B) );

figure(3)
fplot(Eb,C3B,'c','linewidth',2);
xlabel('Eb/N0');
ylabel('C/B');
title('Channel Capacity/BW   VS   Energy/Noise ');
legend('C/B vs Eb/N0');
