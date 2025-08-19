clc;
clf;
clear;

subplot(1,2,1);
disp('*******************35.04V********************************')
data1 = readtable('35_04.csv');
time1 = data1.Var1(1:3:99);
density1 = data1.Var2(1:3:99);
tFit1 = linspace(0.01, 10^2, 40000);
Data35_04 = loglog(time1, density1, 'o', 'MarkerEdgeColor', [255, 1, 0]/255, 'MarkerFaceColor', [255, 1, 0]/255, 'MarkerSize', 6);
hold on;
disp('n=-1')
fitModel = fittype('log(a.*(1+(t/c).^d).^h)', 'independent', 't', 'dependent', 'rho');
opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45, 0.5, 0.1, -0.2], ...
    'Lower', [1, 0.01, 0, -1], ...
    'Upper', [1, 50, 5, -1]);
[fitresult_two1, gof1] = fit(time1, log(density1), fitModel, opts)
yFit_two1 = fitresult_two1.a .* (1 + (tFit1/fitresult_two1.c).^(fitresult_two1.d)).^fitresult_two1.h;
plot(tFit1, yFit_two1, '-.', 'LineWidth', 1.5, 'Color', [0.5, 0.5, 0.5]); 
legendText1_1 = sprintf('$\\left[1 + \\left(t/%.2f\\right)^{%.3f}\\right]^{-1}$', fitresult_two1.c, fitresult_two1.d);
disp('n=-1/2')
fitModel = fittype('log(a.*(1+(t/c).^d).^h)', 'independent', 't', 'dependent', 'rho');
opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45, 0.5, 0.1, -0.2], ...
    'Lower', [1, 0.01, 0, -1/2], ...
    'Upper', [1, 50, 5, -1/2]);
[fitresult_three1, gof1] = fit(time1, log(density1), fitModel, opts)
yFit_three1 = fitresult_three1.a .* (1 + (tFit1/fitresult_three1.c).^(fitresult_three1.d)).^fitresult_three1.h;
plot(tFit1, yFit_three1, 'k--', 'LineWidth', 1.5); 
legendText1_2 = sprintf('$\\left[1 + \\left(t/%.3f\\right)^{%.2f}\\right]^{-1/2}$', fitresult_three1.c, fitresult_three1.d);

disp('n=-1/3')
fitModel = fittype('log(a.*(1+(t/c).^d).^h)', 'independent', 't', 'dependent', 'rho');
opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45, 0.5, 0.1, -0.2], ...
    'Lower', [1, 0.01, 0, -1/3], ...
    'Upper', [1, 5, 5, -1/3]);
[fitresult_four1, gof1] = fit(time1, log(density1), fitModel, opts)

yFit_four1 = fitresult_four1.a .* (1 + (tFit1/fitresult_four1.c).^(fitresult_four1.d)).^fitresult_four1.h;
plot(tFit1, yFit_four1, 'b-', 'LineWidth', 1.5); 
legendText1_3 = sprintf('$\\left[1 + \\left(t/%.3f\\right)^{%.2f}\\right]^{-1/3}$', fitresult_four1.c, fitresult_four1.d);

disp('n=-1/4')
fitModel = fittype('log(a.*(1+(t/c).^d).^h)', 'independent', 't', 'dependent', 'rho');
opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45, 0.5, 0.1, -0.2], ...
    'Lower', [1, 0.01, 0, -1/4], ...
    'Upper', [1, 50, 5, -1/4]);
[fitresult_five1, gof1] = fit(time1, log(density1), fitModel, opts)
yFit_five1 = fitresult_five1.a .* (1 + (tFit1/fitresult_five1.c).^(fitresult_five1.d)).^fitresult_five1.h;
plot(tFit1, yFit_five1, 'm--', 'LineWidth', 1.5, 'Color', [0.1216, 0.4667, 0.7059]); 
legendText1_4 = sprintf('$\\left[1 + \\left(t/%.3f\\right)^{%.2f}\\right]^{-1/4}$', fitresult_five1.c, fitresult_five1.d);

disp('n=-1/5')
fitModel = fittype('log(a.*(1+(t/c).^d).^h)', 'independent', 't', 'dependent', 'rho');
opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45, 0.5, 0.1, -0.2], ...
    'Lower', [1, 0.01, 0, -1/5], ...
    'Upper', [1, 50, 5, -1/5]);
[fitresult_six1, gof1] = fit(time1, log(density1), fitModel, opts)
yFit_six1 = fitresult_six1.a .* (1 + (tFit1/fitresult_six1.c).^(fitresult_six1.d)).^fitresult_six1.h;
plot(tFit1, yFit_six1, 'g--', 'LineWidth', 1.5, 'Color', [0.8902, 0.4667, 0.7608]); 
legendText1_5 = sprintf('$\\left[1 + \\left(t/%.3f\\right)^{%.2f}\\right]^{-1/5}$', fitresult_six1.c, fitresult_six1.d);


legendText1_0 = '$35.04 V$';
legendEntries1 = {legendText1_0, legendText1_1, legendText1_2, legendText1_3,legendText1_4,legendText1_5};
legend(legendEntries1, 'Location', 'NorthEast', 'FontSize', 14, 'FontName', 'Arial', 'Interpreter', 'latex');
legend boxoff;
axis([0.1 100 0.03 1]);
set(gca, 'FontName', 'Arial', 'FontSize', 16);
xlabel('$t\ (s)$', 'FontName', 'Arial', 'FontSize', 16, 'Interpreter', 'latex');
ylabel('$\rho(t)$', 'FontName', 'Arial', 'FontSize', 16, 'Interpreter', 'latex');

text(-0.1, 1.05, 'a', 'FontName', 'Arial', 'FontSize', 16, 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');

axes('Position', [0.155, 0.18, 0.20, 0.3]); 
loglog(time1, density1, 'o', 'MarkerEdgeColor', [255, 1, 0]/255, 'MarkerFaceColor', [255, 1, 0]/255, 'MarkerSize', 4);
hold on;
yFit_four1 = fitresult_four1.a .* (1 + (tFit1/fitresult_four1.c).^(fitresult_four1.d)).^fitresult_four1.h;
plot(tFit1, yFit_four1, 'b-', 'LineWidth', 1.5);
yFit_three1 = fitresult_three1.a .* (1 + (tFit1/fitresult_three1.c).^(fitresult_three1.d)).^fitresult_three1.h;
plot(tFit1, yFit_three1, 'k--', 'LineWidth', 1.5);
yFit_two1 = fitresult_two1.a .* (1 + (tFit1/fitresult_two1.c).^(fitresult_two1.d)).^fitresult_two1.h;
plot(tFit1, yFit_two1, '-.', 'LineWidth', 1.5, 'Color', [0.5, 0.5, 0.5]);
yFit_five1 = fitresult_five1.a .* (1 + (tFit1/fitresult_five1.c).^(fitresult_five1.d)).^fitresult_five1.h;
plot(tFit1, yFit_five1, 'm--', 'LineWidth', 1.5, 'Color', [0.1216, 0.4667, 0.7059]);
yFit_six1 = fitresult_six1.a .* (1 + (tFit1/fitresult_six1.c).^(fitresult_six1.d)).^fitresult_six1.h;
plot(tFit1, yFit_six1, 'g--', 'LineWidth', 1.5, 'Color', [0.8902, 0.4667, 0.7608]);
axis([0.1 3 0.4 1]);
set(gca, 'FontName', 'latex', 'FontSize', 14);
set(gca, 'XTick', [0.1, 1], 'YTick', [0.4, 0.6, 0.8, 1]);
hold off;

disp('*******************35.45V********************************')


subplot(1,2,2);
data2 = readtable('36_45.csv');
time2 = data2.Var1(1:3:41);
density2 = data2.Var2(1:3:41);
tFit2 = linspace(0.01, 10^2, 40000);
length(time2);

Data36_45 = loglog(time2, density2, 'o', 'MarkerEdgeColor', [255, 1, 0]/255, 'MarkerFaceColor', [255, 1, 0]/255, 'MarkerSize', 6);
hold on;

disp('n=-1')
fitModel = fittype('log(a.*(1+(t/c).^d).^h)', 'independent', 't', 'dependent', 'rho');
opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45, 0.5, 0.1, -0.2], ...
    'Lower', [1, 0.01, 0, -1], ...
    'Upper', [1, 50, 5, -1]);
[fitresult_two2, gof2] = fit(time2, log(density2), fitModel, opts)
yFit_two2 = fitresult_two2.a .* (1 + (tFit2/fitresult_two2.c).^(fitresult_two2.d)).^fitresult_two2.h;
plot(tFit2, yFit_two2, '-.', 'LineWidth', 1.5, 'Color', [0.5, 0.5, 0.5]); 
legendText2_1 = sprintf('$\\left[1 + \\left(t/%.2f\\right)^{%.3f}\\right]^{-1}$', fitresult_two2.c, fitresult_two2.d);

disp('n=-1/2')

fitModel = fittype('log(a.*(1+(t/c).^d).^h)', 'independent', 't', 'dependent', 'rho');
opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45, 0.5, 0.1, -0.2], ...
    'Lower', [1, 0.01, 0, -1/2], ...
    'Upper', [1, 50, 5, -1/2]);
[fitresult_three2, gof2] = fit(time2, log(density2), fitModel, opts)
yFit_three2 = fitresult_three2.a .* (1 + (tFit2/fitresult_three2.c).^(fitresult_three2.d)).^fitresult_three2.h;
plot(tFit2, yFit_three2, 'k--', 'LineWidth', 1.5); 
legendText2_2 = sprintf('$\\left[1 + \\left(t/%.2f\\right)^{%.2f}\\right]^{-1/2}$', fitresult_three2.c, fitresult_three2.d);

disp('n=-1/3')

fitModel = fittype('log(a.*(1+(t/c).^d).^h)', 'independent', 't', 'dependent', 'rho');
opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45, 0.5, 0.1, -0.2], ...
    'Lower', [1, 0.01, 0, -1/3], ...
    'Upper', [1, 5, 5, -1/3]);
[fitresult_four2, gof2] = fit(time2, log(density2), fitModel, opts)
yFit_four2 = fitresult_four2.a .* (1 + (tFit2/fitresult_four2.c).^(fitresult_four2.d)).^fitresult_four2.h;
plot(tFit2, yFit_four2, 'b-', 'LineWidth', 1.5); 
legendText2_3 = sprintf('$\\left[1 + \\left(t/%.2f\\right)^{%.2f}\\right]^{-1/3}$', fitresult_four2.c, fitresult_four2.d);

disp('n=-1/4')

fitModel = fittype('log(a.*(1+(t/c).^d).^h)', 'independent', 't', 'dependent', 'rho');
opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45, 0.5, 0.1, -0.2], ...
    'Lower', [1, 0.01, 0, -1/4], ...
    'Upper', [1, 50, 5, -1/4]);
[fitresult_five2, gof2] = fit(time2, log(density2), fitModel, opts)
yFit_five2 = fitresult_five2.a .* (1 + (tFit2/fitresult_five2.c).^(fitresult_five2.d)).^fitresult_five2.h;
plot(tFit2, yFit_five2, 'm--', 'LineWidth', 1.5, 'Color', [0.1216, 0.4667, 0.7059]); 
legendText2_4 = sprintf('$\\left[1 + \\left(t/%.2f\\right)^{%.2f}\\right]^{-1/4}$', fitresult_five2.c, fitresult_five2.d);


disp('n=-1/5')
fitModel = fittype('log(a.*(1+(t/c).^d).^h)', 'independent', 't', 'dependent', 'rho');
opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45, 0.5, 0.1, -0.2], ...
    'Lower', [1, 0.01, 0, -1/5], ...
    'Upper', [1, 50, 5, -1/5]);
[fitresult_six2, gof2] = fit(time2, log(density2), fitModel, opts)
yFit_six2 = fitresult_six2.a .* (1 + (tFit2/fitresult_six2.c).^(fitresult_six2.d)).^fitresult_six2.h;
plot(tFit2, yFit_six2, 'g--', 'LineWidth', 1.5, 'Color', [0.8902, 0.4667, 0.7608]); 
legendText2_5 = sprintf('$\\left[1 + \\left(t/%.2f\\right)^{%.2f}\\right]^{-1/5}$', fitresult_six2.c, fitresult_six2.d);


legendText2_0 = '$36.45 V$';
legendEntries2 = {legendText2_0, legendText2_1, legendText2_2, legendText2_3,legendText2_4,legendText2_5};
legend(legendEntries2, 'Location', 'NorthEast', 'FontSize', 14, 'FontName', 'Arial', 'Interpreter', 'latex');
legend boxoff;
axis([0.1 10^2 0.1 1]);
set(gca, 'FontName', 'Arial', 'FontSize', 16);
xlabel('$t\ (s)$', 'FontName', 'Arial', 'FontSize', 16, 'Interpreter', 'latex');
ylabel('$P_S(t)$', 'FontName', 'Arial', 'FontSize', 16, 'Interpreter', 'latex');

text(-0.1, 1.05, 'b', 'FontName', 'Arial', 'FontSize', 16, 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');

axes('Position', [0.6, 0.18, 0.20, 0.3]); 
loglog(time2, density2, 'o', 'MarkerEdgeColor', [255, 1, 0]/255, 'MarkerFaceColor', [255, 1, 0]/255, 'MarkerSize', 4);
hold on;
yFit_four2 = fitresult_four2.a .* (1 + (tFit2/fitresult_four2.c).^(fitresult_four2.d)).^fitresult_four2.h;
plot(tFit2, yFit_four2, 'b-', 'LineWidth', 1.5);
yFit_three2 = fitresult_three2.a .* (1 + (tFit2/fitresult_three2.c).^(fitresult_three2.d)).^fitresult_three2.h;
plot(tFit2, yFit_three2, 'k--', 'LineWidth', 1.5);
yFit_two2 = fitresult_two2.a .* (1 + (tFit2/fitresult_two2.c).^(fitresult_two2.d)).^fitresult_two2.h;
plot(tFit2, yFit_two2, '-.', 'LineWidth', 1.5, 'Color', [0.5, 0.5, 0.5]);
yFit_five2 = fitresult_five2.a .* (1 + (tFit2/fitresult_five2.c).^(fitresult_five2.d)).^fitresult_five2.h;
plot(tFit2, yFit_five2, 'm--', 'LineWidth', 1.5, 'Color', [0.1216, 0.4667, 0.7059]);
yFit_six2 = fitresult_six2.a .* (1 + (tFit2/fitresult_six2.c).^(fitresult_six2.d)).^fitresult_six2.h;
plot(tFit2, yFit_six2, 'g--', 'LineWidth', 1.5, 'Color', [0.8902, 0.4667, 0.7608]);
axis([0.1 3 0.6 1]);
set(gca, 'FontName', 'latex', 'FontSize', 14);
set(gca, 'XTick', [0.1, 1], 'YTick', [0.6, 0.7, 0.8, 0.9, 1]);
hold off;

set(gcf, 'Position', [100, 100, 1700, 600]);