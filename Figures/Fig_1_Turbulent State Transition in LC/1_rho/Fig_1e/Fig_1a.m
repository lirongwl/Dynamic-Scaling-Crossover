
data = readtable('35_04.csv');
time = data.Var1(1:3:length(data.Var1));
density = data.Var2(1:3:length(data.Var1)); 

Data35_04=loglog(time, density, 'o',  'MarkerEdgeColor', [255, 1, 0]/255, 'MarkerFaceColor', [255, 1, 0]/255,'MarkerSize', 6); % 使用红色圆圈标记
hold on; 

fitModel = fittype('log(a.*(1+(t/c).^d).^h)', 'independent', 't', 'dependent', 'rho');
% Parameter m,tao,taostar and n is from Figure A2, where fitting and model validation were performed.
 opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45,    0.5,   0.1,   -0.2], ... 
    'Lower',      [1   ,   0.38,    1.659,   -1/3], ... 
    'Upper',      [1   ,   0.38,    1.659,   -1/3]);    

[fitresult, gof] = fit(time, log(density), fitModel, opts);

tFit = linspace(0.01, 10^3, 40000); 
yFit = fitresult.a.* (1 + (tFit/fitresult.c).^(fitresult.d)).^fitresult.h ;
plot(tFit, yFit, 'b-', 'LineWidth', 1.5); 

fitModelB = fittype('log(a*t.^(-alpha))', 'independent', 't', 'dependent', 'rho');

 opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.45,    0.5], ... 
    'Lower',      [0   ,   0.35], ... 
    'Upper',      [1   ,   0.55]);   

[fitresultB, gof] = fit(time(10:1:length(time)), log(density(10:1:length(time))), fitModelB, opts);

yFitB = fitresultB.a.* (tFit).^(-fitresultB.alpha);
plot(tFit, yFitB, 'k--', 'LineWidth', 1.5); 

legend_N4 = sprintf('$[1 + (t/%.3f)^{%.2f}]^{-1/3}$', fitresult.c,  fitresult.d);

legend_DPscaling = sprintf('${%.3f} t^{-%.3f}$', fitresultB.a,  fitresultB.alpha);


legend('35.04 V', legend_N4, legend_DPscaling,  'Location', 'Best','FontSize', 16,'interpreter','latex');
legend('boxoff')
set(gca, 'fontsize',16)
axis([0.1 10^3 0.01 5])
xlabel('$t(\mathrm{s})$', 'FontSize', 17,'interpreter','latex');
ylabel('$\rho(t)$', 'FontSize', 17,'interpreter','latex');








