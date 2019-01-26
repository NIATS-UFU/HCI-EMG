%This function plot the green circles for click_ins and red ones for the
%click_outs

function plotTraceClicks(hAxes,xcoord,ycoord,RGBcolour)
plot(hAxes,xcoord,ycoord,'o','MarkerFaceColor',RGBcolour,'MarkerSize',6,...
    'LineWidth',1, 'MarkerEdgeColor','k');
end