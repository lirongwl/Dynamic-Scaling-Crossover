clf
clc
clear

hold on 

subplot(2,3,1)
voltage = [35.16, 35.12, 35.06, 35.02, 34.92, 34.86];
m       = [1.4335    1.5340    1.6244    1.8403    1.8681    1.7790];
plot(voltage, m, 'o', 'MarkerEdgeColor', [0, 0, 0]/255, 'MarkerFaceColor', [0, 0, 0]/255, 'LineWidth', 1);
xlabel('Voltage (V)', 'FontName', 'Arial', 'FontSize', 16, 'Interpreter', 'latex');
ylabel('$m$', 'FontName', 'Arial', 'FontSize', 16, 'Interpreter', 'latex');
set(gca, 'FontName', 'Arial', 'FontSize', 16);
axis([34.8 35.2 0 3])
text(-0.2, 1.05, 'a', 'FontName', 'Arial', 'FontSize', 16, 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');

subplot(2,3,2)
voltage = [35.16, 35.12, 35.06, 35.02, 34.92, 34.86];
tao     = [0.3742    0.4094    0.4163    0.6521    0.4401    0.4150];
plot(voltage, tao, 'o', 'MarkerEdgeColor', [204, 121, 167]/255, 'MarkerFaceColor', [204, 121, 167]/255, 'LineWidth', 1);
xlabel('Voltage (V)', 'FontName', 'Arial', 'FontSize', 16, 'Interpreter', 'latex');
ylabel('$\tau\ (s)$', 'FontName', 'Arial', 'FontSize', 16, 'Interpreter', 'latex');
set(gca, 'FontName', 'Arial', 'FontSize', 16);
axis([34.8 35.2 0 1])
text(-0.2, 1.05, 'b', 'FontName', 'Arial', 'FontSize', 16, 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');

subplot(2,3,3)
voltage = [35.16, 35.12, 35.06, 35.02, 34.92, 34.86];
taostar = [35.5854433542565, 45.1465423272774, 156.106910705857, 3459.90270759576, 79.9366592399133, 36.7388582653829];
semilogy(voltage, taostar, 'o', 'MarkerEdgeColor', [0, 158, 115]/255, 'MarkerFaceColor', [0, 158, 115]/255, 'LineWidth', 1);
hold on 
voltagefit = 30:0.0001:40;
Vc = 35.025;
nu = 1.3;
tauplus1 = 0.10;
tauplus2 = 0.06;
taostarfit = tauplus1 * (abs(voltagefit.^2 / Vc^2 - 1) .^ -nu) .* (voltagefit < Vc);
semilogy(voltagefit, taostarfit, 'b-', 'LineWidth', 1.5)
taostarfit = tauplus2 * (abs(voltagefit.^2 / Vc^2 - 1) .^ -nu) .* (voltagefit > Vc);
semilogy(voltagefit, taostarfit, 'b-', 'LineWidth', 1.5)
xlabel('Voltage (V)', 'FontName', 'Arial', 'FontSize', 16, 'Interpreter', 'latex');
ylabel('$\tau^*$ (s)', 'FontName', 'Arial', 'FontSize', 16, 'Interpreter', 'latex');
set(gca, 'FontName', 'Arial', 'FontSize', 16);
axis([34.8 35.2 10 10000])
text(-0.2, 1.05, 'c', 'FontName', 'Arial', 'FontSize', 16, 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');

subplot(2,3,4)
voltage = [36.57, 36.53, 36.49, 36.41, 36.33, 36.25];
m       = [1.6006    1.4431    1.5955    1.7079    2.0380    1.1570];
plot(voltage, m, 'o', 'MarkerEdgeColor', [0, 0, 0]/255, 'MarkerFaceColor', [0, 0, 0]/255, 'LineWidth', 1);
xlabel('Voltage (V)', 'FontName', 'Arial', 'FontSize', 16, 'Interpreter', 'latex');
ylabel('$m$', 'FontName', 'Arial', 'FontSize', 12, 'Interpreter', 'latex');
set(gca, 'FontName', 'Arial', 'FontSize', 16);
axis([36.2 36.6 0 3])
text(-0.2, 1.05, 'd', 'FontName', 'Arial', 'FontSize', 16, 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');

subplot(2,3,5)
voltage = [36.57, 36.53, 36.49, 36.41, 36.33, 36.25];
tao     = [3.2567    2.5337    2.7374    2.6994    3.1665    2.8310];
plot(voltage, tao, 'o', 'MarkerEdgeColor', [204, 121, 167]/255, 'MarkerFaceColor', [204, 121, 167]/255, 'LineWidth', 1);
xlabel('Voltage (V)', 'FontName', 'Arial', 'FontSize', 16, 'Interpreter', 'latex');
ylabel('$\tau\ (s)$', 'FontName', 'Arial', 'FontSize', 16, 'Interpreter', 'latex');
set(gca, 'FontName', 'Arial', 'FontSize', 16);
axis([36.2 36.6 0 5])
text(-0.2, 1.05, 'e', 'FontName', 'Arial', 'FontSize', 16, 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');

subplot(2,3,6)
title('P_s(t)') 
voltage = [36.57, 36.53, 36.49, 36.41, 36.33, 36.25];
taostar = [26.6427506997529  49.4070255239120  127.242039380495  999.999898518138  130.616530464301  30.6385054347831];
semilogy(voltage, taostar, 'o', 'MarkerEdgeColor', [0, 158, 115]/255, 'MarkerFaceColor', [0, 158, 115]/255, 'LineWidth', 1);
hold on 
voltagefit = 30:0.0001:40;
Vc = 36.45;
nu = 1.3;
tauplus1 = 0.25;
tauplus2 = 0.04;
taostarfit = tauplus1 * (abs(voltagefit.^2 / Vc^2 - 1) .^ -nu) .* (voltagefit < Vc);
semilogy(voltagefit, taostarfit, 'b-', 'LineWidth', 1.5)
taostarfit = tauplus2 * (abs(voltagefit.^2 / Vc^2 - 1) .^ -nu) .* (voltagefit > Vc);
semilogy(voltagefit, taostarfit, 'b-', 'LineWidth', 1.5)
xlabel('Voltage (V)', 'FontName', 'Arial', 'FontSize', 16, 'Interpreter', 'latex');
ylabel('$\tau^*$ (s)', 'FontName', 'Arial', 'FontSize', 16, 'Interpreter', 'latex');
set(gca, 'FontName', 'Arial', 'FontSize', 16);
axis([36.2 36.6 10 10000])
text(-0.2, 1.05, 'f', 'FontName', 'Arial', 'FontSize', 16, 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');