%% Ahmed Ismail El Hoofy 016152095
% lab #1
% Problem #2
clc;
clear;
SNo_mag=(db2mag(-20):1:db2mag(30));
BW=5*10^3;
C=BW*log2(1+(SNo_mag/BW));
% a)- plot#1 of S/N0 array
figure(1)
plot(SNo_mag,C,'G');
xlabel('S/No');
ylabel('Channel Capacity');
title('Channel Capacity Vs transmitted power and noise ');
legend('C-Capacity');

% % b)- plot#2 of BW array
% BW_array=(5:5:100)*10^3;
% SNo_Value=db2mag(25);
% C2=BW_array.*log2(1+(SNo_Value./BW_array));
% 
% figure(2)
% plot(BW_array,C2,'r');
% xlabel('BW-array');
% ylabel('Channel Capacity');
% title('Channel Capacity Vs different BW Frequeincies ');
% legend('C-Capacity');

% c)- Bw_maximum limitation
% syms C3 BW_limit
% C3=BW_limit.*log2(1+(SNo_Value./BW_limit));
% C3_diff=diff(C3);
% M=solve(C3_diff==0,BW_limit);
% 
% X=(solve('g*log2(1+(17.7828/g))=0','g'));