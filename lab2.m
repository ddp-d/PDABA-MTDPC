clc;
clear;
close all;

%% Параметри ланок
K1 = 1.4;
T1 = 16;
K2 = 0.4;
K3 = 1;      % прийнято, оскільки у вихідних даних не задано
K4 = 0.4;
T4 = 24;

%% Загальна передавальна функція системи
% W(p) = ((K1/(T1*p+1)) - K2) * K3 * (K4/(T4*p+1))

num = 0.4 * K3 * [-6.4 1];
den = conv([16 1], [24 1]);

Wsys = tf(num, den);

disp('Загальна передавальна функція системи:');
Wsys

%% Досліджувана ланка 1
t = 0:0.1:100;
h = K1 * (1 - exp(-t/T1));
w_t = (K1/T1) * exp(-t/T1);

omega = logspace(-3, 1, 1000);
W1 = K1 ./ (1 + 1j*T1*omega);

A = abs(W1);
phi = angle(W1) * 180/pi;
U = real(W1);
V = imag(W1);

%% Перехідна характеристика
figure;
plot(t, h, 'LineWidth', 1.5);
grid on;
xlabel('t, c');
ylabel('h(t)');
title('Перехідна характеристика ланки 1');

%% Вагова характеристика
figure;
plot(t, w_t, 'LineWidth', 1.5);
grid on;
xlabel('t, c');
ylabel('w(t)');
title('Вагова характеристика ланки 1');

%% АЧХ
figure;
semilogx(omega, A, 'LineWidth', 1.5);
grid on;
xlabel('\omega, рад/с');
ylabel('A(\omega)');
title('АЧХ ланки 1');

%% ФЧХ
figure;
semilogx(omega, phi, 'LineWidth', 1.5);
grid on;
xlabel('\omega, рад/с');
ylabel('\phi(\omega), град');
title('ФЧХ ланки 1');

%% АФЧХ
figure;
plot(U, V, 'LineWidth', 1.5);
grid on;
xlabel('U(\omega)');
ylabel('V(\omega)');
title('АФЧХ ланки 1');
