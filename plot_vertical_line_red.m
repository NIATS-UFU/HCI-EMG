%This function plots the vertical red line that is located at the current
%time event. In order words, the singal that we should focus is where this
%line is.

function plot_vertical_line_red(hAxes,xcoord,RGBcolour)

%[.49 1 .63]
%hAxes = findall(hfig,'type','axes');
delta_y = 10000;
delete (findobj(hAxes,'MarkerFaceColor',RGBcolour));%deleting object
refreshdata(hAxes);%axis update
set(hAxes, 'ColorOrder', RGBcolour);
hold(hAxes,'on');
plot(hAxes,[xcoord xcoord], [-delta_y delta_y], '-','MarkerFaceColor',RGBcolour,'MarkerSize',3,...
    'LineWidth',2, 'LineStyle','--'); %, 'MarkerEdgeColor','k'); %creating new object