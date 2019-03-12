clc
clear all
close all
%%
t = -1:0.001:1;
f_c = 10;
f_m = 1;
k = 20;
v_c_amplitude = 2;
v_m_amplitude = 1;
phase = 30*pi/180;
v_c = v_c_amplitude*sin(2*pi*f_c*t);
v_m = v_m_amplitude*sin(2*pi*f_m*t);
v_pm = v_c_amplitude*sin(2*pi*f_c*t + phase +(k*v_m_amplitude).*cos(2*pi*f_m*t));
figure;
subplot(3, 1, 1);
plot(t, v_c);
xlabel('Carrier Wave');
subplot(3, 1, 2);
plot(t, v_m);
xlabel('Modulating Wave');
subplot(3, 1, 3);
plot(t, v_pm);
xlabel('Resultant Wave');