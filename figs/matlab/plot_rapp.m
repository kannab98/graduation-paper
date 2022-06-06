
cfg.Vsat = 1.9;
cfg.p = 1.1;
cfg.G = 16;

x = 0:0.01:3;
x_unlim = 0:0.01:1.85;
x_dbm = 10*log10(x.^2/50*1000);
y = InverseRappFn(x, cfg);
y_unlim = InverseRappFnUnlim(x_unlim, cfg);
y_dbm = 10*log10(y.^2/50*1000);


% plot(x_dbm, y_dbm,'--','LineWidth',2,'Color',[0 0 1])
plot(x_unlim, y_unlim,'-','LineWidth',3,'Color',[1 0 0], 'DisplayName', 'Неограниченная F^{-1}_{AM-AM}')
hold on;
plot([cfg.Vsat, cfg.Vsat], [0,10],'k--','LineWidth', 2, 'DisplayName', 'V_{sat}')
plot(x, y,'-','LineWidth',3,'Color',[0 0 1], 'DisplayName', 'Ограниченная F^{-1}_{AM-AM}')


grid on;
% axis equal;
% xlabel("Input power, dBm")
% ylabel("Output power, dBm")
% xlim([-35 20])
% ylim([-20 25])
xlabel("Входная амплитуда, В")
ylabel("Выходная амплитуда, В")
xlim([0 3])
ylim([0 6])
% title('Rapp PA Inverse Distortion')
legend('Location','best')
% legend(["30-70 GHz Rapp PA model" "Adjusted Rapp PA Model" "[1] 135 GHz 2021" "[5] 185 GHz 2020 CT" "[5] 185 GHz 2020 CE" "[2] 180GHz 2018 fig62b" "[2] 210GHz 2018 fig615a" "[5]160GHz2020fig19a"],'Location','best')
ax = gca;
% exportgraphics(ax,'inv_pa.png','Resolution',300) 




function y = RappFn(x, config)
y = config.G.*x./((1+(config.G.*x/config.Vsat).^(2*config.p)).^(1/2/config.p));
end

function y = InverseRappFn(x, config)
border_value = 0.9*config.Vsat;
y = x./(1 - (x./config.Vsat).^(2*config.p)).^(1/2/config.p);
y(x>border_value) = border_value/(1 - (border_value/config.Vsat)^(2*config.p))^(1/2/config.p);
end

function y = InverseRappFnUnlim(x, config)
y = x./(1 - (x./config.Vsat).^(2*config.p)).^(1/2/config.p);
end