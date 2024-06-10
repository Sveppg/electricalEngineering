%Zusatzaufgabe Z1 a
rho=0.0179;
l = 30;
U = 12;
I = 300;
A = linspace(1, 100, 100);
R_value = rho*l ./ A;
figure;
plot(A, R_value, 'LineWidth', 2);
xlabel('Querschnittsfläche (mm²)');
ylabel('Widerstand in (ohm)');
title('Widerstand des Kabels in Abhängigkeit von dem Querschnitt')
grid on;

%Spannungsabfall berechnen
V_Drop = I * R_value;
figure;
plot(A, V_Drop, 'LineWidth', 2);
xlabel('Querschnittsfläche (mm²)');
ylabel('Spannungsabfall in Volt');
title('Spannungsabfall des Kabels über die Querschnittsfläche A')
grid on;

%Welchen Durchmesser darf das Kabel aufweisen, wenn wir folgende Bedingungen ansetzen: c

I = 300;  % Strom in Ampere
J_limit = 5;  % Grenzwert für Stromdichte in A/mm^2
Delta_U_limit = 2;  % Grenzwert für Spannungsabfall in Volt

% Berechnung des Durchmessers
rho_copper = 0,0179;  % Spezifischer Widerstand von Kupfer in Ohm·m
L = 30;  % Länge des Kabels in Metern

% Iteration über verschiedene Durchmesserwerte
for d = linspace(1, 100, 100);
    A = pi/4 * d^2;  % Querschnittsfläche
    J = I / A;  % Stromdichte
    Delta_U = rho_copper * L / A * I;  % Spannungsabfall

    % Überprüfung der Bedingungen
    if J <= J_limit && Delta_U <= Delta_U_limit
        break;  % Durchmesser gefunden
    end
end

disp(['Der Durchmesser des Kabels beträgt etwa ' num2str(d) ' mm.']);

