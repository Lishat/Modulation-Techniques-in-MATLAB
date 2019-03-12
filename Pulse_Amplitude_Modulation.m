clc
clear all
close all
%%
Vm = 1;
Vp = 2;
w = 1;
samp_freq = 1200;
t = 0:(1/(samp_freq)):3;
f = Vm*sin(2*pi*w*t);
figure;
subplot(3, 1, 1);
plot(t, f, 'Linewidth', 3);
ylim([-Vm-1, Vm + 1]);
title('Original Signal');
xlabel('Time');
ylabel('Amplitude');
len = length(t);
s(1:len) = 0;
frequency = 75;
for i = 1:frequency
    s(((len-1)/frequency*(i-1)+1):((len-1)/frequency*(i-1)+(len-1)/(2*frequency))) = Vp;
end;
subplot(3, 1, 2);
plot(t, s, 'Linewidth', 3);
title('Carrier Signal');
xlabel('Time');
ylabel('Amplitude');
ylim([-Vp-1, Vp + 1]);
pam(1:len) = 0;
for i = 1:frequency
    pam(((len-1)/frequency*(i-1)+1):((len-1)/frequency*(i-1)+(len-1)/(2*frequency))) = f((len-1)/frequency*(i-1)+1:(len-1)/frequency*(i-1)+(len-1)/(frequency*2)) * Vp;
end;
subplot(3, 1, 3);
plot(t, pam, 'Linewidth', 3);
xlabel('Time');
ylabel('Amplitude');
ylim([-Vp*Vm-1, Vp*Vm + 1]);
title('Pulse Amplitude Modulated Signal');