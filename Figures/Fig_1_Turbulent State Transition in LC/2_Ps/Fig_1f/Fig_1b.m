
data = readtable('36_45.csv');
time = data.Var1;
density = data.Var2; 

Data36_45=loglog(time, density, 'o', 'MarkerEdgeColor', [255, 1, 0]/255, 'MarkerFaceColor', [255, 1, 0]/255,'MarkerSize', 6); % 使用红色圆点标记

hold on; 

fitModel = fittype('log(a.*(1+(t/c).^d).^h)', 'independent', 't', 'dependent', 'rho');
% Parameter m,tao,taostar and n is from Figure A2, where fitting and model validation were performed.
opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45,     0.5,   0.1,   -0.2 ], ...
    'Lower',      [1   ,    2.191,    1.454,     -1/3], ... 
    'Upper',      [1   ,    2.191,    1.454,     -1/3]); 

[fitresult, gof] = fit(time(1:48), log(density(1:48)), fitModel, opts);

tFit = linspace(0.01, 10^3, 40000); 
yFit = fitresult.a .*  (1 + (tFit/fitresult.c).^(fitresult.d)).^fitresult.h;
plot(tFit, yFit, 'b-', 'LineWidth', 1.5); 


fitModelB = fittype('log(a*t.^(-alpha))', 'independent', 't', 'dependent', 'rho');
 opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45,   0.5], ... 
    'Lower',      [0 ,   0.350], ... 
    'Upper',      [2 ,   0.450]);     

[fitresultB, gof] = fit(time(20:48), log(density(20:48)), fitModelB, opts);

yFitB = fitresultB.a.* (tFit).^(-fitresultB.alpha);
plot(tFit, yFitB, 'k--', 'LineWidth', 1.5); 


legendText0 = '$36.45 V$';
legendText3 = sprintf('$\\left[1 + \\left(t/%.2f\\right)^{%.2f}\\right]^{-1/3}$', ...
                    fitresult.c, fitresult.d);
legendText4 = sprintf('${%.2f} t^{-%.3f}$', fitresultB.a, fitresultB.alpha);
legendEntries = {legendText0, legendText3, legendText4};
legend(legendEntries, 'Location', 'SouthWest', 'FontSize', 16, 'Interpreter', 'latex');
legend boxoff;
axis([0.1 10^3 0.01 5])
set(gca, 'fontsize', 16)
xlabel('$t(\mathrm{s})$', 'FontSize', 17,'interpreter','latex');
ylabel('$P_\mathrm{S}(t)$', 'FontSize', 17,'interpreter','latex');
