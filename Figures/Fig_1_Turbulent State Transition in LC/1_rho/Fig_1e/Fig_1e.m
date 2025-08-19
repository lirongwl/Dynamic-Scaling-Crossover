clear

data = readtable('35_16.csv');
time = data.Var1(1:3:length(data.Var1)); 
density = data.Var2(1:3:length(data.Var1)); 

Data35_16=loglog(time, density, 'o', 'MarkerEdgeColor', [15, 29, 109]/255, 'MarkerFaceColor', [15, 29, 109]/255, 'MarkerSize', 6); % 使用红色圆点标记
xlabel('$t(\mathrm{s})$', 'FontSize', 16,'interpreter','latex');
ylabel('$\rho(t)$', 'FontSize', 16,'interpreter','latex');
hold on; 


fitModel = fittype('log(a.*(1+(t/c).^d).^h.*(1+(t/k).^d).^n)', 'independent', 't', 'dependent', 'rho');
opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45,    0.5,  0.1,     -0.2,     10,      1 ], ... 
    'Lower',      [1   ,   0.01,    0,     -1/3,   0.01,      1/3], ... 
    'Upper',      [1   ,      5,    2,     -1/3,    100,      1/3]); 

[fitresult, gof] = fit(time, log(density), fitModel, opts);

tFit = linspace(0.01, 10^3, 40000); 
yFit = fitresult.a.* (1 + (tFit/fitresult.c).^(fitresult.d)).^fitresult.h .* (1 + (tFit/fitresult.k).^fitresult.d).^fitresult.n;
ScalingCrossoverFit=plot(tFit, yFit, '-', 'Color', [15, 29, 109]/255, 'LineWidth',  1.5); 

disp('***********35.16V************')
ci = confint(fitresult, 0.95);

paramNames = coeffnames(fitresult);
paramValues = coeffvalues(fitresult);
paramErrors = (ci(2,:) - ci(1,:)) / 2; 

targetParams = {'c','d','k'};
newNames = {'tao', 'm', 'taostar'};


for j = 1:length(paramNames)
    if ismember(paramNames{j}, targetParams)
         newName = newNames{strcmp(paramNames{j}, targetParams)};
        fprintf('%s = %.5f ± %.5f\n', newName, paramValues(j), paramErrors(j));
    end
end

data = readtable('35_12.csv');
time = data.Var1(1:3:length(data.Var1));
density = data.Var2(1:3:length(data.Var1));

Data35_12=loglog(time, density, 'o', 'MarkerEdgeColor', [129, 0, 127]/255, 'MarkerFaceColor', [129, 0, 127]/255, 'MarkerSize', 6); % 使用红色圆点标记
xlabel('$t(s)$', 'FontSize', 16,'interpreter','latex');
ylabel('$\rho(t)$', 'FontSize', 16,'interpreter','latex');
hold on;


fitModel = fittype('log(a.*(1+(t/c).^d).^h.*(1+(t/k).^m).^n)', 'independent', 't', 'dependent', 'rho');
opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45,    0.5,  0.1,     -0.2,     10,     1,    1 ], ... 
    'Lower',      [1   ,   0.01,    0,     -1/3,   0.01,     0,   1/3], ... 
    'Upper',      [1   ,      5,    2,     -1/3,    200,    10,   1/3]); 

[fitresult, gof] = fit(time, log(density), fitModel, opts);

tFit = linspace(0.01, 10^3, 40000); 
yFit = fitresult.a.* (1 + (tFit/fitresult.c).^(fitresult.d)).^fitresult.h .* (1 + (tFit/fitresult.k).^fitresult.d).^fitresult.n;
ScalingCrossoverFit=plot(tFit, yFit, '-', 'Color', [129, 0, 127]/255, 'LineWidth',  1.5); 

disp('***********35.12V************')
ci = confint(fitresult, 0.95);

paramNames = coeffnames(fitresult);
paramValues = coeffvalues(fitresult);
paramErrors = (ci(2,:) - ci(1,:)) / 2; 

targetParams = {'c','d','k'};
newNames = {'tao', 'm', 'taostar'};


for j = 1:length(paramNames)
    if ismember(paramNames{j}, targetParams)
         newName = newNames{strcmp(paramNames{j}, targetParams)};
        fprintf('%s = %.5f ± %.5f\n', newName, paramValues(j), paramErrors(j));
    end
end


data = readtable('35_06.csv');
time = data.Var1(1:3:length(data.Var1)); 
density = data.Var2(1:3:length(data.Var1)); 

Data35_06=loglog(time, density, 'o', 'MarkerEdgeColor', [2, 160, 253]/255, 'MarkerFaceColor', [2, 160, 253]/255, 'MarkerSize', 6); % 使用红色圆点标记
xlabel('$t(s)$', 'FontSize', 17,'interpreter','latex');
ylabel('$\rho(t)$', 'FontSize', 17,'interpreter','latex');
hold on; 

fitModel = fittype('log(a.*(1+(t/c).^d).^h.*(1+(t/k).^m).^n)', 'independent', 't', 'dependent', 'rho');
opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45,    0.5,  0.1,     -0.2,     10,     1,    1 ], ... 
    'Lower',      [1   ,   0.01,    0,     -1/3,   0.01,     0,   1/3], ... 
    'Upper',      [1   ,      5,    2,     -1/3,    200,    10,   1/3]); 

[fitresult, gof] = fit(time, log(density), fitModel, opts);

tFit = linspace(0.01, 10^3, 40000); 
yFit = fitresult.a.* (1 + (tFit/fitresult.c).^(fitresult.d)).^fitresult.h .* (1 + (tFit/fitresult.k).^fitresult.d).^fitresult.n;
ScalingCrossoverFit=plot(tFit, yFit, '-','Color', [2, 160, 253]/255, 'LineWidth',  1.5); 
disp('***********35.06V************')
ci = confint(fitresult, 0.95);

paramNames = coeffnames(fitresult);
paramValues = coeffvalues(fitresult);
paramErrors = (ci(2,:) - ci(1,:)) / 2; 

targetParams = {'c','d','k'};
newNames = {'tao', 'm', 'taostar'};


for j = 1:length(paramNames)
    if ismember(paramNames{j}, targetParams)
         newName = newNames{strcmp(paramNames{j}, targetParams)};
        fprintf('%s = %.5f ± %.5f\n', newName, paramValues(j), paramErrors(j));
    end
end


data = readtable('35_02.csv');
time = data.Var1(1:3:length(data.Var1)); 
density = data.Var2(1:3:length(data.Var1)); 

Data35_02=loglog(time, density, 'o', 'MarkerEdgeColor', [0, 201, 1]/255, 'MarkerFaceColor', [0, 201, 1]/255,'MarkerSize', 6); % 使用红色圆圈标记
xlabel('$t(s)$', 'FontSize', 16,'interpreter','latex');
ylabel('$\rho(t)$', 'FontSize', 16,'interpreter','latex');
hold on; 



fitModel = fittype('log(a.*(1+(t/c).^d).^h.*exp(-t/k))', ...
    'independent', 't', ...
    'dependent', 'rho');
opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45,    0.5,    0.1,   -0.2,     10], ... 
    'Lower',      [0   ,   0.01,      0,   -1/3,      0], ... 
    'Upper',      [1   ,      5,     10,   -1/3,    1000]);

[fitresult, gof] = fit(time, log(density), fitModel, opts);

tFit = linspace(0.01, 10^3, 40000); 
yFit = fitresult.a.* (1 + (tFit/fitresult.c).^(fitresult.d)).^fitresult.h .* exp(-(tFit/fitresult.k));
plot(tFit, yFit, '-', 'Color',[0, 201, 1]/255, 'LineWidth',  1.5); 

disp('***********35.02V************')
ci = confint(fitresult, 0.95);

paramNames = coeffnames(fitresult);
paramValues = coeffvalues(fitresult);
paramErrors = (ci(2,:) - ci(1,:)) / 2; 

targetParams = {'c','d','k'};
newNames = {'tao', 'm', 'taostar'};


for j = 1:length(paramNames)
    if ismember(paramNames{j}, targetParams)
         newName = newNames{strcmp(paramNames{j}, targetParams)};
        fprintf('%s = %.5f ± %.5f\n', newName, paramValues(j), paramErrors(j));
    end
end

data = readtable('34_92.csv');
time = data.Var1(1:3:length(data.Var1)); 
density = data.Var2(1:3:length(data.Var1)); 

Data34_92=loglog(time, density, 'o', 'MarkerEdgeColor', [255, 129, 1]/255, 'MarkerFaceColor', [255, 129, 1]/255,'MarkerSize', 6); % 使用红色圆圈标记
xlabel('$t(s)$', 'FontSize', 17,'interpreter','latex');
ylabel('$\rho(t)$', 'FontSize', 17,'interpreter','latex');
hold on;



fitModel = fittype('log(a.*(1+(t/c).^d).^h.*exp(-t/k))', ...
    'independent', 't', ...
    'dependent', 'rho');

opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45,    0.5,    0.1,   -0.2,     10], ... 
    'Lower',      [1   ,   0.01,      0,   -1/3,      0], ... 
    'Upper',      [1   ,      5,     10,   -1/3,    200]); 

[fitresult, gof] = fit(time, log(density), fitModel, opts);

tFit = linspace(0.01, 10^3, 40000); 
yFit = fitresult.a.* (1 + (tFit/fitresult.c).^(fitresult.d)).^fitresult.h .* exp(-(tFit/fitresult.k));
plot(tFit, yFit, '-', 'Color', [255, 129, 1]/255, 'LineWidth',  1.5); 

disp('***********34.92V************')
ci = confint(fitresult, 0.95);

paramNames = coeffnames(fitresult);
paramValues = coeffvalues(fitresult);
paramErrors = (ci(2,:) - ci(1,:)) / 2; 

targetParams = {'c','d','k'};
newNames = {'tao', 'm', 'taostar'};


for j = 1:length(paramNames)
    if ismember(paramNames{j}, targetParams)
         newName = newNames{strcmp(paramNames{j}, targetParams)};
        fprintf('%s = %.5f ± %.5f\n', newName, paramValues(j), paramErrors(j));
    end
end

data = readtable('34_86.csv');
time = data.Var1(1:3:length(data.Var1)); 
density = data.Var2(1:3:length(data.Var1)); 

Data34_86=loglog(time, density, 'o', 'MarkerEdgeColor', [175, 24, 24]/255, 'MarkerFaceColor', [175, 24, 24]/255, 'MarkerSize', 6); % 使用红色圆圈标记
xlabel('$t(s)$', 'FontSize', 17,'interpreter','latex');
ylabel('$\rho(t)$', 'FontSize', 17,'interpreter','latex');
hold on; 


fitModel = fittype('log(a.*(1+(t/c).^d).^h.*exp(-t/k))', ...
    'independent', 't', ...
    'dependent', 'rho');

opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45,    0.5,    0.1,   -0.2,     10], ... 
    'Lower',      [1   ,   0.01,      0,   -1/3,      0], ... 
    'Upper',      [1   ,      5,     10,   -1/3,    200]); 

[fitresult, gof] = fit(time, log(density), fitModel, opts);

tFit = linspace(0.01, 10^3, 40000); 
yFit = fitresult.a.* (1 + (tFit/fitresult.c).^(fitresult.d)).^fitresult.h .* exp(-(tFit/fitresult.k));
plot(tFit, yFit, '-', 'Color', [175, 24, 24]/255,'LineWidth',  1.5); 

disp('***********34.86V************')
ci = confint(fitresult, 0.95);

paramNames = coeffnames(fitresult);
paramValues = coeffvalues(fitresult);
paramErrors = (ci(2,:) - ci(1,:)) / 2; 

targetParams = {'c','d','k'};
newNames = {'tao', 'm', 'taostar'};


for j = 1:length(paramNames)
    if ismember(paramNames{j}, targetParams)
         newName = newNames{strcmp(paramNames{j}, targetParams)};
        fprintf('%s = %.5f ± %.5f\n', newName, paramValues(j), paramErrors(j));
    end
end

legend([Data35_16, Data35_12, Data35_06, Data35_02, Data34_92, Data34_86], '$35.16 V$', '$35.12 V$', '$35.06 V$', '$35.02 V$', '$34.92 V$', '$34.86 V$',  'Location', 'Best', 'FontSize', 16, 'Interpreter', 'latex');
legend boxoff;
grid off;
set(gca, 'fontsize', 16);
axis([0.1 1000 0.01 1]);
xticks([0.1, 1, 10, 100, 1000]);