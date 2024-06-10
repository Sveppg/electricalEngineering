clc
clearvars

% Zusatzaufgabe 2

alpha_PTC = 3.908e-3;
R0_PTC = 150;
U_ges = 5;
U_ptc_MAX = 3.3;
T_MAX = 500;

calculate_PTC_R = @(T) R0_PTC * (1 + alpha_PTC * T); %Den Widerstand vom PTC errechnen.

R_ptc_MAX = calculate_PTC_R(T_MAX);

R_v = (U_ptc_MAX * R_ptc_MAX) / (U_ges + U_ptc_MAX);

disp(['Der dimensionierte Vorwiderstand beträgt ' num2str(R_v) ' Ohm.']);


temperatures = 0:500;
resistance = calculate_PTC_R(temperatures);
voltages = U_ptc_MAX * resistance ./ (U_ges + U_ptc_MAX);

figure;
plot(temperatures, voltages, 'LineWidth', 2);

hold on;
R_at_20C = calculate_PTC_R(20);
U_at_20C = U_ptc_MAX * R_at_20C / (U_ges + U_ptc_MAX);
plot(20, U_at_20C, 'ro', 'MarkerSize', 10);

hold off;

xlabel('Temperatur (°C)');
ylabel('Spannung am PTC-Widerstand in Abhängigkeit von der Temperatur');
grid on;
legend('Spannung-Temperatur-Kurve','Widerstand bei 20°C', 'Location', 'Best');

R_at_75C = calculate_PTC_R(75);
disp(['Der Widerstand des PTC bei 75 Grad Celsius beträgt etwa ' num2str(R_at_75C) ' Ohm.']);



% Berechnung des dimensionierten Vorwiderstands
R_v = (U_ptc_MAX * R_ptc_MAX) / (U_ges + U_ptc_MAX);

% Berechnung des Widerstands des PTC bei 0 Grad Celsius
R_at_0C = calculate_PTC_R(75);

% Gesamtwiderstand
R_ges = R_v + R_at_0C;

% Berechnung der Spannung am PTC bei 0 Grad Celsius
U_PTC_at_0C = U_ges * R_at_0C / R_ges;

disp(['Die Spannung am PTC bei 75 Grad Celsius beträgt etwa ' num2str(U_PTC_at_0C) ' Volt.']);


% Berechnung des Widerstands des PTC bei 75 °C
R_PTC_75C = calculate_PTC_R(75);

% Gesamtwiderstand bei 75 °C
R_ges_75C = R_v + R_PTC_75C;

% Berechnung des Stroms
I_PTC = U_ptc_MAX / R_ges_75C;

% Berechnung des Spannungsabfalls über dem PTC-Widerstand bei 75 °C
Delta_U_PTC_75C = I_PTC * R_PTC_75C;

disp(['Der Spannungsabfall über dem PTC-Widerstand bei 75 °C beträgt etwa ' num2str(Delta_U_PTC_75C) ' Volt.']);
