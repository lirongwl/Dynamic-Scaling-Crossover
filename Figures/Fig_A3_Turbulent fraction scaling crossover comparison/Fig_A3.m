clear;
clc
clf

subplot(1,2,1)

% data plot
data = readtable('critical_blue.csv');
time = data.Var1(1:1:length(data.Var1));     
density = data.Var2(1:1:length(data.Var1));  
loglog(time, density, 'o','MarkerEdgeColor', [255, 1, 0]/255, 'MarkerFaceColor', [255, 1, 0]/255, 'MarkerSize', 8);  
hold on;  
% fitting model
fitModel = fittype('log(a.*(1+(t/c).^d).^h)', 'independent', 't', 'dependent', 'rho');
 opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45,    0.5,   0.1,   -0.2], ...  
    'Lower',      [0   ,   0.01,     0,   -1/3], ...  
    'Upper',      [1   ,   10^3,     5,   -1/3]);     
[fitresult, gof] = fit(time, log(density), fitModel, opts)
tFit = 10:10:10^8;  
yFit = fitresult.a.* (1 + (tFit/fitresult.c).^(fitresult.d)).^fitresult.h ;
plot(tFit, yFit, 'b-', 'LineWidth', 2);  
legend_1a = sprintf('${%.2f}\\left[1 + (\\frac{t}{%.1f})^{%.3f}\\right]^{-\\frac{1}{3}}$', fitresult.a, fitresult.c,  fitresult.d);

fitModel = fittype('log(a.*(t.^h))', 'independent', 't', 'dependent', 'rho');
 opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45,   -0.2], 'Lower',      [0   ,     -1], 'Upper',      [10  ,      0]);    
[fitresult, gof] = fit(time, log(density), fitModel, opts)
tFit = 10:10:10^8;  
yFit = fitresult.a.*(tFit.^fitresult.h);
plot(tFit, yFit, 'k--', 'LineWidth', 2);  
legend_1b = sprintf('${%.2f}t^{%.3f}$', fitresult.a, fitresult.h);

legend('critical data', legend_1a, legend_1b,  'Location', 'Best','FontSize', 16,'interpreter','latex');
legend('boxoff')

set(gca, 'FontName', 'Arial', 'LineWidth', 1.4, 'FontSize', 16, 'Layer', 'top');
axis([100 10^6 0.1 1])
xlabel('$t$', 'FontSize', 16,'interpreter','latex');
ylabel('turbulent fraction', 'FontSize', 16,'interpreter','latex');
set(gca, 'FontSize', 16, 'FontName', 'Arial', 'LineWidth', 1.4, 'XScale', 'log', 'YScale', 'log'); 
set(gca, 'XTickLabel', get(gca, 'XTickLabel'), 'FontName', 'Arial', 'FontSize', 16);
set(gca, 'YTickLabel', get(gca, 'YTickLabel'), 'FontName', 'Arial', 'FontSize', 16);

text(-0.1, 1.05, 'a', 'FontSize', 16, 'FontName', 'Arial', 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');

subplot(1,2,2)

% data plot
data = readtable('above_purple.csv');
time = data.Var1(1:1:length(data.Var1));     
density = data.Var2(1:1:length(data.Var1)); 
loglog(time, density, 'o', 'MarkerEdgeColor', [182,9,250]/255, 'MarkerFaceColor', [182,9,250]/255, 'MarkerSize', 8);  
hold on;  
% fitting model
fitModel = fittype('log(a.*(1+(t/c).^d).^h.*(1+(t/k).^d).^(-h))', 'independent', 't', 'dependent', 'rho');
opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [  0.9,    0.5,  0.1,     -0.2,     10], ...  
    'Lower',      [0.821,   0.01,    0,     -1/3,   0.01], ...  
    'Upper',      [ 1   ,   1000,   10,     -1/3,   10^6]);  
[fitresult, gof] = fit(time, log(density), fitModel, opts)
tFit = 10:10:10^8;  
yFit = fitresult.a.* (1 + (tFit/fitresult.c).^(fitresult.d)).^fitresult.h .* (1 + (tFit/fitresult.k).^fitresult.d).^(-fitresult.h);
ScalingCrossoverFit=plot(tFit, yFit, 'b-', 'LineWidth', 1.5); 
legend_2 = sprintf('${%.3f}\\left[\\frac{1 + (t/%.0f)^{%.2f}}{1 + (t/%.0f)^{%.2f}}\\right]^{-\\frac{1}{3}}$', ...
    fitresult.a, fitresult.c, fitresult.d, fitresult.k, fitresult.d);

% data plot
data = readtable('below_yellow.csv');
time = data.Var1(1:1:length(data.Var1)); 
density = data.Var2(1:1:length(data.Var1));  
khaki = [0.9412 0.9020 0.5490];  
loglog(time, density, 'o',  'MarkerEdgeColor', [86, 180, 233]/255, 'MarkerFaceColor', [86, 180, 233]/255, 'MarkerSize', 8);  

% fitting model
fitModel = fittype('log(a.*(1+(t/c).^d).^h.*exp(-t/k))', 'independent', 't', 'dependent', 'rho');
opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [ 0.8,    0.5,    0.1,   -0.2,    1000], ...  
    'Lower',      [0.719,      0,      0,   -1/3,    1000], ...  
    'Upper',      [1,       10^6,    100,   -1/3,    10^6]); 
[fitresult, gof] = fit(time, log(density), fitModel, opts)
tFit = 10:10:10^6; 
yFit = fitresult.a.* (1 + (tFit/fitresult.c).^(fitresult.d)).^fitresult.h .* exp(-(tFit/fitresult.k));
plot(tFit, yFit, 'k--', 'LineWidth', 2); 
legend_3 = sprintf('${%.3f}\\left[1 + (\\frac{t}{%.0f})^{%.2f}\\right]^{-\\frac{1}{3}}e^{-\\frac{t}{%.0f}}$', fitresult.a, fitresult.c, fitresult.d, round(fitresult.k, -2));

legend('upper data', legend_2, 'lower data', legend_3, 'Location', 'Best','FontSize', 16,'interpreter','latex');
legend('boxoff')
set(gca, 'FontName', 'Arial', 'LineWidth', 1.4, 'FontSize', 16, 'Layer', 'top');
axis([100 10^6 0.01 1])
xlabel('$t$', 'FontSize', 16,'interpreter','latex');
ylabel('turbulent fraction', 'FontSize', 16,'interpreter','latex');
set(gca, 'FontSize', 16, 'FontName', 'Arial', 'LineWidth', 1.4, 'XScale', 'log', 'YScale', 'log'); 
set(gca, 'XTickLabel', get(gca, 'XTickLabel'), 'FontName', 'Arial', 'FontSize', 16);
set(gca, 'YTickLabel', get(gca, 'YTickLabel'), 'FontName', 'Arial', 'FontSize', 16);

text(-0.1, 1.05, 'b', 'FontSize', 16, 'FontName', 'Arial', 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');
set(gcf, 'Position', [100, 100, 1700, 600]);