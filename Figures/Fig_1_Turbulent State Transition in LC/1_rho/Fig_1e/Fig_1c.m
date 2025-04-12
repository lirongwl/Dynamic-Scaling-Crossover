clear;

data = readtable('35_16.csv');
time = data.Var1; 
density = data.Var2; 
nu=1.3;
m= 1.3;
tau=0.25;

absepsilon=abs(35.16^2 / 35.04^2 - 1);
Data35_16=loglog(time.*absepsilon.^nu, density.*(1+(time/0.25).^(m)).^(1/3), 'o', 'MarkerEdgeColor', [15, 29, 109]/255, 'MarkerFaceColor', [15, 29, 109]/255, 'MarkerSize', 6); % 使用红色圆点标记
xlabel('$t|\epsilon|^{1.3}(\mathrm{s})$', 'FontSize', 16,'interpreter','latex');
ylabel('$\rho(t)[1+({t/ 0.25})^{1.3}]^{1/3}$', 'FontSize', 16,'interpreter','latex');
hold on; 
axis([10^(-4) 3 0.03 10])

data = readtable('35_12.csv');
time = data.Var1; 
density = data.Var2; 
absepsilon=abs(35.12^2 / 35.04^2 - 1);
Data35_12=loglog(time.*absepsilon.^nu, density.*(1+(time/tau).^m).^(1/3), 'o', 'MarkerEdgeColor', [129, 0, 127]/255, 'MarkerFaceColor', [129, 0, 127]/255, 'MarkerSize', 6); % 使用红色圆点标记

data = readtable('35_08.csv');
time = data.Var1; 
density = data.Var2; 
absepsilon=abs(35.08^2 / 35.04^2 - 1);
Data35_08=loglog(time.*absepsilon.^nu, density.*(1+(time/tau).^m).^(1/3), 'o', 'MarkerEdgeColor', [127, 1, 255]/255, 'MarkerFaceColor', [127, 1, 255]/255, 'MarkerSize', 6); % 使用红色圆点标记

data = readtable('35_06.csv');
time = data.Var1; 
density = data.Var2; 
absepsilon=abs(35.06^2 / 35.04^2 - 1);
Data35_06=loglog(time.*absepsilon.^nu, density.*(1+(time/tau).^m).^(1/3), 'o', 'MarkerEdgeColor', [2, 160, 253]/255, 'MarkerFaceColor', [2, 160, 253]/255,'MarkerSize', 6); % 使用红色圆点标记
set(gca, 'fontsize', 16)

data = readtable('35_02.csv');
time = data.Var1; 
density = data.Var2; 
absepsilon=abs(35.02^2 / 35.04^2 - 1);
Data35_02 = loglog(time.*absepsilon.^nu, density.*(1+(time/tau).^m).^(1/3), 'o', 'MarkerEdgeColor', [0, 201, 1]/255, 'MarkerFaceColor', [0, 201, 1]/255, 'MarkerSize', 6);

data = readtable('34_96.csv');
time = data.Var1; 
density = data.Var2; 
absepsilon=abs(34.96^2 / 35.04^2- 1);
Data34_96=loglog(time.*absepsilon.^nu, density.*(1+(time/tau).^m).^(1/3), 'o', 'MarkerEdgeColor', [181, 155, 26]/255, 'MarkerFaceColor', [181, 155, 26]/255, 'MarkerSize', 6); % 使用红色圆点标记

data = readtable('34_92.csv');
time = data.Var1; 
density = data.Var2; 
absepsilon=abs(34.92^2 / 35.04^2 - 1);
Data34_92=loglog(time.*absepsilon.^nu, density.*(1+(time/tau).^m).^(1/3), 'o', 'MarkerEdgeColor', [255, 129, 1]/255, 'MarkerFaceColor', [255, 129, 1]/255, 'MarkerSize', 6); % 使用红色圆点标记
set(gca, 'fontsize', 16)

data = readtable('34_86.csv');
time = data.Var1; 
density = data.Var2;
absepsilon=abs(34.86^2 / 35.04^2 - 1);
Data34_86=loglog(time.*absepsilon.^nu, density.*(1+(time/tau).^m).^(1/3), 'o', 'MarkerEdgeColor', [175, 24, 24]/255, 'MarkerFaceColor', [175, 24, 24]/255, 'MarkerSize', 6); % 使用红色圆点标记


return
tFit = linspace(10^(-5), 10, 4000); 
yFit = 1.12*(1+(tFit/0.08).^1.3).^(1/3);
plot(tFit, yFit, 'b-', 'LineWidth', 2); 


tFit = linspace(10^(-5), 10, 4000); 
yFit = 1.12*exp(-tFit/0.045);
plot(tFit, yFit, 'b-', 'LineWidth', 2); 




