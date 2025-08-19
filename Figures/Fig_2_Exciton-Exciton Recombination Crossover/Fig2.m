clf;
clc;
clear;

load data;
subplot(1, 2, 1);
loglog(data(:,1), data(:,2), 'ro', 'LineWidth', 2);
hold on;

t = 0.001:0.001:1000;
n2 = -1;
n3 = -1/2;
t2 = 0.3;
t3 = 3.7;
m2 = 4;
Ft = (t/t2).^n2 .* (1 + (t/t3).^m2).^((n3 - n2) / m2);
plot(t, Ft, 'b', 'LineWidth', 2);

xuanzet = data(16:33, 1);  
xuanzey = data(16:33, 2); 

fit_func = @(cnihe, t) (2 * cnihe) ./ (sqrt(1 + 4 * t / 3.8) - 1);
cchushi = 1;
options = optimset('Display', 'off');
cnihe = lsqcurvefit(fit_func, cchushi, xuanzet, xuanzey, [], [], options);
fprintf('The optimized value of n2 is: %.4f\n', cnihe);

ypred = fit_func(cnihe, xuanzet);
SS1 = sum((xuanzey - ypred).^2);      
SS2 = sum((xuanzey - mean(xuanzey)).^2);  
R_squared = 1 - (SS1 / SS2);
fprintf('The R^2 value of the optimized line is: %.4f\n', R_squared);

line = (2 * cnihe) ./ (sqrt(1 + 4 * t / 3.8) - 1);
plot(t, line, 'k--', 'LineWidth', 2);

axis([0.01 200 0.01 2]);
set(gca, 'FontSize', 16, 'FontName', 'Arial', 'LineWidth', 1.5, 'XScale', 'log', 'YScale', 'log'); 
set(gca, 'XTick', [0.01, 0.1, 1, 10, 100]);
set(gca, 'XTickLabel', get(gca, 'XTickLabel'), 'FontName', 'Arial', 'FontSize', 16);
set(gca, 'YTick', [0.01, 0.1, 1]);
set(gca, 'YTickLabel', get(gca, 'YTickLabel'), 'FontName', 'Arial', 'FontSize', 16);

xlabel('$t_{\mathrm{s}} (\mathrm{ps})$', 'FontSize', 16, 'FontName', 'Arial', 'Interpreter', 'latex'); 
ylabel('$\mathrm{normalized\ exciton\ density}$', 'FontSize', 16, 'FontName', 'Arial', 'Interpreter', 'latex');  
legend('experiment', 'equation (20)', 'sequential model', 'Interpreter', 'latex', 'FontSize', 16, 'FontName', 'Arial');
legend('boxoff');
text(-0.1, 1.05, 'a', 'FontSize', 16, 'FontName', 'Arial', 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');

subplot(1, 2, 2);
hold on;

data_exp = readmatrix('experimentdata.xlsx');
x_exp = data_exp(:, 1);
y_exp = data_exp(:, 2);

data_ref = readmatrix('blueline.xlsx');
x_ref = data_ref(:, 1);
y_ref = data_ref(:, 2);

fill([0.01, 0.22, 0.22, 0.01], [-1.05, -1.05, -0.2, -0.2], [192/255, 254/255, 191/255], 'EdgeColor', 'none', 'HandleVisibility', 'off');
fill([0.38, 1.06, 1.06, 0.38], [-1.05, -1.05, -0.2, -0.2], [254/255, 212/255, 213/255], 'EdgeColor', 'none', 'HandleVisibility', 'off');
fill([7.55, 62.2, 62.2, 7.55], [-1.05, -1.05, -0.2, -0.2], [190/255, 254/255, 254/255], 'EdgeColor', 'none', 'HandleVisibility', 'off');

set(gca, 'XScale', 'log', 'FontName', 'Arial', 'LineWidth', 1.5, 'FontSize', 16, 'Layer', 'top');
xlim([0.01, 200]);
ylim([-1.05, -0.2]);
set(gca, 'XTick', [0.01, 0.1, 1, 10, 100]);
set(gca, 'XTickLabel', get(gca, 'XTickLabel'), 'FontName', 'Arial', 'FontSize', 16);
set(gca, 'YTickLabel', get(gca, 'YTickLabel'), 'FontName', 'Arial', 'FontSize', 16);

plot(x_exp, y_exp, 'ro', 'LineWidth', 2, 'DisplayName', 'experimental\ function'); 
plot(x_ref, y_ref, '--k', 'LineWidth', 2.5, 'DisplayName', 'scaling\ prediction');

x_curve = linspace(0.01, 120, 500); 
y_curve = -1 + 1./(2 * (1 + (3.7 ./ x_curve).^4));
plot(x_curve, y_curve, '-b', 'LineWidth', 2, 'DisplayName', 'sequential\ prediction');

plot([0.01, 120], [-0.5, -0.5], '--k', 'LineWidth', 1.5, 'HandleVisibility', 'off');

text(-0.1, 1.05, 'b', 'FontSize', 16, 'FontName', 'Arial', 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');

xlabel('$t_{\mathrm{s}}(\mathrm{ps})$', 'FontName', 'Arial', 'FontSize', 16, 'Interpreter', 'latex');
ylabel('$\alpha^{\prime}$', 'FontName', 'Arial', 'FontSize', 16, 'Interpreter', 'latex');

box on;
hold off;

set(gcf, 'Position', [100, 100, 1700, 600]);