%This function interpolate the vectors X and Y, according to time_vector, 
%creating a new vector (2 columns - x, y) with the positions interpolated  

function [xq, yq] =  interpolate_axes(time, timeq, x, y)

xq = interp1(time,x,double(timeq), 'linear');
yq = interp1(time,y,double(timeq), 'linear');
xq = round(xq);
yq = round(yq);
end