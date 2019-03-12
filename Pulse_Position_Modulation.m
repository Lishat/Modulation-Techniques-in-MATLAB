clc
clear all;
close all;
%%
Vm = 1;
w = 1;
Vp = 2;
samp_freq = 1200;
t = 0:(1/samp_freq):3;
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
frequency = 60;
for i = 1:frequency
    s(((len-1)/frequency*(i-1)+1):((len-1)/frequency*(i-1)+(len-1)/(2*frequency))) = Vp;
end;
subplot(3, 1, 2);
plot(t, s, 'Linewidth', 3);
ylim([-1, Vp + 1]);
title('Carrier Signal');
xlabel('Time');
ylabel('Amplitude');
ppm(1:len) = 0;
p = (len-1)/(4*frequency);
for i = 1:frequency
    ppm(((len-1)/frequency)*(i-1) + (floor((f(((len-1)/frequency)*(i-1)+1) + 1)*p)+1) : ((len-1)/frequency)*(i-1) + (floor((f(((len-1)/frequency)*(i-1)+1) + 1)*p)+1) + ((len-1)/(2*frequency))) = Vp; 
end;
period(1:len) = 0;
for i = 1:frequency
    period(((len-1)/frequency)*(i)+1) = Vp+1;
end;
subplot(3, 1, 3);
plot(t, ppm, 'Linewidth', 3);
hold on;
stem(t, period,'--', 'MarkerSize', 1, 'Linewidth', 2);
legend('Pulse Position Modulated Wave','Time Period');
ylim([0, Vp + 1]);
xlabel('Time');
ylabel('Amplitude');
title('Pulse Position Modulated Signal');