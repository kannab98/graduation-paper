% 1 - no pa, 2 - pa
% DFT-s-OFDM, 10 dBm TX, 64QAM, OBO 0 dB 
L2 = findobj(2,'type','line');
set(L2(2),'marker', '+')
L = findobj(1,'type','line');
set(L(2),'color','r')
copyobj(L,findobj(2,'type','axes'));

legend("УМ включен, скомпенсирован", "Изначальное созвездие","УМ выключен",'Location','southeast')
