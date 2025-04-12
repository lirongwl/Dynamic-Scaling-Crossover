currentFolder = fileparts(mfilename('fullpath'));

rhoFolder = fullfile(currentFolder, '1 rho');
psFolder  = fullfile(currentFolder, '2 Ps');

clear; clf; clc;

cd('1_rho/Fig_1e')
subplot(2,3,1)
Fig_1a
text(-0.2, 1.05, 'a', 'FontName', 'Arial', 'FontSize', 16, 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');

hold on
subplot(2,3,2)
Fig_1c
text(-0.2, 1.05, 'b', 'FontName', 'Arial', 'FontSize', 16, 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');

hold on 
subplot(2,3,3)
Fig_1e
text(-0.2, 1.05, 'c', 'FontName', 'Arial', 'FontSize', 16, 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');

cd .. 
cd ..

cd('2_Ps/Fig_1f')

subplot(2,3,4)
Fig_1b
text(-0.2, 1.05, 'd', 'FontName', 'Arial', 'FontSize', 16, 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');

hold on
subplot(2,3,5)
Fig_1d
text(-0.2, 1.05, 'e', 'FontName', 'Arial', 'FontSize', 16, 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');

hold on 
subplot(2,3,6)
Fig_1f
text(-0.2, 1.05, 'f', 'FontName', 'Arial', 'FontSize', 16, 'FontWeight', 'bold', 'Units', 'normalized', 'HorizontalAlignment', 'left');
