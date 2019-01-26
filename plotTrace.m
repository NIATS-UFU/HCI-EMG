%In order to plot the track path
function plotTrace(hAxes,xcoord,ycoord,RGBcolour)
plot(hAxes,xcoord,ycoord,'o','MarkerFaceColor',RGBcolour,'MarkerSize',2,...
    'LineWidth',1, 'MarkerEdgeColor','k');
end