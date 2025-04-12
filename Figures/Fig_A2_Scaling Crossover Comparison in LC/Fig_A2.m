clc;
clf;
clear;

subplot(1,2,1);
data1 = readtable('35_04.csv');
time1 = data1.Var1(1:3:length(data1.Var1));
density1 = data1.Var2(1:3:length(data1.Var1));

Data35_04 = loglog(time1, density1, 'o', 'MarkerEdgeColor', [255, 1, 0]/255, 'MarkerFaceColor', [255, 1, 0]/255, 'MarkerSize', 6);
hold on;

fitModel = fittype('log(a.*(1+(t/c).^d).^h)', 'independent', 't', 'dependent', 'rho');
opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45, 0.5, 0.1, -0.2], ...
    'Lower', [1, 0.01, 1.56, -1/3], ...
    'Upper', [1, 5, 1.56, -1/3]);
[fitresult_four1, gof1] = fit(time1(1:48), log(density1(1:48)), fitModel, opts);
tFit1 = linspace(0.01, 10^3, 40000);
yFit_four1 = fitresult_four1.a .* (1 + (tFit1/fitresult_four1.c).^(fitresult_four1.d)).^fitresult_four1.h;
plot(tFit1, yFit_four1, 'b-', 'LineWidth', 1.5); 
legendText1_1 = sprintf('$\\left[1 + \\left(t/%.3f\\right)^{%.2f}\\right]^{-1/3}$', fitresult_four1.c, fitresult_four1.d);

fitModel = fittype('log(a.*(1+(t/c).^d).^h)', 'independent', 't', 'dependent', 'rho');
opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45, 0.5, 0.1, -0.2], ...
    'Lower', [1, 0.01, 1.04, -1/2], ...
    'Upper', [1, 50, 1.04, -1/2]);
[fitresult_three1, gof1] = fit(time1(1:48), log(density1(1:48)), fitModel, opts);
tFit1 = linspace(0.01, 10^3, 40000);
yFit_three1 = fitresult_three1.a .* (1 + (tFit1/fitresult_three1.c).^(fitresult_three1.d)).^fitresult_three1.h;
plot(tFit1, yFit_three1, 'k--', 'LineWidth', 1.5); 
legendText1_2 = sprintf('$\\left[1 + \\left(t/%.3f\\right)^{%.2f}\\right]^{-1/2}$', fitresult_three1.c, fitresult_three1.d);

fitModel = fittype('log(a.*(1+(t/c).^d).^h)', 'independent', 't', 'dependent', 'rho');
opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45, 0.5, 0.1, -0.2], ...
    'Lower', [1, 0.01, 0.521, -1], ...
    'Upper', [1, 50, 0.521, -1]);
[fitresult_two1, gof1] = fit(time1(1:48), log(density1(1:48)), fitModel, opts);
tFit1 = linspace(0.01, 10^3, 40000);
yFit_two1 = fitresult_two1.a .* (1 + (tFit1/fitresult_two1.c).^(fitresult_two1.d)).^fitresult_two1.h;
plot(tFit1, yFit_two1, '-.', 'LineWidth', 1.5, 'Color', [0.5, 0.5, 0.5]); 
legendText1_3 = sprintf('$\\left[1 + \\left(t/%.3f\\right)^{%.3f}\\right]^{-1}$', fitresult_two1.c, fitresult_two1.d);

legendText1_0 = '$35.04 V$';
legendEntries1 = {legendText1_0, legendText1_1, legendText1_2, legendText1_3};
legend(legendEntries1, 'Location', 'NorthEast', 'FontSize', 16, 'FontName', 'Arial', 'Interpreter', 'latex');
legend boxoff;
axis([0.1 10^3 0.01 1]);
set(gca, 'FontName', 'Arial', 'FontSize', 16);
xlabel('$t\ (s)$', 'FontName', 'Arial', 'FontSize', 16, 'Interpreter', 'latex');
ylabel('$\rho(t)$', 'FontName', 'Arial', 'FontSize', 16, 'Interpreter', 'latex');

text(-0.1, 1.05, 'a', 'FontName', 'Arial', 'FontSize', 16, 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');

axes('Position', [0.15, 0.18, 0.15, 0.24]); 
loglog(time1, density1, 'o', 'MarkerEdgeColor', [255, 1, 0]/255, 'MarkerFaceColor', [255, 1, 0]/255, 'MarkerSize', 4);
hold on;
tFit1 = linspace(0.01, 10^3, 40000);
yFit_four1 = fitresult_four1.a .* (1 + (tFit1/fitresult_four1.c).^(fitresult_four1.d)).^fitresult_four1.h;
plot(tFit1, yFit_four1, 'b-', 'LineWidth', 1);
yFit_three1 = fitresult_three1.a .* (1 + (tFit1/fitresult_three1.c).^(fitresult_three1.d)).^fitresult_three1.h;
plot(tFit1, yFit_three1, 'k--', 'LineWidth', 1);
yFit_two1 = fitresult_two1.a .* (1 + (tFit1/fitresult_two1.c).^(fitresult_two1.d)).^fitresult_two1.h;
plot(tFit1, yFit_two1, '-.', 'LineWidth', 1, 'Color', [0.5, 0.5, 0.5]);
axis([0.1 3 0.4 1]);
set(gca, 'FontName', 'Arial', 'FontSize', 16);
set(gca, 'XTick', [0.1, 1], 'YTick', [0.4, 0.6, 0.8, 1]);
hold off;

subplot(1,2,2);
data2 = readtable('36_45.csv');
time2 = data2.Var1;
density2 = data2.Var2;

length(time2);

Data36_45 = loglog(time2, density2, 'o', 'MarkerEdgeColor', [255, 1, 0]/255, 'MarkerFaceColor', [255, 1, 0]/255, 'MarkerSize', 6);
hold on;

fitModel = fittype('log(a.*(1+(t/c).^d).^h)', 'independent', 't', 'dependent', 'rho');
opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45, 0.5, 0.1, -0.2], ...
    'Lower', [1, 0.01, 1.35, -1/3], ...
    'Upper', [1, 5, 1.35, -1/3]);
[fitresult_four2, gof2] = fit(time2(1:48), log(density2(1:48)), fitModel, opts);
tFit2 = linspace(0.01, 10^3, 40000);
yFit_four2 = fitresult_four2.a .* (1 + (tFit2/fitresult_four2.c).^(fitresult_four2.d)).^fitresult_four2.h;
plot(tFit2, yFit_four2, 'b-', 'LineWidth', 1.5); 
legendText2_1 = sprintf('$\\left[1 + \\left(t/%.2f\\right)^{%.2f}\\right]^{-1/3}$', fitresult_four2.c, fitresult_four2.d);

fitModel = fittype('log(a.*(1+(t/c).^d).^h)', 'independent', 't', 'dependent', 'rho');
opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45, 0.5, 0.1, -0.2], ...
    'Lower', [1, 0.01, 0.900, -1/2], ...
    'Upper', [1, 50, 0.900, -1/2]);
[fitresult_three2, gof2] = fit(time2(1:48), log(density2(1:48)), fitModel, opts);
tFit2 = linspace(0.01, 10^3, 40000);
yFit_three2 = fitresult_three2.a .* (1 + (tFit2/fitresult_three2.c).^(fitresult_three2.d)).^fitresult_three2.h;
plot(tFit2, yFit_three2, 'k--', 'LineWidth', 1.5); 
legendText2_2 = sprintf('$\\left[1 + \\left(t/%.2f\\right)^{%.3f}\\right]^{-1/2}$', fitresult_three2.c, fitresult_three2.d);

fitModel = fittype('log(a.*(1+(t/c).^d).^h)', 'independent', 't', 'dependent', 'rho');
opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45, 0.5, 0.1, -0.2], ...
    'Lower', [1, 0.01, 0.450, -1], ...
    'Upper', [1, 50, 0.450, -1]);
[fitresult_two2, gof2] = fit(time2(1:48), log(density2(1:48)), fitModel, opts);
tFit2 = linspace(0.01, 10^3, 40000);
yFit_two2 = fitresult_two2.a .* (1 + (tFit2/fitresult_two2.c).^(fitresult_two2.d)).^fitresult_two2.h;
plot(tFit2, yFit_two2, '-.', 'LineWidth', 1.5, 'Color', [0.5, 0.5, 0.5]); 
legendText2_3 = sprintf('$\\left[1 + \\left(t/%.2f\\right)^{%.3f}\\right]^{-1}$', fitresult_two2.c, fitresult_two2.d);

legendText2_0 = '$36.45 V$';
legendEntries2 = {legendText2_0, legendText2_1, legendText2_2, legendText2_3};
legend(legendEntries2, 'Location', 'NorthEast', 'FontSize', 16, 'FontName', 'Arial', 'Interpreter', 'latex');
legend boxoff;
axis([0.1 10^3 0.1 1]);
set(gca, 'FontName', 'Arial', 'FontSize', 16);
xlabel('$t\ (s)$', 'FontName', 'Arial', 'FontSize', 16, 'Interpreter', 'latex');
ylabel('$P_S(t)$', 'FontName', 'Arial', 'FontSize', 16, 'Interpreter', 'latex');

text(-0.1, 1.05, 'b', 'FontName', 'Arial', 'FontSize', 16, 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');

axes('Position', [0.6, 0.18, 0.15, 0.24]); 
loglog(time2, density2, 'o', 'MarkerEdgeColor', [255, 1, 0]/255, 'MarkerFaceColor', [255, 1, 0]/255, 'MarkerSize', 4);
hold on;
tFit2 = linspace(0.01, 10^3, 40000);
yFit_four2 = fitresult_four2.a .* (1 + (tFit2/fitresult_four2.c).^(fitresult_four2.d)).^fitresult_four2.h;
plot(tFit2, yFit_four2, 'b-', 'LineWidth', 1);
yFit_three2 = fitresult_three2.a .* (1 + (tFit2/fitresult_three2.c).^(fitresult_three2.d)).^fitresult_three2.h;
plot(tFit2, yFit_three2, 'k--', 'LineWidth', 1);
yFit_two2 = fitresult_two2.a .* (1 + (tFit2/fitresult_two2.c).^(fitresult_two2.d)).^fitresult_two2.h;
plot(tFit2, yFit_two2, '-.', 'LineWidth', 1, 'Color', [0.5, 0.5, 0.5]);
axis([0.1 3 0.6 1]);
set(gca, 'FontName', 'Arial', 'FontSize', 16);
set(gca, 'XTick', [0.1, 1], 'YTick', [0.6, 0.7, 0.8, 0.9, 1]);
hold off;