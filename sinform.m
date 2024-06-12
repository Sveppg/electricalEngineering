clc;
clearvars;

% Parameter
f = 50; % Frequenz in Hz
T = 1 / f; % Periode in Sekunden
omega = 2 * pi * f; % Winkelgeschwindigkeit
t = linspace(0, 2 * T, 1000); % Zeitvektor über zwei Perioden

% Spannung und Strom
U0 = 1; % Maximale Spannung (Amplitude)
I0 = 1; % Maximaler Strom (Amplitude)

% Spannungskurve (Sinusfunktion)
u = U0 * sin(omega * t);

% Stromkurve (Sinusfunktion, um 90° phasenverschoben)
i = I0 * sin(omega * t - pi / 2);

% Plot
figure;
hold on;
plot(t, u, 'b', 'DisplayName', 'Spannung u(t)');
plot(t, i, 'r', 'DisplayName', 'Strom i(t)');
xlabel('Zeit (s)');
ylabel('Amplitude');
title('Spannung und Strom eines induktiven Blindwiderstands');
legend;
grid on;
hold off;
