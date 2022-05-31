listing = dir('rus/*.fig');
factor = 1.25;
height = factor*6.6818;
width = factor*9.45;

extraInputs = {'interpreter', 'none', 'fontname', "Timew New Roman"};
for i=1:numel(listing)
    [~, name, ~] = fileparts(listing(i).name);
    fig = openfig("rus/"+listing(i).name);
    xlabel("error [deg]",extraInputs{:}, 'fontsize', 12)
    ylabel("CDF",extraInputs{:}, 'fontsize', 12)
    if strcmp(name(end), "1")
        title("Main path", 'fontsize', 12, 'fontname', "Timew New Roman")
    elseif strcmp(name(end), "2")
        title("Backup path", 'fontsize', 12, 'fontname', "Timew New Roman")
    end
    savefig("rus/"+listing(i).name)
    
    
    set(gcf,'PaperUnits','centimeters');
    set(gcf,'PaperSize',[width height]);
    fig = gcf;
    fig.PaperUnits = 'centimeters';
    fig.PaperPosition = [0 0 width height];
    fig.Units = 'centimeters';
    fig.PaperSize = [width height];
    fig.Units = 'centimeters';

    legend("Location", "south east",extraInputs{:}, 'fontsize', 10)
    print(fig, "rus/"+name+".pdf", '-dpdf','-r200'); 

%     exportgraphics(gcf, "rus/"+name+".pdf", 'BackgroundColor', 'none', 'ContentType', 'vector')
%     exportgraphics(gcf, "rus/"+name+".pdf", 'BackgroundColor', 'none', 'ContentType', 'vector')
end