clear

data = readtable('36_57.csv');
time = data.Var1(1:3:length(data.Var1)); 
density = data.Var2(1:3:length(data.Var1));

Data36_57=loglog(time, density, 'o', 'MarkerEdgeColor', [15, 29, 109]/255, 'MarkerFaceColor', [15, 29, 109]/255, 'MarkerSize', 6); % 使用红色圆点标记
xlabel('$t(\mathrm{s})$', 'FontSize', 16,'interpreter','latex');
ylabel('$P_\mathrm{S}(t)$', 'FontSize', 16,'interpreter','latex');
hold on; 

fitModel = fittype('log(a.*(1+(t/c).^d).^h.*(1+(t/k).^d).^n)', 'independent', 't', 'dependent', 'rho');

opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45,    0.5,  0.1,     -0.2,     10,       1 ], ... 
    'Lower',      [1   ,   0.01,    0,     -1/3,   0.01,      1/3], ... 
    'Upper',      [1   ,      5,    2,     -1/3,    1000,     1/3]); 

[fitresult, gof] = fit(time, log(density), fitModel, opts)

tFit = linspace(0.01, 10^3, 40000);
yFit = fitresult.a.* (1 + (tFit/fitresult.c).^(fitresult.d)).^fitresult.h .* (1 + (tFit/fitresult.k).^fitresult.d).^fitresult.n;
ScalingCrossoverFit=plot(tFit, yFit, '-', 'Color', [15, 29, 109]/255, 'LineWidth',  1.5); 

data = readtable('36_53.csv');
time = data.Var1(1:3:length(data.Var1)); 
density = data.Var2(1:3:length(data.Var1)); 

Data36_53=loglog(time, density, 'o', 'MarkerEdgeColor', [129, 0, 127]/255, 'MarkerFaceColor', [129, 0, 127]/255, 'MarkerSize', 6); 

fitModel = fittype('log(a.*(1+(t/c).^d).^h.*(1+(t/k).^d).^n)', 'independent', 't', 'dependent', 'rho');

opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45,    0.5,  0.1,     -0.2,     10,      1 ], ... 
    'Lower',      [1   ,   0.01,    0,     -1/3,   0.01,     1/3], ... 
    'Upper',      [1   ,      5,    10,     -1/3,    1000,   1/3]); 

[fitresult, gof] = fit(time, log(density), fitModel, opts)

tFit = linspace(0.01, 10^3, 40000); 
yFit = fitresult.a.* (1 + (tFit/fitresult.c).^(fitresult.d)).^fitresult.h .* (1 + (tFit/fitresult.k).^fitresult.d).^fitresult.n;
ScalingCrossoverFit=plot(tFit, yFit, '-', 'Color', [129, 0, 127]/255, 'LineWidth',  1.5); 

data = readtable('36_49.csv');
time = data.Var1(1:3:length(data.Var1)); 
density = data.Var2(1:3:length(data.Var1)); 

Data36_49=loglog(time, density, 'o', 'MarkerEdgeColor', [2, 160, 253]/255, 'MarkerFaceColor', [2, 160, 253]/255, 'MarkerSize', 6); % 使用红色圆点标记

fitModel = fittype('log(a.*(1+(t/c).^d).^h.*(1+(t/k).^d).^n)', 'independent', 't', 'dependent', 'rho');

opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45,    0.5,  0.1,     -0.2,     10,     1 ], ... 
    'Lower',      [1   ,   0.01,    0,     -1/3,   0.01,    1/3], ... 
    'Upper',      [1   ,      5,    2,     -1/3,    200,    1/3]); 

[fitresult, gof] = fit(time, log(density), fitModel, opts);
tFit = linspace(0.01, 10^3, 40000); 
yFit = fitresult.a.* (1 + (tFit/fitresult.c).^(fitresult.d)).^fitresult.h .* (1 + (tFit/fitresult.k).^fitresult.d).^fitresult.n;
ScalingCrossoverFit=plot(tFit, yFit, '-','Color', [2, 160, 253]/255, 'LineWidth',  1.5); 

data = readtable('36_41.csv');
time = data.Var1(1:3:length(data.Var1));
density = data.Var2(1:3:length(data.Var1)); 

Data36_41=loglog(time, density, 'o', 'MarkerEdgeColor', [0, 201, 1]/255, 'MarkerFaceColor', [0, 201, 1]/255,'MarkerSize', 6); 
fitModel = fittype('log(a.*(1+(t/c).^d).^h.*exp(-t/k))', ...
    'independent', 't', ...
    'dependent', 'rho');

opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45,    0.5,    0.1,   -0.2,     10], ... 
    'Lower',      [0   ,   0.01,      0,   -1/3,      0], ... 
    'Upper',      [1   ,      5,     10,   -1/3,    1000]); 

[fitresult, gof] = fit(time, log(density), fitModel, opts)

tFit = linspace(0.01, 10^3, 40000); 
yFit = fitresult.a.* (1 + (tFit/fitresult.c).^(fitresult.d)).^fitresult.h .* exp(-(tFit/fitresult.k));
plot(tFit, yFit, '-', 'Color',[0, 201, 1]/255, 'LineWidth',  1.5); 



data = readtable('36_33.csv');
time = data.Var1(1:3:length(data.Var1)); 
density = data.Var2(1:3:length(data.Var1)); 

Data36_33=loglog(time, density, 'o', 'MarkerEdgeColor', [255, 129, 1]/255, 'MarkerFaceColor', [255, 129, 1]/255,'MarkerSize', 6); % 使用红色圆圈标记

fitModel = fittype('log(a.*(1+(t/c).^d).^h.*exp(-t/k))', ...
    'independent', 't', ...
    'dependent', 'rho');

opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45,    0.5,    0.1,   -0.2,     10], ... 
    'Lower',      [1   ,   0.01,      0,   -1/3,      0], ... 
    'Upper',      [1   ,      5,     10,   -1/3,    200]); 

[fitresult, gof] = fit(time, log(density), fitModel, opts)

tFit = linspace(0.01, 10^3, 40000); 
yFit = fitresult.a.* (1 + (tFit/fitresult.c).^(fitresult.d)).^fitresult.h .* exp(-(tFit/fitresult.k));
plot(tFit, yFit, '-', 'Color', [255, 129, 1]/255, 'LineWidth',  1.5); 


data = readtable('36_25.csv');
time = data.Var1(1:3:length(data.Var1)); 
density = data.Var2(1:3:length(data.Var1)); 

Data36_25=loglog(time, density, 'o', 'MarkerEdgeColor', [175, 24, 24]/255, 'MarkerFaceColor', [175, 24, 24]/255, 'MarkerSize', 6); % 使用红色圆圈标记

fitModel = fittype('log(a.*(1+(t/c).^d).^h.*exp(-t/k))', ...
    'independent', 't', ...
    'dependent', 'rho');

opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45,    0.5,    0.1,   -0.2,     10], ... 
    'Lower',      [1   ,   0.01,      0,   -1/3,      0], ... 
    'Upper',      [1   ,      5,     10,   -1/3,    200]); 

[fitresult, gof] = fit(time, log(density), fitModel, opts)

tFit = linspace(0.01, 10^3, 40000); 
yFit = fitresult.a.* (1 + (tFit/fitresult.c).^(fitresult.d)).^fitresult.h .* exp(-(tFit/fitresult.k));
plot(tFit, yFit, '-', 'Color', [175, 24, 24]/255,'LineWidth',  1.5); 


legend([Data36_57, Data36_53, Data36_49, Data36_41, Data36_33, Data36_25], '$36.57 V$', '$36.53 V$', '$36.49 V$', '$36.41 V$', '$36.33 V$', '$36.25 V$', 'Location', 'Best', 'FontSize', 16, 'Interpreter', 'latex');
legend boxoff;
grid off;
set(gca, 'fontsize', 16);
axis([0.1 1000 0.01 1]);
xticks([0.1, 1, 10, 100, 1000]);

