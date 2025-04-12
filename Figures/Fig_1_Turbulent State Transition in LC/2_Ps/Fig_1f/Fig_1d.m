clear;

data = readtable('36_65.csv');
time = data.Var1; 
density = data.Var2; 
nu=1.3;
m= 1.3;

absepsilon=abs(36.65^2 / 36.45^2 - 1);
Data36_65=loglog(time.*absepsilon.^nu, density.*(1+(time/2.5).^(m)).^(1/3), 'o', 'MarkerEdgeColor', [15, 29, 109]/255, 'MarkerFaceColor', [15, 29, 109]/255,'MarkerSize', 6); % 使用红色圆点标记
xlabel('$t|\epsilon|^{1.3}(\mathrm{s})$', 'FontSize', 16,'interpreter','latex');
ylabel('$P_\mathrm{S}(t)[1+({t/2.5})^{1.3}]^{1/3}$', 'FontSize', 16,'interpreter','latex');
hold on; 
axis([10^(-4) 3 0.03 10])

data = readtable('36_57.csv');
time = data.Var1; 
density = data.Var2; 
absepsilon=abs(36.57^2 / 36.45^2 - 1);
Data36_57=loglog(time.*absepsilon.^nu, density.*(1+(time/2.5).^m).^(1/3), 'o', 'MarkerEdgeColor', [129, 0, 127]/255, 'MarkerFaceColor', [129, 0, 127]/255,'MarkerSize', 6); % 使用红色圆点标记

data = readtable('36_53.csv');
time = data.Var1;
density = data.Var2;
absepsilon=abs(36.53^2 / 36.45^2 - 1);
Data36_53=loglog(time.*absepsilon.^nu, density.*(1+(time/2.5).^m).^(1/3), 'o', 'MarkerEdgeColor', [127, 1, 255]/255, 'MarkerFaceColor', [127, 1, 255]/255,'MarkerSize', 6); % 使用红色圆点标记

data = readtable('36_49.csv');
time = data.Var1;
density = data.Var2;
absepsilon=abs(36.49^2 / 36.45^2 - 1);
Data36_49=loglog(time.*absepsilon.^nu, density.*(1+(time/2.5).^m).^(1/3), 'o', 'MarkerEdgeColor', [2, 160, 253]/255, 'MarkerFaceColor', [2, 160, 253]/255,'MarkerSize', 6); % 使用红色圆点标记
set(gca, 'fontsize', 16)




data = readtable('36_41.csv');
time = data.Var1; 
density = data.Var2; 
absepsilon=abs(36.41^2 / 36.45^2 - 1);
Data36_41=loglog(time.*absepsilon.^nu, density.*(1+(time/2.5).^m).^(1/3), 'o', 'MarkerEdgeColor', [0, 201, 1]/255, 'MarkerFaceColor', [0, 201, 1]/255, 'MarkerSize', 6); % 使用红色圆点标记


data = readtable('36_37.csv');
time = data.Var1; 
density = data.Var2;
absepsilon=abs(36.37^2 / 36.45^2 - 1);
Data36_37=loglog(time.*absepsilon.^nu, density.*(1+(time/2.5).^m).^(1/3), 'o', 'MarkerEdgeColor', [181, 155, 26]/255, 'MarkerFaceColor', [181, 155, 26]/255,'MarkerSize', 6); % 使用红色圆点标记

data = readtable('36_33.csv');
time = data.Var1; 
density = data.Var2; 
absepsilon=abs(36.33^2 / 36.45^2 - 1);
Data36_33=loglog(time.*absepsilon.^nu, density.*(1+(time/2.5).^m).^(1/3), 'o', 'MarkerEdgeColor', [255, 129, 1]/255, 'MarkerFaceColor', [255, 129, 1]/255,'MarkerSize', 6); % 使用红色圆点标记
set(gca, 'fontsize', 16)

data = readtable('36_29.csv');
time = data.Var1;
density = data.Var2; 
absepsilon=abs(36.29^2 / 36.45^2 - 1);
Data36_29=loglog(time.*absepsilon.^nu, density.*(1+(time/2.5).^m).^(1/3), 'o', 'MarkerEdgeColor', [175, 24, 24]/255, 'MarkerFaceColor', [175, 24, 24]/255,'MarkerSize', 6); % 使用红色圆点标记

data = readtable('36_25.csv');
time = data.Var1; 
density = data.Var2; 
absepsilon=abs(36.25^2 / 36.45^2 - 1);
Data36_25=loglog(time.*absepsilon.^nu, density.*(1+(time/2.5).^m).^(1/3), 'o', 'MarkerEdgeColor', [211, 109, 20]/255, 'MarkerFaceColor', [211, 109, 20]/255,'MarkerSize', 6); % 使用红色圆点标记
set(gca, 'fontsize', 16)

