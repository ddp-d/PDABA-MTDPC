clc;
clear;
close all;

%% Прямий канал
num1 = [0 2 0.5];
den1 = [4 4 4 1];
Wpz = tf(num1, den1);

%% Зворотний зв'язок
Wzz = tf([20 1], [20 0]); % (20p+1)/(20p)

%% Замкнена система
W = feedback(Wpz, Wzz);

%% Частотний діапазон
w = logspace(-2, 2, 1000);

%% Частотна характеристика
[Re, Im, w] = nyquist(W, w);

Re = squeeze(Re);
Im = squeeze(Im);

A = sqrt(Re.^2 + Im.^2);      % АЧХ
phi = atan2(Im, Re) * 180/pi; % ФЧХ

%% --- АЧХ ---
figure;
semilogx(w, A, 'LineWidth', 1.5);
grid on;
xlabel('\omega, рад/с');
ylabel('A(\omega)');
title('АЧХ системи');

%% --- ФЧХ ---
figure;
semilogx(w, phi, 'LineWidth', 1.5);
grid on;
xlabel('\omega, рад/с');
ylabel('\phi(\omega), град');
title('ФЧХ системи');

%% --- АФЧХ (годограф) ---
figure;
plot(Re, Im, 'LineWidth', 1.5);
grid on;
xlabel('Re');
ylabel('Im');
title('АФЧХ системи');
