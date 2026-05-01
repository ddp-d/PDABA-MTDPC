% MATLAB-код для побудови годографа Найквіста при заданому k
w = 0:0.001:2;
p = 1i.*w;

k = 1;   % номінальне значення
W1 = (2.*p + 0.5).*exp(-p)./(4.*p.^3 + 4.*p.^2 + 10.*p + 1);
W2 = k + 1./(50.*p);

W = W1.*W2;

Re = real(W);
Im = imag(W);

figure;
plot(Re, Im, 'LineWidth', 1.5);
hold on;
plot(-1, 0, 'bo');
xlabel('Re');
ylabel('Im');
title('Годограф Найквіста, 1-й випадок');
grid on;


% Годограф Найквіста, 2-й випадок, MATLAB-код
w = 0:0.001:2;
p = 1i.*w;

k1 = 1;  % номінальне значення
W = k1.*(2.*p + 0.5).*exp(-p)./(4.*p.^3 + 4.*p.^2 + 10.*p + 1);

Re = real(W);
Im = imag(W);

figure;
plot(Re, Im, 'LineWidth', 1.5);
hold on;
plot(-1, 0, 'bo');
xlabel('Re');
ylabel('Im');
title('Годограф Найквіста, 2-й випадок');
grid on;


% MATLAB-код для лінії D-розбиття
w = -4:0.001:4;
p = 1i.*w;

k = -((2.*p + 0.5).*exp(-p) + 200.*p.^4 + 200.*p.^3 + 500.*p.^2 + 50.*p) ...
    ./ ((100.*p.^2 + 25.*p).*exp(-p));

figure;
plot(real(k), imag(k), 'LineWidth', 1.5);
xlabel('Re(k)');
ylabel('Im(k)');
title('D-розбиття за параметром k');
grid on;




% MATLAB-код для D-розбиття за k_1
w = -4:0.001:4;
p = 1i.*w;

k1 = -(4.*p.^3 + 4.*p.^2 + 10.*p + 1) ...
     ./ ((2.*p + 0.5).*exp(-p));

figure;
plot(real(k1), imag(k1), 'LineWidth', 1.5);
xlabel('Re(k1)');
ylabel('Im(k1)');
title('D-розбиття за параметром k1');
grid on;



% Стійка система, 1-й випадок (k=1)
s = tf('s');

Wpz = (2*s + 0.5)/(4*s^3 + 4*s^2 + 10*s + 1);
Wpz.InputDelay = 1;

k = 1;
Wzz = k + 1/(50*s);

Wcl = feedback(Wpz, Wzz);

figure;
step(Wcl);
grid on;
title('Стійка система, канал завдання-вихід, 1-й випадок');



% Межа стійкості, 1-й випадок (k=2.711)
s = tf('s');

Wpz = (2*s + 0.5)/(4*s^3 + 4*s^2 + 10*s + 1);
Wpz.InputDelay = 1;

k = 2.711;
Wzz = k + 1/(50*s);

Wcl = feedback(Wpz, Wzz);

figure;
step(Wcl, 200);
grid on;
title('Система на межі стійкості, канал завдання-вихід, 1-й випадок');




% Стійка система, 2-й випадок (k_1=1)
s = tf('s');

Wpz = (2*s + 0.5)/(4*s^3 + 4*s^2 + 10*s + 1);
Wpz.InputDelay = 1;

k1 = 1;
Wcl = feedback(Wpz, k1);

figure;
step(Wcl);
grid on;
title('Стійка система, канал завдання-вихід, 2-й випадок');




% Межа стійкості, 2-й випадок (k_1=2.713)
s = tf('s');

Wpz = (2*s + 0.5)/(4*s^3 + 4*s^2 + 10*s + 1);
Wpz.InputDelay = 1;

k1 = 2.713;
Wcl = feedback(Wpz, k1);

figure;
step(Wcl, 200);
grid on;
title('Система на межі стійкості, канал завдання-вихід, 2-й випадок');







