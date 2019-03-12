clc
close all
clear all
%%
t = -5:0.01:5;
f_c = 0.15;
f_m = 0.7;
v_c_amplitude = 2;
v_m_amplitude = 1;
m = v_m_amplitude/v_c_amplitude;
v_c = v_c_amplitude*sin(2*pi*f_c*t);
v_m = v_m_amplitude*sin(2*pi*f_m*t);
v_am = v_c_amplitude*(1+m*sin(2*pi*f_c*t)).*sin(2*pi*f_m*t);
figure;
subplot(3, 1, 1);
plot(t, v_c);
subplot(3, 1, 2);
plot(t, v_m);
subplot(3, 1, 3);
plot(t, v_am);