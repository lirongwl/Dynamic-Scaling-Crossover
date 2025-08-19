clf
clc
clear

hold on 
set(gcf, 'Position', [100, 100, 1400, 800]);
subplot(2,3,1)
voltage = [35.16, 35.12, 35.06, 35.02, 34.92, 34.86];
m       = [1.4335    1.5334    1.623    1.6776    1.8681    1.7790];
merror=[0.0320 0.0563 0.0485 0.0896 0.1010 0.1144];

errorbar(voltage, m, merror,'o', 'MarkerEdgeColor', [0, 0, 0]/255, 'Color', [0, 0, 0]/255, 'MarkerFaceColor', [0, 0, 0]/255, 'LineWidth', 1);
xlabel('Voltage (V)', 'FontName', 'Arial', 'FontSize', 13, 'Interpreter', 'latex');
ylabel('$m$', 'FontName', 'Arial', 'FontSize', 13, 'Interpreter', 'latex');
set(gca, 'FontName', 'Arial', 'FontSize', 13);
axis([34.8 35.2 0 3])
yticks(0:1:3)
text(-0.2, 1.05, 'a', 'FontName', 'Arial', 'FontSize', 14, 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');

subplot(2,3,2)
voltage = [35.16, 35.12, 35.06, 35.02, 34.92, 34.86];
tao     = [0.3742    0.4092    0.4157    0.4441    0.4401    0.4150];
taoerror=[0.0224 0.0326 0.0341 0.2547 0.0572 0.0538];
errorbar(voltage, tao,taoerror, 'o', 'MarkerEdgeColor', [204, 121, 167]/255, 'Color', [204, 121, 167]/255,'MarkerFaceColor', [204, 121, 167]/255, 'LineWidth', 1);
xlabel('Voltage (V)', 'FontName', 'Arial', 'FontSize', 13, 'Interpreter', 'latex');
ylabel('$\tau\ (s)$', 'FontName', 'Arial', 'FontSize', 13, 'Interpreter', 'latex');
set(gca, 'FontName', 'Arial', 'FontSize', 13);
axis([34.8 35.2 0 1])
yticks(0:0.2:1)
text(-0.2, 1.05, 'b', 'FontName', 'Arial', 'FontSize', 14, 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');

subplot(2,3,3)
voltage = [35.16, 35.12, 35.06, 35.02, 34.92, 34.86];
taostar = [35.58544 45.29240 157.82441 1000 79.93666 36.73886];
taostarerror=[2.66154 10.45390 42.40781 0 10.33484 4.10942];
errorbar(voltage, taostar,taostarerror, 'o', 'MarkerEdgeColor', [0, 158, 115]/255, 'MarkerFaceColor', [0, 158, 115]/255, 'Color', [0, 158, 115]/255,'LineWidth', 1);
set(gca,'YScale','log');
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
xlabel('Voltage (V)', 'FontName', 'Arial', 'FontSize', 13, 'Interpreter', 'latex');
ylabel('$\tau^*$ (s)', 'FontName', 'Arial', 'FontSize', 13, 'Interpreter', 'latex');
set(gca, 'FontName', 'Arial', 'FontSize', 13);
axis([34.8 35.2 10 10000])
text(-0.2, 1.05, 'c', 'FontName', 'Arial', 'FontSize', 14, 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');



subplot(2,3,4)
voltage = [36.57, 36.53, 36.49, 36.41, 36.33, 36.25];
m       = [1.64211 1.44308 1.59550 1.70789 2.03804 1.15697];
merror2=[0.12241 0.11260 0.07111 0.12955 0.47791 0.25936];
errorbar(voltage, m, merror2,'o', 'MarkerEdgeColor', [0, 0, 0]/255, 'MarkerFaceColor', [0, 0, 0]/255, 'Color', [0, 0, 0]/255, 'LineWidth', 1);
xlabel('Voltage (V)', 'FontName', 'Arial', 'FontSize', 13, 'Interpreter', 'latex');
ylabel('$m$', 'FontName', 'Arial', 'FontSize', 13, 'Interpreter', 'latex');
set(gca, 'FontName', 'Arial', 'FontSize', 13);
axis([36.2 36.6 0 3])
yticks(0:1:3)
text(-0.2, 1.05, 'd', 'FontName', 'Arial', 'FontSize', 14, 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');

subplot(2,3,5)
voltage = [36.57, 36.53, 36.49, 36.41, 36.33, 36.25];
tao     = [3.33883 2.53374 2.73737 2.69938 3.16649 2.83102];
taoerror2=[0.28365 0.30249 0.23415 0.57943 1.32571 0.82283];
errorbar(voltage, tao,taoerror2, 'o', 'MarkerEdgeColor', [204, 121, 167]/255, 'MarkerFaceColor', [204, 121, 167]/255,'Color', [204, 121, 167]/255, 'LineWidth', 1);
xlabel('Voltage (V)', 'FontName', 'Arial', 'FontSize', 13, 'Interpreter', 'latex');
ylabel('$\tau\ (s)$', 'FontName', 'Arial', 'FontSize', 13, 'Interpreter', 'latex');
set(gca, 'FontName', 'Arial', 'FontSize', 13);
axis([36.2 36.6 0 5])
text(-0.2, 1.05, 'e', 'FontName', 'Arial', 'FontSize', 14, 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');

subplot(2,3,6)
title('P_s(t)') 
voltage = [36.57, 36.53, 36.49, 36.41, 36.33, 36.25];
taostar = [25.69596 49.40703 127.24204 999.99990 130.61653 30.63851];
taostarerror2=[3.57915 11.14233 23.52952 574.14630 45.03592 2.86811];
errorbar(voltage, taostar, taostarerror2,'o', 'MarkerEdgeColor', [0, 158, 115]/255,'MarkerFaceColor', [0, 158, 115]/255, 'Color', [0, 158, 115]/255, 'LineWidth', 1);
set(gca,'YScale','log');
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
xlabel('Voltage (V)', 'FontName', 'Arial', 'FontSize', 13, 'Interpreter', 'latex');
ylabel('$\tau^*$ (s)', 'FontName', 'Arial', 'FontSize', 13, 'Interpreter', 'latex');
set(gca, 'FontName', 'Arial', 'FontSize', 13);
axis([36.2 36.6 10 10000])
text(-0.2, 1.05, 'f', 'FontName', 'Arial', 'FontSize', 14, 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');