clc;
clear;
close all;

%% Початкове рівняння
a = [1 5 10 14 5 7];
sys = tf(1, a);

%% Нове рівняння на границі стійкості
a_new = [1 5.0735 10.3718 14.7119 5.8456 6.9842];
sys_new = tf(1, a_new);

%% Критерій Михайлова
w = 0:0.01:10;
jw = 1j*w;
D = polyval(a, jw);

figure;
plot(real(D), imag(D), 'LineWidth', 1.5);
grid on;
xlabel('Re D(j\omega)');
ylabel('Im D(j\omega)');
title('Критерій Михайлова');

%% Перехідна характеристика початкової системи
t1 = 0:1:1600;
[y1, t1] = step(sys, t1);

figure;
plot(t1, y1, 'LineWidth', 1.2);
grid on;
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Перехідна характеристика початкової системи');

%% Перехідна характеристика системи на границі стійкості
t2 = 0:0.01:80;
[y2, t2] = step(sys_new, t2);

figure;
plot(t2, y2, 'LineWidth', 1.2);
grid on;
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Перехідна характеристика системи на границі стійкості');
xlim([0 80]);
