

cfg.Vsat = 1.9;
cfg.p = 1.1;
cfg.G = 16;

% Ver1
% cfg2.Vsat = 1.133;
% cfg2.p = 1.95;
% cfg2.G = 6.05;

% % Ver2
% cfg2.Vsat = 0.721;
% cfg2.p = 1.18;
% cfg2.G = 8.25;
cfg2.Vsat = 1.35;
cfg2.p = 1.41;
cfg2.G = 13.59;

x = 0.005:0.0001:10;
x_dbm = 10*log10(x.^2/50*1000);

y = RappFn(x, cfg);
y_dbm_ideal = 10*log10((cfg.G.*x).^2/50*1000);
y_dbm = 10*log10(y.^2/50*1000);

y_adj = RappFn(x, cfg2);
y_adj_dbm = 10*log10(y_adj.^2/50*1000);
y_adj_dbm_ideal = 10*log10((cfg2.G.*x).^2/50*1000);


PA1_1dB_OUT = min(y_dbm((y_dbm_ideal - y_dbm) > 1));
PA1_1dB_OUT = min(y_dbm((y_dbm_ideal - y_dbm) > 3));
PA2_1dB_OUT = min(y_adj_dbm((y_adj_dbm_ideal - y_adj_dbm) > 1));
fprintf("30-70 GHz 1dB CPout: %d\n",PA1_1dB_OUT)
fprintf("100-200 GHz 1dB CPout: %d\n",PA2_1dB_OUT)
%
plot(x_dbm, y_dbm,'--','LineWidth',2,'Color',[0 0 1])
hold on;
plot(x_dbm, y_dbm_ideal,'--','LineWidth',1,'Color',[0 0 0])

plot(x_dbm, y_adj_dbm,'-','LineWidth',2,'Color',[0 0 1])
plot(x_dbm, y_adj_dbm_ideal,'-.','LineWidth',1,'Color',[0 0 0])
% plot([1.9 1.9], [0, 15], 'k--','LineWidth',2)
grid on;
axis equal;
xlabel("Input power, dBm")
ylabel("Output power, dBm")
xlim([-35 20])
ylim([-20 25])
% title('Rapp PA Inverse Distortion')
legend(["30-70 GHz Rapp PA model" "Adjusted Rapp PA Model" "[1] 135 GHz 2021" "[5] 185 GHz 2020 CT" "[5] 185 GHz 2020 CE" "[2] 180GHz 2018 fig62b" "[2] 210GHz 2018 fig615a" "[5]160GHz2020fig19a"],'Location','best')

function y = RappFn(x, config)
y = config.G.*x./((1+(config.G.*x/config.Vsat).^(2*config.p)).^(1/2/config.p));
end