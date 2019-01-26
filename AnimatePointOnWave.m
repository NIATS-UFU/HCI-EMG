%% This functions plots the cursor circle and the triangle. The triangle 
%points out the cursor's direction

function AnimatePointOnWave(hAxes,xcoord,ycoord,RGBcolour, direction)

%This is a very useful tool- this deletes every object with this specific 
%atribute - here, it deletes all the objects with the color specified
delete (findobj(hAxes,'MarkerFaceColor',RGBcolour));%deleting object
refreshdata(hAxes);%axis update

hold(hAxes,'on'); 
%Now, we plot the circle again
plot(hAxes,xcoord,ycoord,'o','MarkerFaceColor',RGBcolour,'MarkerSize',6,...
    'LineWidth',2, 'MarkerEdgeColor','k'); %creating new object
hold(hAxes,'on');
%we define here the triangle considering the central point of the circle,
%and the direction of the cursor
switch direction
    case 'UP'
        x_triangle = [xcoord-5, xcoord+5, xcoord, xcoord-5];
        y_triangle = [ycoord+7, ycoord+7, ycoord+15, ycoord+7];
    case 'DOWN'
        x_triangle = [xcoord-5, xcoord+5, xcoord, xcoord-5];
        y_triangle = [ycoord-7, ycoord-7, ycoord-15, ycoord-7];
        
    case 'RIGHT'
         x_triangle = [xcoord+7, xcoord+7, xcoord+15, xcoord+7];
        y_triangle = [ycoord-5, ycoord+5, ycoord, ycoord-5];
    case 'LEFT'
         x_triangle = [xcoord-7, xcoord-7, xcoord-15, xcoord-7];
        y_triangle = [ycoord-5, ycoord+5, ycoord, ycoord-5];
    case ''
        
end
%and now we will plot the triangle, according to its direction
if (string(direction) ~= '')
plot(x_triangle, y_triangle,'MarkerFaceColor', RGBcolour, 'MarkerSize',6, 'LineWidth',2, 'MarkerEdgeColor','k');
end

